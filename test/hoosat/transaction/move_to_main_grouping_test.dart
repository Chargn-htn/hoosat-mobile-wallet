import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/move_to_main_grouping.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';

Utxo _utxo(String address, String txId, {int index = 0, BigInt? amount}) {
  return Utxo(
    address: address,
    outpoint: Outpoint(transactionId: txId, index: index),
    utxoEntry: UtxoEntry(
      amount: amount ?? BigInt.from(1000000), // well above dust floor
      scriptPublicKey: ScriptPublicKey(
        scriptPublicKey: Uint8List(0),
        version: 0,
      ),
      blockDaaScore: BigInt.zero,
      isCoinbase: false,
    ),
  );
}

void main() {
  group('groupUtxosForMoveToMain', () {
    test('returns nothing for an empty list', () {
      final result =
          groupUtxosForMoveToMain([], mainAddress: 'mainAddr');
      expect(result, isEmpty);
    });

    test('excludes utxos belonging to Main itself', () {
      final utxos = [
        _utxo('mainAddr', 'tx1'),
        _utxo('mainAddr', 'tx2'),
      ];
      final result =
          groupUtxosForMoveToMain(utxos, mainAddress: 'mainAddr');
      expect(result, isEmpty);
    });

    test('includes a single utxo on a non-main address (unlike self-compound)',
        () {
      final utxos = [_utxo('addrB', 'tx1')];
      final result =
          groupUtxosForMoveToMain(utxos, mainAddress: 'mainAddr');
      expect(result, hasLength(1));
      expect(result.single.$1, 'addrB');
      expect(result.single.$2, hasLength(1));
    });

    test('excludes an address whose total balance is at or below the dust floor',
        () {
      final utxos = [
        _utxo('addrB', 'tx1', amount: BigInt.from(500)),
      ];
      final result = groupUtxosForMoveToMain(
        utxos,
        mainAddress: 'mainAddr',
        dustFloor: BigInt.from(1000),
      );
      expect(result, isEmpty);
    });

    test('includes an address whose total balance exceeds the dust floor '
        'even if individual utxos are small', () {
      final utxos = [
        _utxo('addrB', 'tx1', amount: BigInt.from(600)),
        _utxo('addrB', 'tx2', amount: BigInt.from(600)),
      ];
      final result = groupUtxosForMoveToMain(
        utxos,
        mainAddress: 'mainAddr',
        dustFloor: BigInt.from(1000),
      );
      expect(result, hasLength(1));
      expect(result.single.$2, hasLength(2));
    });

    test('groups multiple non-main addresses separately, excludes Main', () {
      final utxos = [
        _utxo('mainAddr', 'tx1'),
        _utxo('addrB', 'tx2'),
        _utxo('addrC', 'tx3'),
        _utxo('addrC', 'tx4'),
      ];
      final result =
          groupUtxosForMoveToMain(utxos, mainAddress: 'mainAddr');
      final addresses = result.map((r) => r.$1).toSet();
      expect(addresses, {'addrB', 'addrC'});
    });

    test('splits one address into multiple chunks above the chunk size', () {
      final utxos = List.generate(5, (i) => _utxo('addrB', 'tx$i'));
      final result = groupUtxosForMoveToMain(
        utxos,
        mainAddress: 'mainAddr',
        chunkSize: 2,
      );
      expect(result, hasLength(3)); // 2 + 2 + 1
      expect(result.every((r) => r.$1 == 'addrB'), isTrue);
      final allChunked = result.expand((r) => r.$2).toList();
      expect(allChunked, unorderedEquals(utxos));
    });
  });
}
