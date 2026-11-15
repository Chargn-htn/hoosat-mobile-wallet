import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../database/boxes.dart';
import '../hoosat/hoosat.dart';
import '../util/retry_delay.dart';
import '../util/safe_change_notifier.dart';
import '../wallet_address/wallet_address_aware.dart';

class WalletBalanceNotifier extends SafeChangeNotifier {
  final TypedBox<AddressBalance> _balanceBox;
  final WalletAddressAware addressAware;
  final HoosatClient client;

  final Map<String, BigInt> _balances = {};
  BigInt _totalBalance = BigInt.zero;
  DateTime? _lastRefreshTime;
  static const _refreshInterval = Duration(seconds: 1);

  // Refreshes asked for during the lockout are postponed, never dropped.
  final _pendingAddresses = <String>{};
  Timer? _pendingTimer;

  @override
  void dispose() {
    _pendingTimer?.cancel();
    super.dispose();
  }

  WalletBalanceNotifier({
    required TypedBox<AddressBalance> balanceBox,
    required this.addressAware,
    required this.client,
  }) : _balanceBox = balanceBox {
    final balances = _balanceBox.getAll();
    for (final balance in balances.values) {
      if (!addressAware.containsAddress(balance.address)) {
        continue;
      }
      _balances[balance.address] = balance.balance;
    }
    _totalBalance = _balances.values.fold(BigInt.zero, (a, b) => a + b);
  }

  IMap<String, BigInt>? _cachedBalances;
  IMap<String, BigInt> get balances {
    if (_cachedBalances == null) {
      _cachedBalances = _balances.toIMap();
    }
    return _cachedBalances!;
  }

  Amount get totalBalance => Amount.raw(_totalBalance);

  IMap<String, AddressBalance> _lastRefreshChanges = IMap();
  IMap<String, AddressBalance> get lastRefreshChanges => _lastRefreshChanges;

  Amount balanceForAddress(String address) =>
      Amount.raw(_balances[address] ?? BigInt.zero);

  int _failures = 0; // refreshes in a row that got no answer

  Future<void> refresh(Iterable<String> addresses, {bool force = false}) async {
    final now = DateTime.now();
    if (!force &&
        _lastRefreshTime != null &&
        now.difference(_lastRefreshTime!) < _refreshInterval) {
      _pendingAddresses.addAll(addresses);
      _pendingTimer ??= Timer(
        _refreshInterval - now.difference(_lastRefreshTime!),
        () {
          _pendingTimer = null;
          if (disposed || _pendingAddresses.isEmpty) return;
          final due = Set.of(_pendingAddresses);
          _pendingAddresses.clear();
          refresh(due);
        },
      );
      return;
    }

    addresses = {...addresses, ..._pendingAddresses};
    _pendingAddresses.clear();
    _pendingTimer?.cancel();
    _pendingTimer = null;
    _lastRefreshTime = now;

    if (addresses.isEmpty) {
      return;
    }

    try {
      final newBalances = await client.getBalancesByAddresses(addresses);
      _failures = 0;
      final entries = newBalances.map(AddressBalance.fromRpc);

      final changes = <String, AddressBalance>{};
      for (final entry in entries) {
        final newBalance = entry.balance;
        final oldBalance = _balances[entry.address] ?? BigInt.zero;

        if (newBalance != oldBalance) {
          changes[entry.address] = entry;
          _balances[entry.address] = newBalance;
          _totalBalance += newBalance - oldBalance;
        }
      }

      if (changes.isNotEmpty) {
        final balanceChanges = changes.map((_, value) {
          final key = addressAware.keyForAddress(value.address) ?? '';
          return MapEntry(key, value);
        });
        balanceChanges.remove('');
        await _balanceBox.setAll(balanceChanges);

        _lastRefreshChanges = changes.toIMap();
        _cachedBalances = null;
        notifyListeners();
      }
    } catch (_) {
      // A node blip should not fail the wallet refresh -- and must not leave
      // the balances stale either: allow the next call straight away and
      // schedule one retry so it does not depend on something else changing.
      _lastRefreshTime = null;
      _pendingAddresses.addAll(addresses);
      // Wait longer after every failure (5 s, 15 s, 45 s, then 60 s at most), so
      // a node that is down is not asked for every address again and again.
      _failures++;
      _pendingTimer ??= Timer(retryDelay(_failures), () {
        _pendingTimer = null;
        if (disposed || _pendingAddresses.isEmpty) return;
        final due = Set.of(_pendingAddresses);
        _pendingAddresses.clear();
        refresh(due);
      });
    }
  }
}
