import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_accounts_types.freezed.dart';
part 'wallet_accounts_types.g.dart';

/// "Main" (the wallet's default receive address, index 0) is never stored
/// here -- it's implicit, always shown, never archivable. This list only
/// tracks additional named accounts the user has deliberately added.
///
/// Counts toward the Main-inclusive cap of 10 active / 40 total (so up to
/// maxActiveAdditionalAccounts/maxTotalAdditionalAccounts here), mirroring
/// Node Manager's real maxActiveAccounts/maxTotalAccounts constants.
const maxActiveAdditionalAccounts = 9;
const maxTotalAdditionalAccounts = 39;
const maxAccountLabelLength = 24;

@freezed
class WalletAccountEntry with _$WalletAccountEntry {
  const factory WalletAccountEntry({
    required String address,
    required String label,
    @Default(false) bool archived,
  }) = _WalletAccountEntry;

  factory WalletAccountEntry.fromJson(Map<String, dynamic> json) =>
      _$WalletAccountEntryFromJson(json);
}

@freezed
class WalletAccounts with _$WalletAccounts {
  const factory WalletAccounts({
    @Default(IListConst([])) IList<WalletAccountEntry> accounts,
  }) = _WalletAccounts;

  factory WalletAccounts.fromJson(Map<String, dynamic> json) =>
      _$WalletAccountsFromJson(json);
}
