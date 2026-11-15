import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../wallet_address/wallet_address.dart';

/// Which address this send draws from. It starts as MAIN: everything that is
/// not set aside in a named account. Money in an account is only spent when the
/// user picks that account (or picks "Any", which is null and means every
/// address, accounts included). Set by the picker on the Send screen (13d).
final sendFromAddressProvider = StateProvider.autoDispose<WalletAddress?>(
  (ref) => ref.read(addressNotifierProvider).defaultReceiveAddress,
);

/// spendableUtxosProvider filtered down to [address]'s own utxos, or the
/// full wallet-wide pool when [address] is null.
final sendSpendableUtxosForProvider =
    Provider.autoDispose.family<List<Utxo>, WalletAddress?>((ref, address) {
  final utxos = ref.watch(spendableUtxosProvider);
  return spendableForFrom(
    utxos,
    fromAddress: address?.encoded,
    mainAddress: ref.watch(mainAddressProvider),
    accountAddresses: ref.watch(accountAddressesProvider),
  );
});

/// What can be spent right now from a "From" choice (the sum of its spendable
/// coins). A provider, so a wallet with tens of thousands of coins adds them
/// up once and not on every keystroke.
final sendSpendableAmountProvider =
    Provider.autoDispose.family<BigInt, WalletAddress?>((ref, address) {
  var sum = BigInt.zero;
  for (final u in ref.watch(sendSpendableUtxosForProvider(address))) {
    sum += u.utxoEntry.amount;
  }
  return sum;
});

/// Same formula as maxSendProvider, but scoped to [address] -- the most a
/// single transaction could send if it only drew from that one address's
/// utxos (or the whole wallet, when [address] is null).
final maxSendForProvider =
    Provider.autoDispose.family<Amount, WalletAddress?>((ref, address) {
  final utxos = ref.watch(sendSpendableUtxosForProvider(address));
  final maxInputs = min(utxos.length, kMaxInputsPerTransaction);

  final maxWithFees =
      utxos.take(maxInputs).fold<BigInt>(BigInt.zero, (total, element) {
    return total + element.utxoEntry.amount;
  });

  final maxSend = maxWithFees - kFeePerInput * BigInt.from(maxInputs);
  if (maxSend < BigInt.zero) {
    return Amount.zero;
  }
  return Amount.raw(maxSend);
});
