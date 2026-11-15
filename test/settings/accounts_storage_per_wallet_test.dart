import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hoosat_mobile/database/boxes/generic_box.dart';
import 'package:hoosat_mobile/settings/settings_repository.dart';
import 'package:hoosat_mobile/settings/wallet_accounts/wallet_accounts_notifier.dart';
import 'package:hoosat_mobile/settings/wallet_accounts/wallet_accounts_types.dart';
import 'package:hoosat_mobile/wallet_address/account_adoption.dart';

void main() {
  late Directory dir;
  late SettingsRepository repo;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('accounts_per_wallet');
    Hive.init(dir.path);
    repo = SettingsRepository(GenericBox(await Hive.openBox('accounts_pw')));
  });
  tearDown(() async {
    await Hive.deleteFromDisk();
    await dir.delete(recursive: true);
  });

  group('each wallet has its own account list', () {
    test('an account added in one wallet never appears in the other', () async {
      final a = WalletAccountsStateNotifier(repo, walletId: 'walletA');
      final b = WalletAccountsStateNotifier(repo, walletId: 'walletB');
      await a.addAccount(address: 'hoosat:a1', label: 'set test1');

      expect(a.state.accounts.map((e) => e.label), ['set test1']);
      expect(b.state.accounts, isEmpty);

      // and it survives reopening wallet A, still absent from B
      expect(WalletAccountsStateNotifier(repo, walletId: 'walletA').state.accounts,
          hasLength(1));
      expect(WalletAccountsStateNotifier(repo, walletId: 'walletB').state.accounts,
          isEmpty);
    });

    test('the same label can be used in two different wallets', () async {
      final a = WalletAccountsStateNotifier(repo, walletId: 'walletA');
      final b = WalletAccountsStateNotifier(repo, walletId: 'walletB');
      await a.addAccount(address: 'hoosat:a1', label: 'Savings');
      await b.addAccount(address: 'hoosat:b1', label: 'Savings');
      expect(a.state.accounts, hasLength(1));
      expect(b.state.accounts, hasLength(1));
    });

    test('the old shared list is left untouched', () async {
      final legacy = WalletAccountsStateNotifier(repo);
      await legacy.addAccount(address: 'hoosat:old', label: 'Old');
      final a = WalletAccountsStateNotifier(repo, walletId: 'walletA');
      await a.addAccount(address: 'hoosat:a1', label: 'New');
      expect(repo.getWalletAccounts().accounts.map((e) => e.label), ['Old']);
    });

    test('importEntries adds missing accounts and skips ones already there',
        () async {
      final a = WalletAccountsStateNotifier(repo, walletId: 'walletA');
      await a.addAccount(address: 'hoosat:a1', label: 'Mine');
      await a.importEntries([
        const WalletAccountEntry(address: 'hoosat:a1', label: 'Mine'),
        const WalletAccountEntry(address: 'hoosat:a2', label: 'Carried'),
      ]);
      expect(a.state.accounts.map((e) => e.address), ['hoosat:a1', 'hoosat:a2']);
    });

    test('migration is remembered per wallet', () async {
      expect(repo.isAccountsMigrated('walletA'), isFalse);
      await repo.markAccountsMigrated('walletA');
      expect(repo.isAccountsMigrated('walletA'), isTrue);
      expect(repo.isAccountsMigrated('walletB'), isFalse);
    });
  });

  group('moving accounts out of the old shared list', () {
    const test1 = WalletAccountEntry(address: 'hoosat:test1', label: 'set test1');
    const savings = WalletAccountEntry(address: 'hoosat:sav', label: 'Savings');
    const derived = WalletAccountEntry(address: 'hoosat:der', label: 'Derived');

    test('the wallet that tracks an account keeps it', () async {
      final r = await migrateLegacyAccounts(
        legacy: [test1, savings],
        isTracked: {'hoosat:test1'}.contains,
        knownNotOurs: {},
        findIndex: (_) async => null,
      );
      expect(r.mine.map((e) => e.label), ['set test1']);
      expect(r.notOurs, ['hoosat:sav']);
    });

    test('an account the seed produces is kept and tracked', () async {
      final r = await migrateLegacyAccounts(
        legacy: [derived],
        isTracked: (_) => false,
        knownNotOurs: {},
        findIndex: (a) async => a == 'hoosat:der' ? 7 : null,
      );
      expect(r.mine.map((e) => e.label), ['Derived']);
      expect(r.toTrack, {'hoosat:der': 7});
    });

    test('accounts already known not to be ours are skipped without searching',
        () async {
      var searched = 0;
      final r = await migrateLegacyAccounts(
        legacy: [test1],
        isTracked: (_) => false,
        knownNotOurs: {'hoosat:test1'},
        findIndex: (_) async {
          searched++;
          return null;
        },
      );
      expect(r.mine, isEmpty);
      expect(searched, 0);
    });
  });
}
