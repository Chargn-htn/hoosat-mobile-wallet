import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings_repository.dart';
import 'wallet_accounts_types.dart';

const kWalletAccountsKey = '_kWalletAccountsKey';

/// Accounts are saved PER WALLET (a wallet's id is part of the key), so two
/// wallets in the same app can never see or mix each other's accounts.
/// [walletId] == null is the old single shared list, kept only so it can be
/// migrated from (and so older code and tests keep working).
extension WalletAccountsExtension on SettingsRepository {
  String _accountsKey(String? walletId) =>
      walletId == null ? kWalletAccountsKey : '$kWalletAccountsKey#$walletId';

  WalletAccounts getWalletAccounts({String? walletId}) {
    return box.tryGet<WalletAccounts>(
          _accountsKey(walletId),
          typeFactory: WalletAccounts.fromJson,
        ) ??
        const WalletAccounts();
  }

  Future<void> setWalletAccounts(WalletAccounts accounts, {String? walletId}) {
    return box.set(_accountsKey(walletId), accounts);
  }

  bool isAccountsMigrated(String walletId) =>
      box.tryGet<bool>('_kAccountsMigrated#$walletId') ?? false;

  Future<void> markAccountsMigrated(String walletId) =>
      box.set<bool>('_kAccountsMigrated#$walletId', true);
}

/// Thrown when adding an account would exceed the active (10, incl. Main)
/// or total (40, incl. Main) cap.
class AccountLimitException implements Exception {
  final String message;
  const AccountLimitException(this.message);
  @override
  String toString() => message;
}

/// Thrown for a bad label: empty, too long, or a duplicate of another
/// account's name.
class AccountLabelException implements Exception {
  final String message;
  const AccountLabelException(this.message);
  @override
  String toString() => message;
}

class WalletAccountsStateNotifier extends StateNotifier<WalletAccounts> {
  final SettingsRepository repository;

  /// Which wallet's list this is (null = the old shared list).
  final String? walletId;

  WalletAccountsStateNotifier(this.repository, {this.walletId})
      : super(repository.getWalletAccounts(walletId: walletId));

  String? _validateLabel(String raw, {String? selfAddress}) {
    final label = raw.trim();
    if (label.isEmpty) {
      return 'Enter a name for this account.';
    }
    if (label.runes.length > maxAccountLabelLength) {
      return 'That name is too long -- please use $maxAccountLabelLength characters or fewer.';
    }
    final clash = state.accounts.any(
      (a) =>
          a.address != selfAddress &&
          a.label.toLowerCase() == label.toLowerCase(),
    );
    if (clash) {
      return 'That name is already used by another account.';
    }
    return null;
  }

  /// Adds [address] as a new named account with [label]. The caller is
  /// responsible for actually generating a fresh wallet address first --
  /// this notifier only manages the persisted list, so it stays testable
  /// without needing HD address generation.
  Future<void> addAccount({
    required String address,
    required String label,
  }) async {
    final activeCount = state.accounts.where((a) => !a.archived).length;
    if (activeCount >= maxActiveAdditionalAccounts) {
      throw const AccountLimitException(
        'You already have 10 accounts. Archive an empty one to make room.',
      );
    }
    if (state.accounts.length >= maxTotalAdditionalAccounts) {
      throw const AccountLimitException(
        'You have a lot of archived accounts. Restore one of them instead of adding a new one.',
      );
    }
    final error = _validateLabel(label);
    if (error != null) {
      throw AccountLabelException(error);
    }

    final entry = WalletAccountEntry(address: address, label: label.trim());
    final updated = state.copyWith(accounts: state.accounts.add(entry));
    await repository.setWalletAccounts(updated, walletId: walletId);
    state = updated;
  }

  /// Adds accounts carried over from the old shared list. Skips any address
  /// already present; does not apply the label/cap rules (these are existing
  /// accounts, not new ones).
  Future<void> importEntries(Iterable<WalletAccountEntry> entries) async {
    final have = state.accounts.map((a) => a.address).toSet();
    final fresh = entries.where((e) => !have.contains(e.address)).toList();
    if (fresh.isEmpty) return;
    final updated = state.copyWith(accounts: state.accounts.addAll(fresh));
    await repository.setWalletAccounts(updated, walletId: walletId);
    state = updated;
  }

  Future<void> archiveAccount(String address) async {
    final updated = state.copyWith(
      accounts: state.accounts
          .map(
            (a) => a.address == address ? a.copyWith(archived: true) : a,
          )
          .toIList(),
    );
    await repository.setWalletAccounts(updated, walletId: walletId);
    state = updated;
  }

  Future<void> restoreAccount(String address) async {
    final updated = state.copyWith(
      accounts: state.accounts
          .map(
            (a) => a.address == address ? a.copyWith(archived: false) : a,
          )
          .toIList(),
    );
    await repository.setWalletAccounts(updated, walletId: walletId);
    state = updated;
  }

  Future<void> renameAccount(String address, String newLabel) async {
    final error = _validateLabel(newLabel, selfAddress: address);
    if (error != null) {
      throw AccountLabelException(error);
    }
    final trimmed = newLabel.trim();
    final updated = state.copyWith(
      accounts: state.accounts
          .map(
            (a) => a.address == address ? a.copyWith(label: trimmed) : a,
          )
          .toIList(),
    );
    await repository.setWalletAccounts(updated, walletId: walletId);
    state = updated;
  }

  /// Archived accounts auto-restore if money shows up on them later -- an
  /// address can't really be deleted, so archiving only ever hides it.
  /// Call with the set of addresses currently known to have a balance.
  Future<void> unarchiveFunded(Set<String> fundedAddresses) async {
    final anyToRestore = state.accounts
        .any((a) => a.archived && fundedAddresses.contains(a.address));
    if (!anyToRestore) {
      return;
    }
    final updated = state.copyWith(
      accounts: state.accounts
          .map(
            (a) => (a.archived && fundedAddresses.contains(a.address))
                ? a.copyWith(archived: false)
                : a,
          )
          .toIList(),
    );
    await repository.setWalletAccounts(updated, walletId: walletId);
    state = updated;
  }
}
