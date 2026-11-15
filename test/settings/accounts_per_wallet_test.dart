import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/settings/wallet_accounts/wallet_accounts_providers.dart';
import 'package:hoosat_mobile/settings/wallet_accounts/wallet_accounts_types.dart';

WalletAccountEntry acct(String address, String label, {bool archived = false}) =>
    WalletAccountEntry(address: address, label: label, archived: archived);

void main() {
  final mine = {'hoosat:mine1', 'hoosat:mine2'};

  test("a wallet only shows accounts whose address it owns", () {
    final shared = [
      acct('hoosat:mine1', 'Savings'),
      acct('hoosat:other', 'set test1'), // created in a different wallet
      acct('hoosat:mine2', 'Old', archived: true),
    ];
    final shown = accountsOwnedBy(shared, mine.contains);
    expect(shown.map((a) => a.label), ['Savings', 'Old']);
  });

  test('another wallet gets its own accounts from the same saved list', () {
    final shared = [
      acct('hoosat:mine1', 'Savings'),
      acct('hoosat:other', 'set test1'),
    ];
    final other = accountsOwnedBy(shared, {'hoosat:other'}.contains);
    expect(other.map((a) => a.label), ['set test1']);
  });

  test('a wallet that owns none of them shows none', () {
    expect(accountsOwnedBy([acct('hoosat:x', 'x')], mine.contains), isEmpty);
  });
}
