import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../settings/wallet_accounts/wallet_accounts_providers.dart';
import '../wallet_address/wallet_address.dart';

/// The wallet's numbers all come from ONE place (the saved per-address
/// balances), so they always add up:
///   Total  = every address in this wallet
///   Account = the balance of its own address
///   Main   = Total minus the accounts   (everything not set aside in an account)
Amount mainBalanceOf(Amount total, Iterable<Amount> accountBalances) {
  var rest = total.raw;
  for (final a in accountBalances) {
    rest -= a.raw;
  }
  return Amount.raw(rest < BigInt.zero ? BigInt.zero : rest);
}

/// Coins a send "From" choice may spend.
///  * Any      -> everything
///  * Main     -> everything NOT held by a named account
///  * account  -> only that account's address
List<Utxo> spendableForFrom(
  List<Utxo> utxos, {
  required String? fromAddress,
  required String mainAddress,
  required Set<String> accountAddresses,
}) {
  if (fromAddress == null) return utxos;
  if (fromAddress == mainAddress) {
    return utxos.where((u) => !accountAddresses.contains(u.address)).toList();
  }
  return utxos.where((u) => u.address == fromAddress).toList();
}

/// The wallet's main address (a provider of its own so tests can set it).
final mainAddressProvider = Provider.autoDispose<String>(
  (ref) => ref.watch(addressNotifierProvider).defaultReceiveAddress.encoded,
);

/// Addresses of the named accounts (active and archived) this wallet owns.
final accountAddressesProvider = Provider.autoDispose<Set<String>>((ref) {
  final main = ref.watch(mainAddressProvider);
  return {
    for (final a in ref.watch(activeAdditionalAccountsProvider)) a.address,
    for (final a in ref.watch(archivedAdditionalAccountsProvider)) a.address,
  }..remove(main);
});

final mainBalanceProvider = Provider.autoDispose<Amount>((ref) {
  final total = ref.watch(totalBalanceProvider);
  final accounts = ref.watch(accountAddressesProvider);
  return mainBalanceOf(
    total,
    [for (final a in accounts) ref.watch(balanceForAddressProvider(a))],
  );
});

/// The balance behind a Send "From" choice (null = Any).
final fromBalanceProvider =
    Provider.autoDispose.family<Amount, WalletAddress?>((ref, from) {
  if (from == null) return ref.watch(totalBalanceProvider);
  final main = ref.watch(mainAddressProvider);
  if (from.encoded == main) return ref.watch(mainBalanceProvider);
  return ref.watch(balanceForAddressProvider(from.encoded));
});

/// How many coins a Send "From" scope holds in total -- ones still maturing
/// included -- so the wallet knows how many spare coins it already has.
final scopeCoinCountProvider =
    Provider.autoDispose.family<int, WalletAddress?>((ref, from) {
  return spendableForFrom(
    ref.watch(utxoListProvider),
    fromAddress: from?.encoded,
    mainAddress: ref.watch(mainAddressProvider),
    accountAddresses: ref.watch(accountAddressesProvider),
  ).length;
});
