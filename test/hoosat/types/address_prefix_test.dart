import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/types/address_prefix.dart';

void main() {
  group('AddressPrefix.parseBech32Prefix', () {
    test('parses mainnet prefix', () {
      expect(AddressPrefix.parseBech32Prefix('hoosat'), AddressPrefix.hoosat);
    });

    test('parses testnet prefix', () {
      // Regression test: this was previously typo'd as 'hooosattest' (3 o's),
      // which silently fell through to AddressPrefix.unknown for every real
      // testnet address, breaking all testnet address validation, found via
      // real on-device testing.
      expect(AddressPrefix.parseBech32Prefix('hoosattest'),
          AddressPrefix.hoosatTest);
    });

    test('parses devnet prefix', () {
      expect(AddressPrefix.parseBech32Prefix('hoosatdev'),
          AddressPrefix.hoosatDev);
    });

    test('parses simnet prefix', () {
      expect(AddressPrefix.parseBech32Prefix('hoosatsim'),
          AddressPrefix.hoosatSim);
    });

    test('unknown prefix returns unknown', () {
      expect(AddressPrefix.parseBech32Prefix('garbage'),
          AddressPrefix.unknown);
    });
  });
}
