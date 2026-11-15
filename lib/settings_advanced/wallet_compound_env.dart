import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../transactions/recent_outpoints_provider.dart';
import 'compound_runner.dart';

/// The real wallet behind [CompoundEnv]. [alive] says whether the screen that
/// started the job is still open; once it is not, nothing here touches the
/// wallet any more.
class WalletCompoundEnv implements CompoundEnv {
  WalletCompoundEnv(this.ref, {required this.alive});
  final WidgetRef ref;
  final bool Function() alive;

  /// Coins that really exist: the list minus what we have just spent.
  @override
  List<Utxo> allCoins() => alive() ? ref.read(liveUtxosProvider) : const [];

  /// True once the node's list no longer shows any coin we have spent. Until
  /// then the list is behind and must not be used to plan the next round.
  @override
  bool coinListIsFresh() {
    if (!alive()) return true;
    final held = ref.read(heldBackCoinsProvider.notifier).active();
    if (held.isEmpty) return true;
    return !ref.read(utxoListProvider).any((u) => held
        .contains(outpointKey(u.outpoint.transactionId, u.outpoint.index)));
  }

  @override
  List<Utxo> spendableCoins() =>
      alive() ? ref.read(spendableUtxosProvider) : const [];

  @override
  Set<String> accountAddresses() =>
      alive() ? ref.read(accountAddressesProvider) : const {};

  @override
  BigInt score() =>
      alive() ? ref.read(lastKnownVirtualDaaScoreProvider) : BigInt.zero;

  @override
  double daaPerSecond() =>
      alive() ? ref.read(daaRateProvider) : kDefaultDaaPerSecond;

  @override
  bool get walletLocked => alive() && ref.read(walletAuthProvider).isLocked;

  @override
  Future<void> sendChunk(String address, List<Utxo> chunk) async {
    if (!alive()) throw Exception('stopped');
    final prefix = ref.read(addressPrefixProvider);
    final compoundAddress = Address.tryParse(address, expectedPrefix: prefix);
    if (compoundAddress == null) {
      throw Exception('Could not read the address $address');
    }
    ref.read(recentOutpointsProvider.notifier).addAll([
      for (final u in chunk) (u.outpoint, u.address, u.utxoEntry.amount.toInt()),
    ]);
    final walletService = ref.read(walletServiceProvider);
    final tx = walletService.createCompoundTx(
      compoundAddress: compoundAddress,
      spendableUtxos: chunk,
      feePerInput: kFeePerInput,
    );
    await walletService.sendTransaction(tx.tx);
    if (alive()) ref.invalidate(pendingTxsProvider);
  }

  @override
  Future<void> refreshCoins() async {
    if (!alive()) return;
    final addresses = ref.read(allAddressesProvider);
    await ref.read(balanceNotifierProvider).refresh(addresses, force: true);
    if (!alive()) return;
    final utxoNotifier = ref.read(utxoNotifierProvider);
    await utxoNotifier.refresh(addresses: addresses, force: true);
    // The coin-list refresh keeps its own retry going and does not throw, so
    // look at how it ended: planning from an old list could build merges from
    // coins that are already spent.
    if (utxoNotifier.lastRefreshFailed) {
      throw StateError('The node did not answer.');
    }
  }

  @override
  DateTime now() => DateTime.now();

  @override
  Future<void> pause(Duration d) => Future<void>.delayed(d);
}
