import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import 'wallet_accounts_notifier.dart';
import 'wallet_accounts_types.dart';

final walletAccountsProvider =
    StateNotifierProvider<WalletAccountsStateNotifier, WalletAccounts>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  // One list per wallet: switching wallets switches the list.
  final walletId = ref.watch(walletProvider).wid;
  return WalletAccountsStateNotifier(repository, walletId: walletId);
});

/// The named accounts are saved in ONE list shared by every wallet in the app
/// (and every network). Each wallet must only show the accounts whose address
/// it actually owns -- otherwise another wallet's account appears here with
/// its own balance, is left out of this wallet's total, and cannot be spent
/// from. Nothing is removed from the saved list; the owning wallet still sees
/// its accounts when it is opened.
List<WalletAccountEntry> accountsOwnedBy(
  Iterable<WalletAccountEntry> accounts,
  bool Function(String address) ownsAddress,
) =>
    accounts.where((a) => ownsAddress(a.address)).toList();

final _ownedAccountsProvider = Provider.autoDispose((ref) {
  final accounts = ref.watch(walletAccountsProvider).accounts;
  final addresses = ref.watch(addressNotifierProvider);
  return accountsOwnedBy(accounts, addresses.containsAddress).toIList();
});

final activeAdditionalAccountsProvider = Provider.autoDispose((ref) {
  return ref.watch(_ownedAccountsProvider).where((a) => !a.archived).toIList();
});

final archivedAdditionalAccountsProvider = Provider.autoDispose((ref) {
  return ref.watch(_ownedAccountsProvider).where((a) => a.archived).toIList();
});
