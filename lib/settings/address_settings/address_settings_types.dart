import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_settings_types.freezed.dart';
part 'address_settings_types.g.dart';

enum AddressFilter {
  all,
  nonZero,
}

/// Where change (from a send) and the result of a compound go.
///
/// keepPerAddress (default): always the wallet's main address, so balance
/// doesn't keep spreading across new addresses -- this was the original
/// pain point this app was rebuilt to fix.
/// private: today's upstream behaviour, a fresh HD change address every
/// time (standard wallet privacy practice, at the cost of balance
/// spreading across many addresses).
enum ChangeAddressMode {
  keepPerAddress,
  private,
}

@freezed
class AddressSettings with _$AddressSettings {
  const factory AddressSettings({
    @Default(AddressFilter.all) AddressFilter addressFilter,
    @Default(ChangeAddressMode.keepPerAddress) ChangeAddressMode changeAddressMode,
  }) = _AddressSettings;

  factory AddressSettings.fromJson(Map<String, dynamic> json) =>
      _$AddressSettingsFromJson(json);
}
