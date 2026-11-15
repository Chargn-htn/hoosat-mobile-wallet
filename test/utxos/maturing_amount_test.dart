import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/core/core_providers.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';
import 'package:hoosat_mobile/utxos/utxos_providers.dart';

Utxo utxo(int amount, int daa) => Utxo(
      address: 'a',
      outpoint: Outpoint(transactionId: 'tx$amount$daa', index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(amount),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.from(daa),
        isCoinbase: false,
      ),
    );

ProviderContainer containerWith(List<Utxo> utxos, int score) {
  final c = ProviderContainer(overrides: [
    utxoListProvider.overrideWithValue(utxos),
    lastKnownVirtualDaaScoreProvider.overrideWith((ref) => BigInt.from(score)),
  ]);
  addTearDown(c.dispose);
  return c;
}

void main() {
  test('zero when there are no utxos', () {
    expect(containerWith([], 5000).read(maturingAmountProvider).raw,
        BigInt.zero);
  });

  test('only counts utxos younger than the maturity threshold', () {
    // score 10000: daa 5000 is old (spendable), daa 9500 and 9100 are young.
    final c = containerWith(
        [utxo(100, 5000), utxo(30, 9500), utxo(7, 9100)], 10000);
    expect(c.read(maturingAmountProvider).raw, BigInt.from(37));
  });

  test('zero once everything is old enough', () {
    final c = containerWith([utxo(100, 5000), utxo(30, 8000)], 10000);
    expect(c.read(maturingAmountProvider).raw, BigInt.zero);
  });

  group('a coin is always either spendable or still arriving, never neither', () {
    test('at every score around the maturity point exactly one is true', () {
      final coins = [utxo(100, 0)];
      for (var score = 995; score <= 1030; score++) {
        final c = containerWith(coins, score);
        final spendable = c.read(spendableUtxosProvider).length;
        final arriving = c.read(maturingAmountProvider).raw > BigInt.zero ? 1 : 0;
        expect(spendable + arriving, 1, reason: 'score $score');
      }
    });

    test('before the first score arrives nothing is called "arriving" and nothing is hidden',
        () {
      final c = containerWith([utxo(100, 5000), utxo(30, 9500)], 0);
      expect(c.read(spendableUtxosProvider).length, 2);
      expect(c.read(maturingAmountProvider).raw, BigInt.zero);
      expect(c.read(nextCoinsReadyProvider), isNull);
    });
  });
}
