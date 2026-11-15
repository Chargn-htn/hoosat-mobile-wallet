import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core_providers.dart';
import '../database/boxes.dart';
import '../hoosat/grpc/rpc.pb.dart';
import '../hoosat/types/amount.dart';
import '../hoosat/transaction/types.dart';
import '../wallet_address/wallet_address_providers.dart';
import '../wallet_auth/wallet_auth_providers.dart';
import '../wallet_balance/wallet_balance_providers.dart';
import 'utxos_notifier.dart';

final _utxoBoxProvider = Provider.autoDispose<TypedBox<Utxo>>((ref) {
  final boxInfo = ref.watch(walletBoxInfoProvider);
  final db = ref.watch(dbProvider);

  final boxKey = boxInfo.utxo.boxKey;
  final box = db.getTypedBox<Utxo>(boxKey);

  return box;
});

final utxosChangedProvider = StreamProvider.autoDispose((ref) {
  final client = ref.watch(hoosatClientProvider);
  final addresses = ref.watch(allAddressesProvider);

  return _debounceUtxoChanges(client.notifyUtxosChanged(addresses));
});

Stream<UtxosChangedNotificationMessage> _debounceUtxoChanges(
  Stream<UtxosChangedNotificationMessage> source,
) {
  late StreamController<UtxosChangedNotificationMessage> controller;
  StreamSubscription<UtxosChangedNotificationMessage>? subscription;
  Timer? timer;
  final pending = <UtxosChangedNotificationMessage>[];

  controller = StreamController<UtxosChangedNotificationMessage>(
    onListen: () {
      subscription = source.listen(
        (event) {
          pending.add(event);
          timer?.cancel();
          timer = Timer(const Duration(milliseconds: 500), () {
            if (pending.isEmpty) {
              return;
            }
            controller.add(_mergeUtxoChanges(pending));
            pending.clear();
          });
        },
        onError: controller.addError,
        onDone: () {
          timer?.cancel();
          if (pending.isNotEmpty) {
            controller.add(_mergeUtxoChanges(pending));
            pending.clear();
          }
          controller.close();
        },
      );
    },
    onCancel: () async {
      timer?.cancel();
      await subscription?.cancel();
    },
  );

  return controller.stream;
}

UtxosChangedNotificationMessage _mergeUtxoChanges(
  List<UtxosChangedNotificationMessage> changes,
) {
  String keyFor(RpcUtxosByAddressesEntry entry) {
    final outpoint = entry.outpoint;
    return '${entry.address}:${outpoint.transactionId}:${outpoint.index}';
  }

  final added = <String, RpcUtxosByAddressesEntry>{};
  final removed = <String, RpcUtxosByAddressesEntry>{};
  for (final change in changes) {
    for (final entry in change.removed) {
      final key = keyFor(entry);
      added.remove(key);
      removed[key] = entry;
    }
    for (final entry in change.added) {
      final key = keyFor(entry);
      removed.remove(key);
      added[key] = entry;
    }
  }

  return UtxosChangedNotificationMessage(
    added: added.values,
    removed: removed.values,
  );
}

final utxoNotifierProvider =
    ChangeNotifierProvider.autoDispose<UtxosNotifier>((ref) {
  final client = ref.watch(hoosatClientProvider);
  final utxoBox = ref.watch(_utxoBoxProvider);
  final log = ref.watch(loggerProvider);

  final notifier = UtxosNotifier(
    client: client,
    utxoBox: utxoBox,
    log: log,
  );

  ref.listen(
    balanceNotifierProvider.select((notifier) => notifier.balances),
    (_, balances) {
      log.d('UTXOs - Refresh with balances for ${balances.keys}');
      notifier.refreshWithBalances(balances: balances);
    },
    fireImmediately: true,
  );

  ref.listen(utxosChangedProvider, (_, next) {
    if (next.asData?.value case final message?) {
      final addresses = Set.of(
        message.removed.followedBy(message.added).map((utxo) => utxo.address),
      );
      log.d('UTXOs - Refresh with utxos changed for $addresses');
      notifier.refresh(addresses: addresses);
    }
  });

  // Safety net: the saved balances and the coin list must agree. Normally the
  // listener above keeps them in step; if a refresh was lost or failed, this
  // notices the disagreement and repairs it, without asking the node anything
  // when they already match.
  final reconcile = Timer.periodic(const Duration(seconds: 45), (_) {
    final balances = ref.read(balanceNotifierProvider).balances;
    notifier.refreshWithBalances(balances: balances);
  });

  ref.onDispose(() {
    reconcile.cancel();
    notifier.disposed = true;
  });

  return notifier;
});

final utxoListProvider = Provider.autoDispose((ref) {
  return ref.watch(
    utxoNotifierProvider.select((notifier) => notifier.utxoList),
  );
});

// The node rejects any input (coinbase or not) that isn't at least 1000
// DAA score units old ("every input must be at least 1000 DAA score units
// old") -- found via a real "failed to compound" rejection on a
// freshly-received UTXO. Previously this maturity check only applied to
// coinbase outputs, and used 100 instead of the node's actual 1000, so
// the app considered just-received funds spendable when the node would
// reject them.
const kMinUtxoMaturityDaaScore = 1000;

/// Coins this wallet has just spent in a transaction the node accepted, until
/// the node's own coin list catches up. Without this the wallet can offer the
/// same coins to a second payment sent soon after the first; the network keeps
/// one of the two and the other ends up "not accepted".
const kHeldBackFor = Duration(minutes: 10);

String outpointKey(String txId, int index) => '$txId:$index';

class HeldBackCoins extends StateNotifier<Map<String, DateTime>> {
  HeldBackCoins() : super(const {});

  void add(Iterable<String> keys, {DateTime? now}) {
    final t = now ?? DateTime.now();
    state = {
      for (final e in state.entries)
        if (t.difference(e.value) < kHeldBackFor) e.key: e.value,
      for (final k in keys) k: t,
    };
  }

  /// Keys still held back at [now].
  Set<String> active({DateTime? now}) {
    final t = now ?? DateTime.now();
    return {
      for (final e in state.entries)
        if (t.difference(e.value) < kHeldBackFor) e.key,
    };
  }
}

final heldBackCoinsProvider =
    StateNotifierProvider<HeldBackCoins, Map<String, DateTime>>(
        (ref) => HeldBackCoins());

/// The wallet's coin list MINUS coins this wallet has just spent. The node's
/// list can still show those for a short while; counting them made Compound
/// think a group had far more coins than it does.
final liveUtxosProvider = Provider.autoDispose((ref) {
  final utxos = ref.watch(utxoListProvider);
  ref.watch(heldBackCoinsProvider);
  final heldBack = ref.read(heldBackCoinsProvider.notifier).active();
  if (heldBack.isEmpty) return utxos;
  return utxos
      .where((u) => !heldBack
          .contains(outpointKey(u.outpoint.transactionId, u.outpoint.index)))
      .toList();
});

/// The chain score used for EVERY "is this coin mature yet?" question, so a coin
/// is always either spendable or still arriving and never neither. Watched in
/// coarse steps (rounded DOWN, so it can only be a little cautious, never too
/// eager) so coins that mature while the app is open count without waiting for
/// some other change. Null until the first score arrives from the node.
const kScoreBucket = 10;
final matureScoreProvider = Provider.autoDispose<BigInt?>((ref) {
  final bucket = ref.watch(
    lastKnownVirtualDaaScoreProvider.select((s) => s ~/ BigInt.from(kScoreBucket)),
  );
  if (bucket == BigInt.zero) return null;
  return bucket * BigInt.from(kScoreBucket);
});

final spendableUtxosProvider = Provider.autoDispose((ref) {
  final utxos = ref.watch(utxoListProvider);
  final virtualDaaScore = ref.watch(matureScoreProvider);
  ref.watch(heldBackCoinsProvider);
  final heldBack = ref.read(heldBackCoinsProvider.notifier).active();

  final spendableUtxos = utxos.where((utxo) {
    if (heldBack.contains(
        outpointKey(utxo.outpoint.transactionId, utxo.outpoint.index))) {
      return false;
    }
    // Until the first score arrives we cannot tell, so no coin is hidden (the
    // node refuses an immature one with a clear message).
    if (virtualDaaScore == null) return true;
    return utxo.utxoEntry.blockDaaScore + BigInt.from(kMinUtxoMaturityDaaScore) <
        virtualDaaScore;
  }).toList();

  spendableUtxos.sort(
    (a, b) => b.utxoEntry.amount.compareTo(a.utxoEntry.amount),
  );

  return spendableUtxos;
});

/// Funds that have arrived but are not yet old enough to spend (see
/// [kMinUtxoMaturityDaaScore]). Part of the total balance, just not yet usable.
/// The score is bucketed so this only recalculates every few seconds.
final maturingAmountProvider = Provider.autoDispose<Amount>((ref) {
  final utxos = ref.watch(utxoListProvider);
  final score = ref.watch(matureScoreProvider);
  if (score == null) return Amount.raw(BigInt.zero);
  var raw = BigInt.zero;
  for (final u in utxos) {
    if (u.utxoEntry.blockDaaScore + BigInt.from(kMinUtxoMaturityDaaScore) >=
        score) {
      raw += u.utxoEntry.amount;
    }
  }
  return Amount.raw(raw);
});

final selectedUtxosProvider = StateProvider<ISet<Utxo>>((ref) => ISet());


/// Rough speed of the network's counter, in units per second. Used only to
/// turn "N units left" into "about N minutes" -- the wallet measures it from
/// the live score and falls back to this when it has not seen enough yet.
const kDefaultDaaPerSecond = 4.0;

/// Units left until the SOONEST still-maturing coin can be spent, or null when
/// nothing is maturing.
int? soonestMaturityUnits(Iterable<Utxo> coins, BigInt score) {
  int? soonest;
  for (final u in coins) {
    final left = (u.utxoEntry.blockDaaScore +
            BigInt.from(kMinUtxoMaturityDaaScore) -
            score)
        .toInt();
    if (left <= 0) continue; // already spendable
    if (soonest == null || left < soonest) soonest = left;
  }
  return soonest;
}

/// "less than a minute" / "about 3 minutes", for [unitsLeft] at [perSecond].
String readyInWords(int unitsLeft, double perSecond) {
  final seconds = unitsLeft / (perSecond <= 0 ? kDefaultDaaPerSecond : perSecond);
  if (seconds < 60) return 'less than a minute';
  final minutes = (seconds / 60).ceil();
  return minutes == 1 ? 'about 1 minute' : 'about $minutes minutes';
}

class DaaRateEstimator extends StateNotifier<double> {
  DaaRateEstimator() : super(kDefaultDaaPerSecond);

  final _samples = <(DateTime, BigInt)>[];

  void add(BigInt score, {DateTime? now}) {
    final t = now ?? DateTime.now();
    if (score <= BigInt.zero) return;
    _samples.add((t, score));
    _samples.removeWhere((s) => t.difference(s.$1).inSeconds > 90);
    final first = _samples.first;
    final seconds = t.difference(first.$1).inMilliseconds / 1000;
    if (seconds >= 8) {
      final rate = (score - first.$2).toInt() / seconds;
      if (rate > 0) state = rate.clamp(0.5, 50.0);
    }
  }
}

final daaRateProvider =
    StateNotifierProvider<DaaRateEstimator, double>((ref) {
  final e = DaaRateEstimator();
  ref.listen<BigInt>(lastKnownVirtualDaaScoreProvider, (_, s) => e.add(s),
      fireImmediately: true);
  return e;
});

/// What can be spent right now (mature, and not held back after a send).
final spendableNowProvider = Provider.autoDispose<Amount>((ref) {
  var raw = BigInt.zero;
  for (final u in ref.watch(spendableUtxosProvider)) {
    raw += u.utxoEntry.amount;
  }
  return Amount.raw(raw);
});

/// Plain words for when the coins still arriving can be spent, or null.
final nextCoinsReadyProvider = Provider.autoDispose<String?>((ref) {
  final score = ref.watch(matureScoreProvider);
  if (score == null) return null;
  final left = soonestMaturityUnits(ref.watch(utxoListProvider), score);
  if (left == null) return null;
  return readyInWords(left, ref.watch(daaRateProvider));
});


/// The newest coin birth (DAA score) per transaction, in one pass.
Map<String, BigInt> newestBirthByTx(Iterable<Utxo> coins) {
  final m = <String, BigInt>{};
  for (final u in coins) {
    final id = u.outpoint.transactionId;
    final b = u.utxoEntry.blockDaaScore;
    final cur = m[id];
    if (cur == null || b > cur) m[id] = b;
  }
  return m;
}

/// Built ONCE per coin-list change. Every Activity row used to scan the whole
/// coin list on every update (several times a second): with 61,000 coins that
/// froze the screen. A row now just looks its transaction up here.
final coinBirthByTxProvider = Provider.autoDispose<Map<String, BigInt>>(
  (ref) => newestBirthByTx(ref.watch(utxoListProvider)),
);
