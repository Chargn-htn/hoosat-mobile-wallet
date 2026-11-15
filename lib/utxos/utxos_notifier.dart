import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:logger/logger.dart';

import '../database/boxes.dart';
import '../hoosat/hoosat.dart';
import '../util/retry_delay.dart';
import '../util/safe_change_notifier.dart';

String _outpointKey(Outpoint outpoint) =>
    '${outpoint.transactionId}:${outpoint.index}';

String _utxoKey(Utxo utxo) => _outpointKey(utxo.outpoint);

/// How many coins are handled before the screen is given a turn.
const kSliceSize = 2000;

class UtxosNotifier extends SafeChangeNotifier {
  final TypedBox<Utxo> _utxoBox;
  final HoosatClient client;
  final Logger log;

  final _utxosByAddress = <String, Set<Utxo>>{};
  final _balancesByAddress = <String, BigInt>{};

  final _utxoIds = <String>{};
  DateTime? _lastRefreshTime;
  static const _refreshInterval = Duration(minutes: 1);

  // Addresses whose refresh was asked for during the lockout. The lockout
  // exists to go easy on the node, but a request must never be thrown away:
  // it is run as soon as the lockout ends.
  final _pendingAddresses = <String>{};
  Timer? _pendingTimer;

  /// Overridable so tests need not wait a real minute.
  Duration refreshInterval = _refreshInterval;

  /// Consecutive failed refreshes (drives the retry back-off).
  int _failures = 0;
  Duration retryBase = const Duration(seconds: 5);

  @override
  void dispose() {
    _pendingTimer?.cancel();
    super.dispose();
  }

  List<Utxo>? _utxoList;
  List<Utxo> get utxoList {
    if (_utxoList == null) {
      _utxoList = ListSet.of(
        _utxosByAddress.values.flattened,
        sort: true,
        compare: (a, b) =>
            b.utxoEntry.blockDaaScore.compareTo(a.utxoEntry.blockDaaScore),
      );
    }
    return _utxoList!;
  }

  UtxosNotifier({
    required TypedBox<Utxo> utxoBox,
    required this.client,
    required this.log,
  }) : _utxoBox = utxoBox {
    final utxos = _utxoBox.getAll().values;
    for (final utxo in utxos) {
      final set = _utxosByAddress.putIfAbsent(utxo.address, () => <Utxo>{});
      set.add(utxo);
      _balancesByAddress.update(
          utxo.address, (value) => value + utxo.utxoEntry.amount,
          ifAbsent: () => utxo.utxoEntry.amount);
    }
    _utxoIds.addAll(utxos.map(_utxoKey));
    _utxoList = null;
  }

  bool isWalletOutpoint(Outpoint outpoint) {
    final key = _outpointKey(outpoint);
    return _utxoIds.contains(key);
  }

  Future<void> refreshWithBalances({
    required IMap<String, BigInt> balances,
  }) async {
    final addresses = <String>{};
    for (final balance in balances.entries) {
      final utxosBalance = _balancesByAddress[balance.key] ?? BigInt.zero;
      if (balance.value != utxosBalance) {
        addresses.add(balance.key);
      }
    }
    if (addresses.isNotEmpty) {
      return refresh(addresses: addresses);
    }
  }

  Future<void> _writeInSlices(List<Utxo> coins) async {
    for (var i = 0; i < coins.length; i += kSliceSize) {
      final end = i + kSliceSize > coins.length ? coins.length : i + kSliceSize;
      await _utxoBox.setAll({
        for (final u in coins.sublist(i, end)) _utxoKey(u): u,
      });
      await Future<void>.delayed(Duration.zero);
    }
  }

  Future<void> _removeInSlices(List<String> keys) async {
    for (var i = 0; i < keys.length; i += kSliceSize) {
      final end = i + kSliceSize > keys.length ? keys.length : i + kSliceSize;
      await _utxoBox.removeAll(keys.sublist(i, end));
      await Future<void>.delayed(Duration.zero);
    }
  }

  /// [force] is for something the user explicitly asked for (pull to
  /// refresh, opening Send): it skips the lockout.
  Future<void> refresh({
    required Iterable<String> addresses,
    bool force = false,
  }) async {
    // Check if enough time has passed since the last refresh
    final now = DateTime.now();
    if (!force &&
        _lastRefreshTime != null &&
        now.difference(_lastRefreshTime!) < refreshInterval) {
      final wait = refreshInterval - now.difference(_lastRefreshTime!);
      log.i('Refresh postponed ${wait.inSeconds}s (not dropped)');
      _pendingAddresses.addAll(addresses);
      _pendingTimer ??= Timer(wait, () {
        _pendingTimer = null;
        if (disposed || _pendingAddresses.isEmpty) return;
        final due = Set.of(_pendingAddresses);
        _pendingAddresses.clear();
        refresh(addresses: due).catchError((_) {});
      });
      return;
    }

    // Anything postponed earlier rides along with this refresh.
    addresses = {...addresses, ..._pendingAddresses};
    _pendingAddresses.clear();
    _pendingTimer?.cancel();
    _pendingTimer = null;

    // Two refreshes running at once would write the same coins twice and race.
    // The slicing above gives the event loop turns mid-refresh, so guard it:
    // a refresh asked for while one is running waits its turn.
    if (_running) {
      if (force) {
        // Someone explicitly needs fresh coins (e.g. Compound between rounds):
        // wait for the running refresh, then run our own. Returning at once
        // would hand back the OLD list.
        await _runningFuture;
        return refresh(addresses: addresses, force: true);
      }
      _pendingAddresses.addAll(addresses);
      return;
    }
    _running = true;
    final done = Completer<void>();
    _runningFuture = done.future;
    try {
      await _refreshNow(addresses, now);
    } finally {
      _running = false;
      done.complete();
      if (_pendingAddresses.isNotEmpty && !disposed && _pendingTimer == null) {
        _pendingTimer = Timer(Duration.zero, () {
          _pendingTimer = null;
          if (disposed || _pendingAddresses.isEmpty) return;
          final due = Set.of(_pendingAddresses);
          _pendingAddresses.clear();
          refresh(addresses: due, force: true).catchError((_) {});
        });
      }
    }
  }

  bool _running = false;
  Future<void>? _runningFuture;

  /// True when the most recent refresh got no answer from the node (the notifier
  /// retries by itself; callers that must not plan from an old list can check).
  bool lastRefreshFailed = false;

  Future<void> _refreshNow(Iterable<String> addresses, DateTime now) async {
    log.i('Starting refresh for ${addresses.length} addresses at $now');
    _lastRefreshTime = now; // Update last refresh time

    final oldUtxos = <String, Set<Utxo>>{};
    for (final address in addresses) {
      final set = _utxosByAddress[address];
      if (set == null || set.isEmpty) continue;
      oldUtxos[address] = Set.of(set);
    }

    try {
      final utxos = await client.getUtxosByAddresses(addresses);

      final newUtxos = <String, Set<Utxo>>{};
      var converted = 0;
      for (final rpc in utxos) {
        final utxo = Utxo.fromRpc(rpc);
        newUtxos.putIfAbsent(utxo.address, () => <Utxo>{}).add(utxo);
        // A big wallet is tens of thousands of coins: every so often let the
        // screen draw, so a phone does not freeze while they are read.
        if (++converted % kSliceSize == 0) {
          await Future<void>.delayed(Duration.zero);
        }
      }

      for (final address in addresses) {
        final oldSet = oldUtxos[address] ?? {};
        final newSet = newUtxos[address] ?? {};

        _utxosByAddress[address] = newSet;
        _balancesByAddress[address] = newSet.fold(
          BigInt.zero,
          (total, utxo) => total + utxo.utxoEntry.amount,
        );

        // Update box
        final removeSet = oldSet.difference(newSet);
        final addSet = newSet.difference(oldSet);
        if (removeSet.isNotEmpty) {
          await _removeInSlices(removeSet.map(_utxoKey).toList());
        }
        if (addSet.isNotEmpty) {
          await _writeInSlices(addSet.toList());
          // Update id set
          _utxoIds.addAll(addSet.map((utxo) => _utxoKey(utxo)));
        }
      }

      _utxoList = null;
      notifyListeners();
      _failures = 0;
      lastRefreshFailed = false;
      final total = newUtxos.values.fold(0, (sum, set) => sum + set.length);
      log.i('Refresh completed for ${addresses.length} addresses, $total UTXOs');
    } catch (e, stackTrace) {
      log.e('Refresh failed: $e\n$stackTrace');
      // A failed refresh must not leave the wallet's coin list stale until
      // something else happens to change: try again, slowing down each time.
      _failures++;
      lastRefreshFailed = true;
      _lastRefreshTime = null;
      _pendingAddresses.addAll(addresses);
      _pendingTimer?.cancel();
      _pendingTimer = Timer(retryDelay(_failures, base: retryBase), () {
        _pendingTimer = null;
        if (disposed || _pendingAddresses.isEmpty) return;
        final due = Set.of(_pendingAddresses);
        _pendingAddresses.clear();
        refresh(addresses: due);
      });
    }
  }
}
