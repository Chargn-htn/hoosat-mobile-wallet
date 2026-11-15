import 'dart:typed_data';

import '../types/address.dart';

abstract class SignerBase {
  Future<bool> canSignForAddress(Address address);
  Future<Uint8List> sign(Uint8List data, Address address);

  /// Signs every hash in [data] with the key of ONE [address], returning the
  /// signatures in the same order. The key is found and derived once, not once
  /// per hash -- a merge signs up to 84 coins that all belong to one address,
  /// and deriving the same key 84 times was most of the time it took.
  Future<List<Uint8List>> signMany(List<Uint8List> data, Address address);
}
