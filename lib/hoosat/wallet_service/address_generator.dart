import 'dart:io' show Platform;
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';

import '../types.dart';
import 'wallet.dart';

/// Derives public keys on background workers (one per core, at most four) so
/// the screen keeps drawing and slow phones use all their cores. Pure maths:
/// only text and numbers cross to the workers.
List<Uint8List> _deriveKeys(
  String hdPublicKey,
  bool ecdsa,
  int typeIndex,
  int start,
  int count,
) {
  final HdWalletView w =
      ecdsa ? HdWalletViewECDSA(hdPublicKey) : HdWalletViewSchnorr(hdPublicKey);
  return [
    for (var i = start; i < start + count; i++)
      w.derivePublicKey(typeIndex: typeIndex, index: i),
  ];
}

Future<List<Uint8List>> deriveKeysInBackground({
  required String hdPublicKey,
  required bool ecdsa,
  required int typeIndex,
  required int startIndex,
  required int count,
}) async {
  final workers = max(1, min(4, Platform.numberOfProcessors - 1));
  final per = (count / workers).ceil();
  final jobs = <Future<List<Uint8List>>>[];
  for (var from = 0; from < count; from += per) {
    final n = min(per, count - from);
    final start = startIndex + from;
    jobs.add(Isolate.run(
      () => _deriveKeys(hdPublicKey, ecdsa, typeIndex, start, n),
    ));
  }
  return [for (final part in await Future.wait(jobs)) ...part];
}

typedef LegacyPubKeyCallback = Future<Uint8List> Function({
  required int typeIndex,
  required int index,
});

abstract class HdAddressGenerator {
  Address get mainAddress;
  AddressPrefix get addressPrefix => mainAddress.prefix;

  const HdAddressGenerator();
  Future<Address> receiveAddressAtIndex(int index) =>
      addressAtIndex(typeIndex: 0, index: index);

  Future<Address> changeAddressAtIndex(int index) =>
      addressAtIndex(typeIndex: 1, index: index);

  Future<Address> addressAtIndex({
    required int typeIndex,
    required int index,
  });

  /// [count] consecutive addresses. Generators that can do the maths off the
  /// UI thread override this; the default derives one at a time.
  Future<List<Address>> addressesAt({
    required int typeIndex,
    required int startIndex,
    required int count,
  }) async {
    return [
      for (var i = startIndex; i < startIndex + count; i++)
        await addressAtIndex(typeIndex: typeIndex, index: i),
    ];
  }
}

class SchnorrAddressGenerator extends HdAddressGenerator {
  late final HdWalletView wallet;
  late final Address mainAddress;
  final String _hdPublicKey;

  SchnorrAddressGenerator({
    required String hdPublicKey,
    required AddressPrefix addressPrefix,
  }) : _hdPublicKey = hdPublicKey {
    wallet = HdWalletViewSchnorr(hdPublicKey);
    final pubKey = wallet.derivePublicKey(typeIndex: 0, index: 0);
    mainAddress = Address.publicKey(prefix: addressPrefix, publicKey: pubKey);
  }

  Future<Address> addressAtIndex({
    required int typeIndex,
    required int index,
  }) async {
    final pubKey = wallet.derivePublicKey(typeIndex: typeIndex, index: index);
    return Address.publicKey(prefix: addressPrefix, publicKey: pubKey);
  }

  @override
  Future<List<Address>> addressesAt({
    required int typeIndex,
    required int startIndex,
    required int count,
  }) async {
    if (count < 8) {
      return super.addressesAt(
        typeIndex: typeIndex,
        startIndex: startIndex,
        count: count,
      );
    }
    final keys = await deriveKeysInBackground(
      hdPublicKey: _hdPublicKey,
      ecdsa: false,
      typeIndex: typeIndex,
      startIndex: startIndex,
      count: count,
    );
    return [
      for (final k in keys)
        Address.publicKey(prefix: addressPrefix, publicKey: k),
    ];
  }
}

class EcdsaAddressGenerator extends HdAddressGenerator {
  late final HdWalletView wallet;
  late final Address mainAddress;
  final String _hdPublicKey;

  EcdsaAddressGenerator({
    required String hdPublicKey,
    required AddressPrefix addressPrefix,
  }) : _hdPublicKey = hdPublicKey {
    wallet = HdWalletViewECDSA(hdPublicKey);
    final pubKey = wallet.derivePublicKey(typeIndex: 0, index: 0);
    mainAddress = Address.pubKeyECDSA(prefix: addressPrefix, publicKey: pubKey);
  }

  Future<Address> addressAtIndex({
    required int typeIndex,
    required int index,
  }) async {
    final pubKey = wallet.derivePublicKey(typeIndex: typeIndex, index: index);
    return Address.pubKeyECDSA(prefix: addressPrefix, publicKey: pubKey);
  }

  @override
  Future<List<Address>> addressesAt({
    required int typeIndex,
    required int startIndex,
    required int count,
  }) async {
    if (count < 8) {
      return super.addressesAt(
        typeIndex: typeIndex,
        startIndex: startIndex,
        count: count,
      );
    }
    final keys = await deriveKeysInBackground(
      hdPublicKey: _hdPublicKey,
      ecdsa: true,
      typeIndex: typeIndex,
      startIndex: startIndex,
      count: count,
    );
    return [
      for (final k in keys)
        Address.pubKeyECDSA(prefix: addressPrefix, publicKey: k),
    ];
  }
}

class LegacyAddressGenerator extends HdAddressGenerator {
  final LegacyPubKeyCallback pubKeyCallback;
  final Address mainAddress;
  LegacyAddressGenerator({
    required this.pubKeyCallback,
    required this.mainAddress,
  });

  Future<Address> addressAtIndex({
    required int typeIndex,
    required int index,
  }) async {
    final publicKey = await pubKeyCallback(index: index, typeIndex: typeIndex);
    return Address.publicKey(prefix: addressPrefix, publicKey: publicKey);
  }
}
