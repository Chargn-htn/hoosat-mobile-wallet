import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/core/core_providers.dart';
import 'package:hoosat_mobile/hoosat/hoosat_api/types.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';
import 'package:hoosat_mobile/transactions/transaction_providers.dart';
import 'package:hoosat_mobile/transactions/transaction_types.dart';
import 'package:hoosat_mobile/utxos/utxos_providers.dart';

Utxo utxo(String txId, int daa) => Utxo(
      address: 'a',
      outpoint: Outpoint(transactionId: txId, index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(100),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.from(daa),
        isCoinbase: false,
      ),
    );

TxItem item(String id) => TxItem(
      tx: Tx(
        apiTx: ApiTransaction(
            transactionId: id, blockTime: 0, isAccepted: true),
        inputData: const [],
      ),
      outputIndex: 0,
      type: TxItemType.receive,
    );

int? progress(List<Utxo> utxos, int score, String txId) {
  final c = ProviderContainer(overrides: [
    utxoListProvider.overrideWithValue(utxos),
    lastKnownVirtualDaaScoreProvider.overrideWith((ref) => BigInt.from(score)),
  ]);
  addTearDown(c.dispose);
  return c.read(txMaturityProgressProvider(item(txId)));
}

void main() {
  test('counts up from 0 as the score advances', () {
    expect(progress([utxo('A', 10000)], 10000, 'A'), 0);
    expect(progress([utxo('A', 10000)], 10250, 'A'), 250);
    expect(progress([utxo('A', 10000)], 10999, 'A'), 999);
  });

  test('null once the funds are old enough to spend', () {
    expect(progress([utxo('A', 10000)], 11001, 'A'), isNull);
  });

  test('ignores other transactions and transactions with no utxo', () {
    expect(progress([utxo('B', 10000)], 10100, 'A'), isNull);
    expect(progress([], 10100, 'A'), isNull);
  });

  test('uses the newest immature output (change + payment)', () {
    expect(progress([utxo('A', 10000), utxo('A', 10100)], 10200, 'A'), 100);
  });

  test('never goes negative if our score is a little behind', () {
    expect(progress([utxo('A', 10010)], 10000, 'A'), 0);
  });
}
