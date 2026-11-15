import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show visibleForTesting;

import '../hoosat_client.dart';
import '../transaction.dart';
import '../transaction/mass_calculator.dart';
import '../types.dart';
import '../utils.dart';
import 'send_tx.dart';
import 'signer_base.dart';

class WalletService {
  final SignerBase signer;
  final HoosatClient client;

  /// Called with the coins a transaction spent, once the node has accepted it.
  final void Function(Iterable<Outpoint> spent)? onInputsSpent;

  const WalletService({
    required this.signer,
    required this.client,
    this.onInputsSpent,
  });

  SendTx createSendTx({
    required Address toAddress,
    required Amount amount,
    required List<Utxo> spendableUtxos,
    List<Utxo>? selectedUtxos,
    required BigInt feePerInput,
    Amount? priorityFee,
    required Address changeAddress,
    String? note,
    int coinsToKeep = 0,
    int coinsInScope = 0,
  }) {
    final txBuilder = TransactionBuilder(
      utxos: spendableUtxos,
      feePerInput: feePerInput,
      priorityFee: priorityFee,
      coinsToKeep: coinsToKeep,
      coinsInScope: coinsInScope,
    );
    final tx = txBuilder.createUnsignedTransaction(
      toAddress: toAddress,
      amountRaw: amount.raw,
      changeAddress: changeAddress,
      preselectedUtxos: selectedUtxos,
    );

    final massCalculator = MassCalculator(
      massPerTxByte: 1,
      massPerScriptPubKeyByte: 10,
      massPerSigOp: 1000,
      storageMassParameter: kStorageMassParameter,
    );

    final mass = massCalculator.calcTxOverallMass(tx: tx);

    return SendTx(
      uri: HoosatUri(
        address: toAddress,
        amount: amount,
      ),
      tx: tx,
      utxos: txBuilder.selectedUtxos,
      amount: amount,
      change: txBuilder.change,
      changeAddress: txBuilder.changeAddress,
      baseFee: txBuilder.baseFee,
      priorityFee: txBuilder.priorityFee,
      note: note,
      mass: mass,
    );
  }

  SendTx createCompoundTx({
    required Address compoundAddress,
    required List<Utxo> spendableUtxos,
    required BigInt feePerInput,
    Amount? priorityFee,
  }) {
    final selectedUtxos =
        spendableUtxos.take(kMaxInputsPerTransaction).toList();
    final fee = BigInt.from(selectedUtxos.length) * feePerInput +
        (priorityFee?.raw ?? BigInt.zero);
    final selectedTotal = selectedUtxos.fold<BigInt>(
      BigInt.zero,
      (sum, utxo) => sum + utxo.utxoEntry.amount,
    );
    final amountRaw = selectedTotal - fee;

    return createSendTx(
      toAddress: compoundAddress,
      amount: Amount.raw(amountRaw),
      spendableUtxos: spendableUtxos,
      selectedUtxos: selectedUtxos,
      feePerInput: feePerInput,
      priorityFee: priorityFee,
      changeAddress: compoundAddress,
    );
  }

  Future<String> sendTransaction(Transaction tx, {bool rbf = false}) async {
    await signTransaction(tx);

    final rpcTx = tx.toRpc();

    final String txId;
    if (rbf) {
      final result = await client.submitTransactionReplacement(rpcTx);
      txId = result.transactionId;
    } else {
      txId = await client.submitTransaction(rpcTx);
    }
    try {
      onInputsSpent?.call(tx.inputs.map((i) => i.previousOutpoint));
    } catch (_) {
      // The node already has the payment. Bookkeeping that fails here must
      // never turn a successful send into a reported failure (the person
      // might pay twice).
    }
    return txId;
  }

  Future<({String signature, String hash})> signPersonalMessage(
    String message, {
    required Address address,
  }) async {
    final canSign = await signer.canSignForAddress(address);
    if (!canSign) {
      throw Exception('Cannot sign for address $address');
    }

    final hash = hashPersonalMessage(message);
    final signature = await signer.sign(hash, address);
    return (signature: signature.hex, hash: hash.hex);
  }

  /// Signs every input of [tx] in place.
  ///
  /// All the sighashes are worked out first, then the inputs are grouped by
  /// the address they spend from and each address's inputs are signed in ONE
  /// call ([SignerBase.signMany]). A merge has up to 84 coins from one
  /// address, so the key is derived once instead of 84 times.
  ///
  /// The signature scripts are written into [tx] only after EVERY address's
  /// signatures came back complete, so a failure or a short result can never
  /// leave the transaction half signed.
  @visibleForTesting
  Future<void> signTransaction(Transaction tx) async {
    final hashType = SigHashType.sigHashAll;
    final reusedValues = SighashReusedValues();

    final hashes = <Uint8List>[
      for (var index = 0; index < tx.inputs.length; ++index)
        calculateSignatureHashSchnorr(
          tx: tx,
          inputIndex: index,
          hashType: hashType,
          sighashReusedValues: reusedValues,
        ),
    ];

    // input indexes per address, in order of first appearance
    final byAddress = <String, List<int>>{};
    for (var index = 0; index < tx.inputs.length; ++index) {
      byAddress.putIfAbsent(tx.inputs[index].address.encoded, () => []).add(index);
    }

    final scripts = <int, List<int>>{};
    for (final indexes in byAddress.values) {
      final signatures = await signer.signMany(
        [for (final i in indexes) hashes[i]],
        tx.inputs[indexes.first].address,
      );
      if (signatures.length != indexes.length) {
        throw StateError('The signer returned ${signatures.length} '
            'signatures for ${indexes.length} inputs');
      }
      for (var n = 0; n < indexes.length; ++n) {
        final signature = signatures[n];
        scripts[indexes[n]] = [signature.length + 1] + signature + [hashType.raw];
      }
    }
    for (final entry in scripts.entries) {
      tx.inputs[entry.key].signatureScript.setAll(0, entry.value);
    }
  }
}
