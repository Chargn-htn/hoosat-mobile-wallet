import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/settings/address_settings.dart';

void main() {
  group('AddressSettings / ChangeAddressMode', () {
    test('defaults to keepPerAddress', () {
      const settings = AddressSettings();
      expect(settings.changeAddressMode, ChangeAddressMode.keepPerAddress);
    });

    test('toJson/fromJson round-trips changeAddressMode: keepPerAddress', () {
      const settings = AddressSettings(
        changeAddressMode: ChangeAddressMode.keepPerAddress,
      );
      final restored = AddressSettings.fromJson(settings.toJson());
      expect(restored.changeAddressMode, ChangeAddressMode.keepPerAddress);
      expect(restored, settings);
    });

    test('toJson/fromJson round-trips changeAddressMode: private', () {
      const settings = AddressSettings(
        changeAddressMode: ChangeAddressMode.private,
      );
      final restored = AddressSettings.fromJson(settings.toJson());
      expect(restored.changeAddressMode, ChangeAddressMode.private);
      expect(restored, settings);
    });

    test('fromJson defaults changeAddressMode when missing from stored data',
        () {
      // Simulates a settings record saved before this field existed.
      final restored = AddressSettings.fromJson({'addressFilter': 'all'});
      expect(restored.changeAddressMode, ChangeAddressMode.keepPerAddress);
    });

    test('copyWith changes only changeAddressMode', () {
      const settings = AddressSettings();
      final updated =
          settings.copyWith(changeAddressMode: ChangeAddressMode.private);
      expect(updated.changeAddressMode, ChangeAddressMode.private);
      expect(updated.addressFilter, settings.addressFilter);
    });
  });
}
