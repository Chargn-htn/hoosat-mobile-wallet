import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../database/boxes/generic_box.dart';
import '../hoosat/wallet_service/address_generator.dart';
import '../settings/wallet_accounts/wallet_accounts_notifier.dart';
import '../settings/wallet_accounts/wallet_accounts_providers.dart';
import '../settings/wallet_accounts/wallet_accounts_types.dart';
import 'wallet_address.dart';

/// Looks for [target] among this wallet's own receive addresses (0 up to, not
/// including, [searchTo]) and returns its index, or null when this wallet's
/// seed does not produce it.
Future<int?> findReceiveIndex(
  HdAddressGenerator generator,
  String target, {
  int searchTo = 800,
  int batch = 40,
}) async {
  for (var start = 0; start < searchTo; start += batch) {
    final addresses = await generator.addressesAt(
      typeIndex: 0,
      startIndex: start,
      count: batch,
    );
    for (var i = 0; i < addresses.length; i++) {
      if (addresses[i].encoded == target) return start + i;
    }
  }
  return null;
}

/// Remembers, per wallet, which saved accounts were checked and found NOT to
/// be this wallet's -- so the (slow) check runs once, not every time the app
/// opens.
class NotOursStore {
  final GenericBox box;
  const NotOursStore(this.box);

  String _key(String wid) => '_kAccountNotOurs#$wid';

  Set<String> load(String wid) => box.getList<String>(_key(wid)).toSet();

  Future<void> add(String wid, String address) async {
    final all = load(wid)..add(address);
    await box.setList<String>(_key(wid), all.toList());
  }
}

typedef AccountAdoption = ({List<String> adopted, List<String> foreign});

/// Named accounts are saved in one list shared by every wallet in the app.
/// For each saved account this wallet is not yet tracking, ask: is it ours?
///  * yes (the seed produces it) -> start tracking it, so its coins count in
///    this wallet's total and can be spent;
///  * no -> it belongs to a different wallet, and is not shown here.
final accountAdoptionProvider =
    FutureProvider.autoDispose<AccountAdoption>((ref) async {
  final saved = ref.watch(walletAccountsProvider).accounts;
  final wid = ref.watch(walletProvider).wid;
  // Another network is another set of addresses: search (and remember "not
  // ours") per wallet AND network.
  final scope = '$wid.${ref.watch(networkIdProvider)}';
  // read, not watch: adopting an account changes the address notifier, and that
  // must not restart this very job while it is still running.
  final notifier = ref.read(addressNotifierProvider);

  final store = NotOursStore(ref.read(settingsRepositoryProvider).box);
  final knownNotOurs = store.load(scope);

  final adopted = <String>[];
  final foreign = <String>[];
  for (final account in saved) {
    if (notifier.containsAddress(account.address)) continue;

    if (knownNotOurs.contains(account.address)) {
      foreign.add(account.address);
      continue;
    }

    final index = await findReceiveIndex(
      notifier.addressGenerator,
      account.address,
      searchTo: notifier.lastUsedReceiveIndex + 300 > 800
          ? notifier.lastUsedReceiveIndex + 300
          : 800,
    );
    if (index == null) {
      await store.add(scope, account.address);
      foreign.add(account.address);
      continue;
    }

    final address = await notifier.addressGenerator.receiveAddressAtIndex(index);
    await notifier.addAddresses([
      WalletAddress(
        index: index,
        type: AddressType.receive,
        name: notifier.addressNameCallback(AddressType.receive, index),
        address: address,
        used: true,
      ),
    ]);
    adopted.add(account.address);
  }
  return (adopted: adopted, foreign: foreign);
});


class LegacyMigration {
  /// Old shared-list accounts that belong to this wallet.
  final List<WalletAccountEntry> mine;

  /// Of those, the ones this wallet was not tracking: address -> receive index.
  final Map<String, int> toTrack;

  /// Found NOT to belong to this wallet (remembered so they are not searched again).
  final List<String> notOurs;
  const LegacyMigration(this.mine, this.toTrack, this.notOurs);
}

/// Decides which accounts from the OLD shared list belong to this wallet.
/// Pure apart from [findIndex], so it can be tested without a real wallet.
Future<LegacyMigration> migrateLegacyAccounts({
  required List<WalletAccountEntry> legacy,
  required bool Function(String address) isTracked,
  required Set<String> knownNotOurs,
  required Future<int?> Function(String address) findIndex,
}) async {
  final mine = <WalletAccountEntry>[];
  final toTrack = <String, int>{};
  final notOurs = <String>[];
  for (final a in legacy) {
    if (isTracked(a.address)) {
      mine.add(a);
    } else if (knownNotOurs.contains(a.address)) {
      continue;
    } else {
      final index = await findIndex(a.address);
      if (index == null) {
        notOurs.add(a.address);
      } else {
        mine.add(a);
        toTrack[a.address] = index;
      }
    }
  }
  return LegacyMigration(mine, toTrack, notOurs);
}

/// Once per wallet: carry over, from the old shared account list, the accounts
/// that belong to THIS wallet into this wallet's own list.
final accountMigrationProvider = FutureProvider.autoDispose<void>((ref) async {
  final wid = ref.watch(walletProvider).wid;
  final scope = '$wid.${ref.watch(networkIdProvider)}';
  final repo = ref.read(settingsRepositoryProvider);
  if (repo.isAccountsMigrated(scope)) return;

  final notifier = ref.read(addressNotifierProvider);
  // Taken NOW, before the waits below: if the person switches wallet while this
  // runs, the accounts must still go into THIS wallet's list.
  final accountsNotifier = ref.read(walletAccountsProvider.notifier);
  final store = NotOursStore(repo.box);
  final result = await migrateLegacyAccounts(
    legacy: repo.getWalletAccounts().accounts.toList(),
    isTracked: notifier.containsAddress,
    knownNotOurs: store.load(scope),
    findIndex: (address) => findReceiveIndex(
      notifier.addressGenerator,
      address,
      searchTo: notifier.lastUsedReceiveIndex + 300 > 800
          ? notifier.lastUsedReceiveIndex + 300
          : 800,
    ),
  );

  for (final entry in result.toTrack.entries) {
    final address = await notifier.addressGenerator.receiveAddressAtIndex(entry.value);
    await notifier.addAddresses([
      WalletAddress(
        index: entry.value,
        type: AddressType.receive,
        name: notifier.addressNameCallback(AddressType.receive, entry.value),
        address: address,
        used: true,
      ),
    ]);
  }
  for (final a in result.notOurs) {
    await store.add(scope, a);
  }
  await accountsNotifier.importEntries(result.mine);
  await repo.markAccountsMigrated(scope);
});
