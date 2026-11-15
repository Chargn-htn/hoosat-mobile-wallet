import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import 'compound_advice.dart';

/// The Compound advice, worked out only when the coins really change or every
/// ~50 score units (about 12 s) -- not on every tick of the live score, which
/// re-ran a pass over every coin several times a second.
final compoundAdviceProvider = Provider.autoDispose<CompoundAdvice>((ref) {
  final bucket = ref.watch(
    lastKnownVirtualDaaScoreProvider.select((s) => s ~/ BigInt.from(50)),
  );
  return adviseCompound(
    allCoins: ref.watch(liveUtxosProvider),
    spendable: ref.watch(spendableUtxosProvider),
    accountAddresses: ref.watch(accountAddressesProvider),
    score: bucket * BigInt.from(50),
    daaPerSecond: ref.watch(daaRateProvider.select((r) => r.roundToDouble())),
  );
});
