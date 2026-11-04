import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import 'wallet_accounts_notifier.dart';
import 'wallet_accounts_types.dart';

final walletAccountsProvider =
    StateNotifierProvider<WalletAccountsStateNotifier, WalletAccounts>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return WalletAccountsStateNotifier(repository);
});

final activeAdditionalAccountsProvider = Provider.autoDispose((ref) {
  final accounts = ref.watch(walletAccountsProvider).accounts;
  return accounts.where((a) => !a.archived).toIList();
});

final archivedAdditionalAccountsProvider = Provider.autoDispose((ref) {
  final accounts = ref.watch(walletAccountsProvider).accounts;
  return accounts.where((a) => a.archived).toIList();
});
