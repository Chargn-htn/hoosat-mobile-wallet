import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';
import 'package:hoosat_mobile/utxos/utxos_providers.dart';

Utxo coin(int daa) => Utxo(
      address: 'a',
      outpoint: Outpoint(transactionId: 't$daa', index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(100),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.from(daa),
        isCoinbase: false,
      ),
    );

void main() {
  test('units left for the soonest maturing coin', () {
    // score 10000: a coin born at 9900 has 900 left, one born at 9500 has 500.
    expect(soonestMaturityUnits([coin(9900), coin(9500)], BigInt.from(10000)),
        500);
  });
  test('null when everything can be spent', () {
    expect(soonestMaturityUnits([coin(5000)], BigInt.from(10000)), isNull);
    expect(soonestMaturityUnits([], BigInt.from(10000)), isNull);
  });
  test('plain words', () {
    expect(readyInWords(100, 4), 'less than a minute');
    expect(readyInWords(1000, 4), 'about 5 minutes');
    expect(readyInWords(300, 4), 'about 2 minutes');
    expect(readyInWords(250, 4), 'about 2 minutes'); // 62 s rounds up
  });
  test('the speed is measured from the live score, with a safe default', () {
    final e = DaaRateEstimator();
    expect(e.state, kDefaultDaaPerSecond);
    final t0 = DateTime(2026, 11, 13, 12);
    e.add(BigInt.from(1000), now: t0);
    expect(e.state, kDefaultDaaPerSecond); // too little data yet
    e.add(BigInt.from(1100), now: t0.add(const Duration(seconds: 20)));
    expect(e.state, closeTo(5.0, 0.01));
  });
}
