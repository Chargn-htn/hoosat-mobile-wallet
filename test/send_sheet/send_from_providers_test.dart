import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/send_sheet/send_from_providers.dart';
import 'package:hoosat_mobile/utxos/utxos_providers.dart';
import 'package:hoosat_mobile/wallet_address/wallet_address.dart';

// Arbitrary-but-valid-shaped public key bytes (not a real key, just the
// right length) so Address.publicKey can encode a real, distinct bech32
// string per seed -- these tests only care about string equality and
// arithmetic, not real cryptographic validity.
WalletAddress _walletAddress(int seed) {
  final address = Address.publicKey(
    prefix: AddressPrefix.hoosat,
    publicKey: Uint8List.fromList(List.filled(kPublicKeyLength, seed)),
  );
  return WalletAddress(
    index: 0,
    type: AddressType.receive,
    name: 'Test',
    address: address,
    used: true,
  );
}

Utxo _utxo(String address, String txId, {BigInt? amount}) {
  return Utxo(
    address: address,
    outpoint: Outpoint(transactionId: txId, index: 0),
    utxoEntry: UtxoEntry(
      amount: amount ?? BigInt.from(1000000),
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
  final addressA = _walletAddress(1);
  final addressB = _walletAddress(2);
  final addressC = _walletAddress(3);

  group('sendSpendableUtxosForProvider', () {
    test('returns every utxo when address is null (Any)', () {
      final utxos = [
        _utxo(addressA.encoded, 'tx1'),
        _utxo(addressB.encoded, 'tx2'),
      ];
      final container = ProviderContainer(overrides: [
        spendableUtxosProvider.overrideWithValue(utxos),
      ]);
      addTearDown(container.dispose);

      final result = container.read(sendSpendableUtxosForProvider(null));
      expect(result, hasLength(2));
    });

    test("filters to only the chosen address's utxos", () {
      final utxos = [
        _utxo(addressA.encoded, 'tx1'),
        _utxo(addressA.encoded, 'tx2'),
        _utxo(addressB.encoded, 'tx3'),
      ];
      final container = ProviderContainer(overrides: [
        spendableUtxosProvider.overrideWithValue(utxos),
      ]);
      addTearDown(container.dispose);

      final result =
          container.read(sendSpendableUtxosForProvider(addressA));
      expect(result, hasLength(2));
      expect(result.every((u) => u.address == addressA.encoded), isTrue);
    });

    test('returns empty for an address with no utxos', () {
      final utxos = [_utxo(addressA.encoded, 'tx1')];
      final container = ProviderContainer(overrides: [
        spendableUtxosProvider.overrideWithValue(utxos),
      ]);
      addTearDown(container.dispose);

      final result =
          container.read(sendSpendableUtxosForProvider(addressC));
      expect(result, isEmpty);
    });
  });

  group('maxSendForProvider', () {
    test('Any sums every address, matching the un-scoped max', () {
      final utxos = [
        _utxo(addressA.encoded, 'tx1', amount: BigInt.from(1000000)),
        _utxo(addressB.encoded, 'tx2', amount: BigInt.from(2000000)),
      ];
      final container = ProviderContainer(overrides: [
        spendableUtxosProvider.overrideWithValue(utxos),
      ]);
      addTearDown(container.dispose);

      final maxAny = container.read(maxSendForProvider(null));
      // 3,000,000 total minus 2 inputs worth of fee.
      expect(maxAny.raw, BigInt.from(3000000) - kFeePerInput * BigInt.from(2));
    });

    test('a specific address only counts its own utxos toward max', () {
      final utxos = [
        _utxo(addressA.encoded, 'tx1', amount: BigInt.from(1000000)),
        _utxo(addressB.encoded, 'tx2', amount: BigInt.from(2000000)),
      ];
      final container = ProviderContainer(overrides: [
        spendableUtxosProvider.overrideWithValue(utxos),
      ]);
      addTearDown(container.dispose);

      final maxA = container.read(maxSendForProvider(addressA));
      // Only addressA's 1,000,000, minus 1 input's fee -- addressB's
      // larger balance must never leak into this address-scoped max.
      expect(maxA.raw, BigInt.from(1000000) - kFeePerInput);
    });

    test('returns zero for an address with no spendable utxos', () {
      final utxos = [_utxo(addressA.encoded, 'tx1')];
      final container = ProviderContainer(overrides: [
        spendableUtxosProvider.overrideWithValue(utxos),
      ]);
      addTearDown(container.dispose);

      final maxB = container.read(maxSendForProvider(addressB));
      expect(maxB.raw, BigInt.zero);
    });
  });
}
