import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../wallet_address/wallet_address.dart';

/// Which address this send draws from -- null means "any" (today's
/// default: pools balance from every address in the wallet). Set by the
/// picker on the Send compose screen (step 13d).
final sendFromAddressProvider =
    StateProvider.autoDispose<WalletAddress?>((ref) => null);

/// spendableUtxosProvider filtered down to [address]'s own utxos, or the
/// full wallet-wide pool when [address] is null.
final sendSpendableUtxosForProvider =
    Provider.autoDispose.family<List<Utxo>, WalletAddress?>((ref, address) {
  final utxos = ref.watch(spendableUtxosProvider);
  if (address == null) {
    return utxos;
  }
  return utxos.where((u) => u.address == address.encoded).toList();
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
