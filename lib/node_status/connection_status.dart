import 'dart:async';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core_providers.dart';
import '../hoosat/client/hoosat_client.dart';
import '../node_settings/node_providers.dart';

/// What the wallet knows about its link to the node right now.
enum ConnectionStatus {
  /// Live updates are arriving.
  live,

  /// Updates stopped, the wallet is reconnecting (the node itself still
  /// answers, or we have not finished checking yet).
  reconnecting,

  /// The node did not answer at all.
  unreachable,
}

/// Wait before reconnect attempt [attempt] (0-based): a quick first try, then
/// slower and slower so a down node is not hammered.
Duration defaultReconnectDelay(int attempt) {
  const seconds = [2, 10, 20, 40, 60];
  return Duration(seconds: seconds[min(attempt, seconds.length - 1)]);
}

/// Asks the current node a simple question on a fresh connection.
/// True = it answered, false = it did not.
Future<bool> probeCurrentNode(Ref ref) async {
  final config = ref.read(hoosatNodeConfigProvider);
  final resolved = ref.read(resolvedNodeHostProvider).valueOrNull;
  final client = HoosatClient.url(
    resolved ?? config.url,
    isSecure: config.isSecure,
  );
  try {
    await client.getInfo().timeout(const Duration(seconds: 6));
    return true;
  } catch (_) {
    return false;
  } finally {
    try {
      await client.terminate();
    } catch (_) {}
  }
}

/// Watches the live feed from the node and, when it goes quiet, does what the
/// Retry button does -- automatically, with growing waits between attempts.
///
/// "Live" is only declared when a real notification arrives. (Recreating the
/// connection resets the "last update" clock, so that clock alone would clear
/// the warning even if the new connection were still dead.)
class ConnectionMonitor extends StateNotifier<ConnectionStatus> {
  ConnectionMonitor(
    this._ref, {
    required this.probe,
    required this.delayFor,
    required this.onReconnect,
  }) : super(ConnectionStatus.live) {
    _subs.add(
        _ref.listen<AsyncValue<BigInt>>(virtualDaaScoreProvider, (_, next) {
      if (next is AsyncData<BigInt>) _onEvent();
    }));
    _subs.add(_ref.listen<bool>(networkErrorProvider, (_, silent) {
      if (silent) _onSilent();
    }, fireImmediately: true));
    _subs.add(_ref.listen<bool>(inBackgroundProvider, (_, background) {
      if (background) {
        _stop();
      } else if (_ref.read(networkErrorProvider)) {
        // Back in the foreground and the node is STILL silent (the warning
        // never cleared while we were away): start looking after it again.
        _onSilent();
      }
    }));
  }

  final Ref _ref;
  final Future<bool> Function() probe;
  final Duration Function(int attempt) delayFor;
  final void Function() onReconnect;

  final _subs = <ProviderSubscription<Object?>>[];
  Timer? _timer;
  int _attempt = 0;
  bool _busy = false; // a reconnect attempt is in progress
  bool _retryAgain = false; // Retry was pressed while an attempt was running

  void _stop() {
    _timer?.cancel();
    _timer = null;
    _attempt = 0;
    state = ConnectionStatus.live;
  }

  void _onEvent() => _stop();

  void _onSilent() {
    if (_ref.read(inBackgroundProvider)) return;
    if (state == ConnectionStatus.live) state = ConnectionStatus.reconnecting;
    _schedule();
  }

  void _schedule() {
    if (_busy || (_timer?.isActive ?? false)) return;
    _timer = Timer(delayFor(_attempt), _attemptReconnect);
  }

  Future<void> _attemptReconnect() async {
    _timer = null;
    if (_busy || !mounted || state == ConnectionStatus.live) return;
    if (_ref.read(inBackgroundProvider)) return;

    _busy = true;
    try {
      final reachable = await probe();
      if (!mounted || state == ConnectionStatus.live) return;
      state = reachable
          ? ConnectionStatus.reconnecting
          : ConnectionStatus.unreachable;

      onReconnect();
      _attempt++;
    } finally {
      _busy = false;
    }
    if (_retryAgain) {
      // The person pressed Retry during the attempt: do it again right away
      // instead of ignoring the tap.
      _retryAgain = false;
      if (mounted && state != ConnectionStatus.live) {
        _attemptReconnect();
        return;
      }
    }
    if (mounted && state != ConnectionStatus.live) _schedule();
  }

  /// The Retry button: try again right now.
  void retryNow() {
    _timer?.cancel();
    _timer = null;
    if (_busy) {
      _retryAgain = true;
      return;
    }
    if (state == ConnectionStatus.live) state = ConnectionStatus.reconnecting;
    _attemptReconnect();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final s in _subs) {
      s.close();
    }
    super.dispose();
  }
}

final connectionStatusProvider =
    StateNotifierProvider<ConnectionMonitor, ConnectionStatus>((ref) {
  return ConnectionMonitor(
    ref,
    probe: () => probeCurrentNode(ref),
    delayFor: defaultReconnectDelay,
    onReconnect: () => ref.invalidate(hoosatClientProvider),
  );
});
