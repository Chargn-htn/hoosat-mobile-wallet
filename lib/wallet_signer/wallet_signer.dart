import 'dart:async';
import 'dart:typed_data';

import '../hoosat/hoosat.dart';
import '../wallet_address/wallet_address_notifier.dart';
import '../wallet_auth/wallet_auth_notifier.dart';

class WalletSigner implements SignerBase {
  final WalletAddressNotifier _wallet;
  final WalletAuthNotifier _walletAuth;

  const WalletSigner(this._wallet, this._walletAuth);

  @override
  Future<bool> canSignForAddress(Address address) async {
    return _wallet.containsAddress(address.toString());
  }

  /// (type, index) of the address in the wallet's key tree; throws if it is
  /// not one of ours.
  (int, int) _pathOf(Address address) {
    var index = _wallet.indexOfReceiveAddress(address.encoded);
    if (index != null) return (0, index);
    index = _wallet.indexOfChangeAddress(address.encoded);
    if (index != null) return (1, index);
    throw Exception('Address not found');
  }

  @override
  Future<Uint8List> sign(Uint8List data, Address address) async {
    final (typeIndex, index) = _pathOf(address);
    return _walletAuth.sign(data, typeIndex: typeIndex, index: index);
  }

  @override
  Future<List<Uint8List>> signMany(
      List<Uint8List> data, Address address) async {
    final (typeIndex, index) = _pathOf(address);
    return _walletAuth.signMany(data, typeIndex: typeIndex, index: index);
  }
}
