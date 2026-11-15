import 'dart:collection';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';

import '../hoosat.dart';
import 'mass_calculator.dart';
import 'txscript.dart';

class TransactionBuilder {
  final List<Utxo> utxos;
  final BigInt feePerInputRaw;
  final Amount priorityFee;

  /// 0 = off. Otherwise: keep about this many coins in the scope being spent
  /// from, by returning change as several coins when there are too few left.
  final int coinsToKeep;

  /// How many coins the scope holds in total (including ones still maturing).
  final int coinsInScope;

  BigInt _change = BigInt.zero;
  Amount get change => Amount.raw(_change);

  Address? _changeAddress;
  Address? get changeAddress => _changeAddress;

  BigInt _baseFee = BigInt.zero;
  Amount get baseFee => Amount.raw(_baseFee);

  List<Utxo> _selectedUtxos = <Utxo>[];
  List<Utxo> get selectedUtxos => UnmodifiableListView(_selectedUtxos);

  TransactionBuilder({
    required this.utxos,
    BigInt? feePerInput,
    Amount? priorityFee,
    this.coinsToKeep = 0,
    this.coinsInScope = 0,
  })  : feePerInputRaw = feePerInput ?? kFeePerInput,
        priorityFee = priorityFee ?? Amount.zero;

  Transaction? rebuildTransaction(
    ApiTransaction tx, {
    required Address toAddress,
    required Address changeAddress,
  }) {
    final amountRaw = BigInt.from(tx.outputs.first.amount);

    final utxoMap = tx.inputs
        .map(
          (input) => (
            input.previousOutpointHash,
            input.previousOutpointIndex.toInt(),
          ),
        )
        .toSet();
    final txUtxos = <Utxo>[];
    for (final utxo in utxos) {
      final outpoint = (utxo.outpoint.transactionId, utxo.outpoint.index);
      if (utxoMap.contains(outpoint)) {
        txUtxos.add(utxo);
        utxoMap.remove(outpoint);
        if (utxoMap.isEmpty) {
          break;
        }
      }
    }

    int index = 0;
    while (index++ < kMaxInputsPerTransaction) {
      try {
        final tx = createUnsignedTransaction(
          toAddress: toAddress,
          amountRaw: amountRaw,
          changeAddress: changeAddress,
          preselectedUtxos: txUtxos,
        );
        return tx;
      } catch (e) {
        if (utxos.length == txUtxos.length) {
          // Not enough funds
          rethrow;
        }
        final newUtxo = utxos.firstWhere(
          (utxo) => !selectedUtxos.contains(utxo),
        );
        txUtxos.add(newUtxo);
      }
    }
    return null;
  }

  Transaction createUnsignedTransaction({
    required Address toAddress,
    required BigInt amountRaw,
    required Address changeAddress,
    List<Utxo>? preselectedUtxos,
  }) {
    _selectedUtxos = preselectedUtxos != null
        ? _userSelectedUtxos(
            userSelectedUtxos: preselectedUtxos,
            spendAmountRaw: amountRaw,
          )
        : _selectUtxos(spendAmount: amountRaw);

    final changeAmount = _getChangeAmountRaw(
      selectedUtxos: _selectedUtxos,
      spendAmount: amountRaw,
    );

    final hasChange = changeAmount >= kMinChangeTarget ||
        changeAmount >= amountRaw ~/ BigInt.two;

    if (!hasChange) {
      _change = BigInt.zero;
      _changeAddress = null;
      _baseFee =
          feePerInputRaw * BigInt.from(_selectedUtxos.length) + changeAmount;
      return _createUnsignedTransaction(
        utxos: _selectedUtxos,
        outputs: [(toAddress, amountRaw)],
      );
    }

    // How many coins to hand the change back as. Each extra coin costs one more
    // "per input" fee, so the fee is worked out together with the count.
    var pieces = 1;
    if (coinsToKeep > 0 && preselectedUtxos == null) {
      pieces = planChangePieces(
        change: changeAmount,
        coinsRemaining:
            (coinsInScope - _selectedUtxos.length).clamp(0, 1 << 30),
        coinsToKeep: coinsToKeep,
        // The node refuses a transaction that creates more than 2 extra coins
        // (outputs - inputs > 2) unless it pays 1 HTN per extra coin. One
        // payment output + pieces change outputs, inputs spent: stay inside it.
        maxPieces: _selectedUtxos.length + 1,
      );
    }

    Transaction build(int n) {
      final each = changeAmount ~/ BigInt.from(n);
      final outputs = <(Address, BigInt)>[(toAddress, amountRaw)];
      for (var k = 0; k < n; k++) {
        // the last coin takes any rounding remainder
        final piece =
            k == n - 1 ? changeAmount - each * BigInt.from(n - 1) : each;
        outputs.add((changeAddress, piece));
      }
      _change = changeAmount;
      _changeAddress = changeAddress;
      _baseFee = feePerInputRaw * BigInt.from(_selectedUtxos.length);
      return _createUnsignedTransaction(utxos: _selectedUtxos, outputs: outputs);
    }

    // A split must keep every coin a sensible size and the transaction well
    // inside the node's limits; otherwise fall back to a single change coin.
    while (pieces > 1) {
      final each = changeAmount ~/ BigInt.from(pieces);
      if (each >= kMinSplitPiece) {
        final candidate = build(pieces);
        final mass =
            MassCalculator.defaultCalculator.calcTxOverallMass(tx: candidate);
        if (mass < kMaximumStandardTransactionMass) return candidate;
      }
      pieces--;
    }
    return build(1);
  }

  Transaction _createUnsignedTransaction({
    required List<Utxo> utxos,
    required List<(Address, BigInt)> outputs,
  }) {
    final inputs = utxos.map((utxo) {
      return TxInput(
        address: Address.decodeAddress(utxo.address),
        previousOutpoint: utxo.outpoint,
        signatureScript: Uint8List(64 + 2),
        sequence: Int64.ZERO,
        sigOpCount: 1,
        utxoEntry: utxo.utxoEntry.copyWith(
          blockDaaScore: kUnacceptedDAASccore.toUnsignedBigInt(),
          isCoinbase: false,
        ),
      );
    });

    // A LIST, not a map: paying an address that the change also goes back to
    // (Main to Main, an account to itself) must give two outputs. As a map the
    // two collapsed into one and the payment silently became extra fee.
    final txOutputs = outputs.map((o) {
      return TxOutput(
        value: o.$2.toInt64(),
        scriptPublicKey: payToAddressScript(o.$1),
      );
    });

    return Transaction(
      version: kMaxTransactionVersion,
      inputs: inputs.toList(),
      outputs: txOutputs.toList(),
      lockTime: Int64.ZERO,
      subnetworkId: kSubnetworkIdNative,
      gas: Int64.ZERO,
      payload: null,
    );
  }

  List<Utxo> _userSelectedUtxos({
    required List<Utxo> userSelectedUtxos,
    required BigInt spendAmountRaw,
  }) {
    final selectedUtxos = List.of(userSelectedUtxos);
    final totalValue = selectedUtxos.fold(
      BigInt.zero,
      (total, utxo) => total + utxo.utxoEntry.amount,
    );

    final baseFeeRaw = feePerInputRaw * BigInt.from(selectedUtxos.length);
    final totalSpendRaw = spendAmountRaw + baseFeeRaw + priorityFee.raw;

    if (totalValue < totalSpendRaw) {
      throw Exception('Not enough funds');
    }

    return selectedUtxos;
  }

  List<Utxo> _selectUtxos({
    required BigInt spendAmount,
  }) {
    // When keeping spare coins, spend ONE coin if one is big enough -- the
    // smallest that is -- and leave the rest untouched and spendable.
    if (coinsToKeep > 0 && utxos.length > 1) {
      final need = spendAmount + feePerInputRaw + priorityFee.raw;
      Utxo? best;
      for (final u in utxos) {
        final left = u.utxoEntry.amount - need;
        // The coin must cover the payment, and what is left over must be
        // exactly nothing or a change coin worth keeping: a smaller leftover
        // would just be swallowed into the fee.
        final fits = left == BigInt.zero || left >= kMinChangeTarget;
        if (fits &&
            (best == null || u.utxoEntry.amount < best.utxoEntry.amount)) {
          best = u;
        }
      }
      if (best != null) return [best];
    }

    final selectedUtxos = <Utxo>[];
    var totalValue = BigInt.zero;

    for (final utxo in utxos) {
      selectedUtxos.add(utxo);
      totalValue += utxo.utxoEntry.amount;

      final baseFeeRaw = feePerInputRaw * BigInt.from(selectedUtxos.length);
      final totalSpend = spendAmount + baseFeeRaw + priorityFee.raw;

      if (totalValue == totalSpend ||
          (totalValue >= totalSpend + kMinChangeTarget &&
              selectedUtxos.length > 1)) {
        break;
      }
    }

    final baseFeeRaw = feePerInputRaw * BigInt.from(selectedUtxos.length);
    final totalSpend = spendAmount + baseFeeRaw + priorityFee.raw;

    if (totalValue < totalSpend) {
      throw Exception('Not enough funds');
    }

    return selectedUtxos;
  }

  BigInt _getChangeAmountRaw({
    required List<Utxo> selectedUtxos,
    required BigInt spendAmount,
  }) {
    var totalValue = BigInt.zero;

    for (final utxo in selectedUtxos) {
      totalValue += utxo.utxoEntry.amount;
    }

    final baseFeeRaw = feePerInputRaw * BigInt.from(selectedUtxos.length);
    final fee = baseFeeRaw + priorityFee.raw;
    final totalSpend = spendAmount + fee;

    return totalValue - totalSpend;
  }
}


/// How many coins the change should be handed back as. Aims to leave
/// [coinsToKeep] coins in the scope after this send, never makes a coin
/// smaller than [kMinSplitPiece], and is 1 whenever enough coins are left.
int planChangePieces({
  required BigInt change,
  required int coinsRemaining,
  int coinsToKeep = kCoinsToKeep,
  BigInt? minPiece,
  int maxPieces = 1 << 30,
}) {
  final wanted = coinsToKeep - coinsRemaining;
  if (wanted <= 1) return 1;
  final byValue = (change ~/ (minPiece ?? kMinSplitPiece)).toInt();
  final room = byValue < 1 ? 1 : byValue;
  var pieces = wanted < room ? wanted : room;
  if (pieces > maxPieces) pieces = maxPieces;
  return pieces < 1 ? 1 : pieces;
}
