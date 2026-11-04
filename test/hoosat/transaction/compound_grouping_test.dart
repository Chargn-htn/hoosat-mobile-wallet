import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/compound_grouping.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';

Utxo _utxo(String address, String txId, {int index = 0, BigInt? amount}) {
  return Utxo(
    address: address,
    outpoint: Outpoint(transactionId: txId, index: index),
    utxoEntry: UtxoEntry(
      amount: amount ?? BigInt.from(1000),
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
  group('groupUtxosForSelfCompound', () {
    test('returns nothing for an empty list', () {
      expect(groupUtxosForSelfCompound([]), isEmpty);
    });

    test('excludes an address with only one utxo', () {
      final utxos = [_utxo('addrA', 'tx1')];
      expect(groupUtxosForSelfCompound(utxos), isEmpty);
    });

    test('groups a single address with multiple utxos into one chunk', () {
      final utxos = [
        _utxo('addrA', 'tx1'),
        _utxo('addrA', 'tx2'),
        _utxo('addrA', 'tx3'),
      ];
      final result = groupUtxosForSelfCompound(utxos);
      expect(result, hasLength(1));
      expect(result.single.$1, 'addrA');
      expect(result.single.$2, hasLength(3));
    });

    test('keeps separate addresses as separate self-compound chunks, '
        'excluding the one with only a single utxo', () {
      final utxos = [
        _utxo('addrA', 'tx1'),
        _utxo('addrA', 'tx2'),
        _utxo('addrB', 'tx3'),
        _utxo('addrB', 'tx4'),
        _utxo('addrB', 'tx5'),
        _utxo('addrC', 'tx6'), // lone utxo, excluded
      ];
      final result = groupUtxosForSelfCompound(utxos);
      final addresses = result.map((r) => r.$1).toList();
      expect(addresses, ['addrA', 'addrB']);
      expect(result.firstWhere((r) => r.$1 == 'addrA').$2, hasLength(2));
      expect(result.firstWhere((r) => r.$1 == 'addrB').$2, hasLength(3));
    });

    test('never mixes utxos from different addresses into one chunk', () {
      final utxos = [
        _utxo('addrA', 'tx1'),
        _utxo('addrB', 'tx2'),
        _utxo('addrA', 'tx3'),
        _utxo('addrB', 'tx4'),
      ];
      final result = groupUtxosForSelfCompound(utxos);
      for (final (address, chunk) in result) {
        expect(chunk.every((u) => u.address == address), isTrue,
            reason: 'chunk for $address contained a utxo from another address');
      }
    });

    test('splits one address into multiple chunks above the chunk size', () {
      final utxos = List.generate(5, (i) => _utxo('addrA', 'tx$i'));
      final result = groupUtxosForSelfCompound(utxos, chunkSize: 2);
      expect(result, hasLength(3)); // 2 + 2 + 1
      expect(result[0].$2, hasLength(2));
      expect(result[1].$2, hasLength(2));
      expect(result[2].$2, hasLength(1));
      // All chunks target the same address, and the union of chunk utxos
      // is exactly the original 5 utxos, none lost or duplicated.
      expect(result.every((r) => r.$1 == 'addrA'), isTrue);
      final allChunked = result.expand((r) => r.$2).toList();
      expect(allChunked, unorderedEquals(utxos));
    });
  });
}
