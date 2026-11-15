import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/hoosat/transaction/mass_calculator.dart';

const mainAddr =
    'hoosat:qp4ad2eh72xc8dtjjyz4llxzq9utn6k26uyl644xxw70wskdfl85zsqj9k4vz';
const otherAddr =
    'hoosat:qpzyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyguuhlqeac';

BigInt hoo(num n) => BigInt.from((n * 100000000).round());

Utxo coin(String tx, BigInt amount, {String address = mainAddr}) => Utxo(
      address: address,
      outpoint: Outpoint(transactionId: tx, index: 0),
      utxoEntry: UtxoEntry(
        amount: amount,
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.zero,
        isCoinbase: false,
      ),
    );

BigInt sumOutputs(Transaction tx) => tx.outputs
    .fold(BigInt.zero, (a, o) => a + o.value.toUnsignedBigInt());

void main() {
  final main = Address.decodeAddress(mainAddr);
  final other = Address.decodeAddress(otherAddr);

  group('paying an address the change also returns to (self-send bug)', () {
    test('Main to Main keeps the payment as its own output', () {
      final b = TransactionBuilder(utxos: [coin('a', hoo(100))]);
      final tx = b.createUnsignedTransaction(
          toAddress: main, amountRaw: hoo(5), changeAddress: main);
      expect(tx.outputs, hasLength(2));
      // nothing vanishes into the fee: inputs = outputs + the normal fee
      expect(hoo(100), sumOutputs(tx) + b.baseFee.raw);
      expect(b.baseFee.raw, kFeePerInput);
    });
  });

  group('keeping a handful of coins, inside the node\'s free limit', () {
    // The node refuses (as "spam") any transaction with more than 2 extra
    // outputs (outputs - inputs) unless it pays 1 HTN per extra output.
    void expectNodeAccepts(Transaction tx, BigInt fee) {
      final extra = tx.outputs.length - tx.inputs.length;
      expect(extra > 2 ? fee >= BigInt.from(extra) * kSompiPerHoosat : true,
          isTrue,
          reason: 'node would reject this as spam: $extra extra outputs');
    }

    test('one big coin: one more coin per send, never past the free limit', () {
      final b = TransactionBuilder(
        utxos: [coin('big', hoo(545000))],
        coinsToKeep: 10,
        coinsInScope: 1,
      );
      final tx = b.createUnsignedTransaction(
          toAddress: other, amountRaw: hoo(5), changeAddress: main);
      expect(tx.inputs, hasLength(1));
      expect(tx.outputs, hasLength(1 + 2)); // payment + 2 change coins
      expect(tx.outputs.length - tx.inputs.length, lessThanOrEqualTo(2));
      expectNodeAccepts(tx, b.baseFee.raw);
      // the money adds up exactly, at the normal one-input fee
      expect(hoo(545000), sumOutputs(tx) + b.baseFee.raw);
      expect(b.baseFee.raw, kFeePerInput);
    });

    test('two coins spent: up to 3 change coins', () {
      // the payment is larger than any single coin, so two are needed
      final coins = [coin('a', hoo(60000)), coin('b', hoo(55000))];
      final b = TransactionBuilder(
          utxos: coins, coinsToKeep: 10, coinsInScope: 2);
      final tx = b.createUnsignedTransaction(
          toAddress: other, amountRaw: hoo(100000), changeAddress: main);
      expect(tx.inputs, hasLength(2));
      expect(tx.outputs.length - tx.inputs.length, lessThanOrEqualTo(2));
      expectNodeAccepts(tx, b.baseFee.raw);
    });

    test('already 10 coins: spend ONE coin, change stays one coin', () {
      final coins = [for (var i = 0; i < 10; i++) coin('c$i', hoo(54000 + i))];
      final b = TransactionBuilder(
          utxos: coins, coinsToKeep: 10, coinsInScope: 10);
      final tx = b.createUnsignedTransaction(
          toAddress: other, amountRaw: hoo(5), changeAddress: main);
      expect(tx.inputs, hasLength(1));
      expect(tx.outputs, hasLength(2));
    });

    test('a small account is not split into dust', () {
      final b = TransactionBuilder(
        utxos: [coin('small', hoo(10), address: otherAddr)],
        coinsToKeep: 10,
        coinsInScope: 1,
      );
      final tx = b.createUnsignedTransaction(
          toAddress: main, amountRaw: hoo(1), changeAddress: other);
      expect(tx.outputs, hasLength(2)); // payment + ONE change coin
    });

    test('NO send the wallet builds can trip the node spam rule', () {
      for (final coinCount in [1, 2, 3, 10, 25]) {
        for (final amount in [1, 5, 500, 40000]) {
          final coins = [
            for (var i = 0; i < coinCount; i++) coin('c$i', hoo(50000 + i))
          ];
          final b = TransactionBuilder(
              utxos: coins, coinsToKeep: 10, coinsInScope: coinCount);
          final tx = b.createUnsignedTransaction(
              toAddress: other, amountRaw: hoo(amount), changeAddress: main);
          expectNodeAccepts(tx, b.baseFee.raw);
          // far below the node's standard-transaction mass limit
          final mass = MassCalculator.defaultCalculator.calcTxOverallMass(tx: tx);
          expect(mass, lessThan(kMaximumStandardTransactionMass ~/ BigInt.from(4)));
        }
      }
    });

    test('switched off (default): behaves exactly as before', () {
      final coins = [coin('a', hoo(100)), coin('b', hoo(50))];
      final b = TransactionBuilder(utxos: coins);
      final tx = b.createUnsignedTransaction(
          toAddress: other, amountRaw: hoo(5), changeAddress: main);
      expect(tx.inputs, hasLength(2)); // the old "at least two coins" rule
      expect(tx.outputs, hasLength(2));
    });
  });

  group('planChangePieces', () {
    test('enough coins left: one change coin', () {
      expect(planChangePieces(change: hoo(1000), coinsRemaining: 10), 1);
      expect(planChangePieces(change: hoo(1000), coinsRemaining: 9), 1);
    });
    test('tops up to the target', () {
      expect(planChangePieces(change: hoo(100000), coinsRemaining: 0), 10);
      expect(planChangePieces(change: hoo(100000), coinsRemaining: 4), 6);
    });
    test('never below the minimum coin size', () {
      expect(planChangePieces(change: hoo(350), coinsRemaining: 0), 3);
      expect(planChangePieces(change: hoo(50), coinsRemaining: 0), 1);
    });
    test('never more than the free limit the node allows', () {
      expect(
          planChangePieces(
              change: hoo(100000), coinsRemaining: 0, maxPieces: 2),
          2);
      expect(
          planChangePieces(
              change: hoo(100000), coinsRemaining: 0, maxPieces: 1),
          1);
    });
  });

  group('the single coin chosen never leaves a leftover that vanishes into the fee',
      () {
    test('a coin that would leave ~0.1 HTN is skipped for a bigger one', () {
      final b = TransactionBuilder(
        utxos: [coin('small', hoo(100.1)), coin('big1', hoo(500)), coin('big2', hoo(500))],
        coinsToKeep: 10,
      );
      final tx = b.createUnsignedTransaction(
          toAddress: other, amountRaw: hoo(100), changeAddress: main);
      expect(tx.inputs, hasLength(1));
      expect(tx.inputs.first.previousOutpoint.transactionId, isNot('small'));
      // nothing but the normal fee is lost
      expect(hoo(500), sumOutputs(tx) + b.baseFee.raw);
    });

    test('a coin that fits exactly is still chosen', () {
      final b = TransactionBuilder(
        utxos: [coin('exact', hoo(100) + kFeePerInput), coin('big', hoo(500))],
        coinsToKeep: 10,
      );
      final tx = b.createUnsignedTransaction(
          toAddress: other, amountRaw: hoo(100), changeAddress: main);
      expect(tx.inputs.single.previousOutpoint.transactionId, 'exact');
    });
  });
}
