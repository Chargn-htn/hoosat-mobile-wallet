import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hoosat_mobile/database/boxes/generic_box.dart';
import 'package:hoosat_mobile/settings/settings_repository.dart';
import 'package:hoosat_mobile/settings/wallet_accounts.dart';

void main() {
  late SettingsRepository repository;
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('wallet_accounts_test');
    Hive.init(tempDir.path);
    final box = await Hive.openBox('wallet_accounts_test');
    repository = SettingsRepository(GenericBox(box));
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  group('WalletAccountsStateNotifier', () {
    test('starts empty', () {
      final notifier = WalletAccountsStateNotifier(repository);
      expect(notifier.state.accounts, isEmpty);
    });

    test('addAccount adds a new entry and persists it', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Travel Fund');

      expect(notifier.state.accounts, hasLength(1));
      expect(notifier.state.accounts.first.address, 'addr1');
      expect(notifier.state.accounts.first.label, 'Travel Fund');
      expect(notifier.state.accounts.first.archived, isFalse);

      // Persisted: a fresh notifier reading the same repository sees it.
      final reloaded = WalletAccountsStateNotifier(repository);
      expect(reloaded.state.accounts, hasLength(1));
    });

    test('addAccount rejects an empty label', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      expect(
        () => notifier.addAccount(address: 'addr1', label: '  '),
        throwsA(isA<AccountLabelException>()),
      );
    });

    test('addAccount rejects a label over 24 characters', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      expect(
        () => notifier.addAccount(
          address: 'addr1',
          label: 'a' * 25,
        ),
        throwsA(isA<AccountLabelException>()),
      );
    });

    test('addAccount rejects a duplicate label (case-insensitive)', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Savings');
      expect(
        () => notifier.addAccount(address: 'addr2', label: 'savings'),
        throwsA(isA<AccountLabelException>()),
      );
    });

    test('enforces the active cap (9 additional = 10 incl. Main)', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      for (var i = 0; i < maxActiveAdditionalAccounts; i++) {
        await notifier.addAccount(address: 'addr$i', label: 'Account $i');
      }
      expect(notifier.state.accounts, hasLength(maxActiveAdditionalAccounts));
      expect(
        () => notifier.addAccount(address: 'addrOneTooMany', label: 'Oops'),
        throwsA(isA<AccountLimitException>()),
      );
    });

    test('archiving frees up an active slot for a new account', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      for (var i = 0; i < maxActiveAdditionalAccounts; i++) {
        await notifier.addAccount(address: 'addr$i', label: 'Account $i');
      }
      await notifier.archiveAccount('addr0');
      // Should no longer throw -- a slot was freed.
      await notifier.addAccount(address: 'addrNew', label: 'New One');
      expect(
        notifier.state.accounts.where((a) => !a.archived),
        hasLength(maxActiveAdditionalAccounts),
      );
    });

    test('archiveAccount hides the account but keeps it in the list', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Savings');
      await notifier.archiveAccount('addr1');

      expect(notifier.state.accounts, hasLength(1));
      expect(notifier.state.accounts.first.archived, isTrue);
      expect(notifier.state.accounts.first.address, 'addr1');
    });

    test('restoreAccount un-archives an account', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Savings');
      await notifier.archiveAccount('addr1');
      await notifier.restoreAccount('addr1');

      expect(notifier.state.accounts.first.archived, isFalse);
    });

    test('renameAccount changes the label', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Old Name');
      await notifier.renameAccount('addr1', 'New Name');

      expect(notifier.state.accounts.first.label, 'New Name');
    });

    test('renameAccount still rejects a clash with another account', () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Savings');
      await notifier.addAccount(address: 'addr2', label: 'Mining');
      expect(
        () => notifier.renameAccount('addr2', 'savings'),
        throwsA(isA<AccountLabelException>()),
      );
    });

    test('unarchiveFunded restores an archived account that received funds',
        () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Old Travel Fund');
      await notifier.archiveAccount('addr1');
      expect(notifier.state.accounts.first.archived, isTrue);

      await notifier.unarchiveFunded({'addr1'});

      expect(notifier.state.accounts.first.archived, isFalse);
    });

    test('unarchiveFunded leaves archived accounts with no funds alone',
        () async {
      final notifier = WalletAccountsStateNotifier(repository);
      await notifier.addAccount(address: 'addr1', label: 'Old Travel Fund');
      await notifier.archiveAccount('addr1');

      await notifier.unarchiveFunded({'someOtherAddr'});

      expect(notifier.state.accounts.first.archived, isTrue);
    });
  });
}
