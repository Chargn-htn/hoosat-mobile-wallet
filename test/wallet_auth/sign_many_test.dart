import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/util/vault.dart';
import 'package:hoosat_mobile/wallet/wallet_types.dart';
import 'package:hoosat_mobile/wallet/wallet_vault.dart';
import 'package:hoosat_mobile/wallet_auth/wallet_auth_notifier.dart';
import 'package:hoosat_mobile/wallet_auth/wallet_auth_types.dart';

/// A vault that keeps the seed in memory (the real one uses the phone's
/// secure storage).
class _MemVault extends Vault {
  _MemVault(this.data);
  final Map<String, String> data;
  @override
  Future<String?> get(String key, {String? defaultValue}) async =>
      data[key] ?? defaultValue;
  @override
  Future<void> set(String key, String? value) async {
    if (value == null) {
      data.remove(key);
    } else {
      data[key] = value;
    }
  }
}

final _seedHex = [
  for (var i = 0; i < 64; i++) ((i * 53 + 7) & 0xff).toRadixString(16).padLeft(2, '0')
].join();

void main() {
  late WalletAuthNotifier auth;
  final wallet = HdWallet.forSeedHex(_seedHex, type: HdWalletType.schnorr);

  setUp(() async {
    final vault = WalletVault('w1', _MemVault({}));
    // store the seed the way the app does (unencrypted)
    await vault.vault.set(
        // the vault's own key name for the seed of wallet w1
        'kaspium_seed_key#w1', _seedHex);
    auth = WalletAuthNotifier(
      vault,
      WalletAuth(
        wallet: WalletInfo(name: 't', wid: 'w1', mainnetPublicKey: 'x'),
        isLocked: false,
      ),
    );
  });

  Uint8List hash(int n) {
    final r = Random(n);
    return Uint8List.fromList(List.generate(32, (_) => r.nextInt(256)));
  }

  test('signMany: 84 signatures from one derived key, all valid for that address key',
      () async {
    final hashes = [for (var i = 0; i < 84; i++) hash(i)];
    final sigs = await auth.signMany(hashes, typeIndex: 0, index: 7);
    expect(sigs.length, 84);
    final pub = wallet.deriveKeyPair(typeIndex: 0, index: 7).publicKey;
    for (var i = 0; i < 84; i++) {
      expect(sigs[i].length, 64);
      expect(
          verifySchnorr(
              publicKey: bytesToHex(pub),
              hash: bytesToHex(hashes[i]),
              signature: bytesToHex(sigs[i])),
          isTrue,
          reason: 'signature $i');
    }
  });

  test('signMany matches what the old one-at-a-time sign() accepts', () async {
    final h = hash(99);
    final one = await auth.sign(h, typeIndex: 1, index: 3);
    final many = await auth.signMany([h], typeIndex: 1, index: 3);
    final pub = wallet.deriveKeyPair(typeIndex: 1, index: 3).publicKey;
    for (final sig in [one, many.single]) {
      expect(
          verifySchnorr(
              publicKey: bytesToHex(pub),
              hash: bytesToHex(h),
              signature: bytesToHex(sig)),
          isTrue);
    }
  });

  test('signMany with nothing to sign returns nothing; a locked wallet refuses',
      () async {
    expect(await auth.signMany([], typeIndex: 0, index: 0), isEmpty);
    auth.lock();
    expect(() => auth.signMany([hash(1)], typeIndex: 0, index: 0), throwsException);
  });
}
