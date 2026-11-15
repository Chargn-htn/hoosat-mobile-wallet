import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hoosat_mobile/core/core_providers.dart';
import 'package:hoosat_mobile/node_status/connection_status.dart';

final _silent = StateProvider<bool>((ref) => false);

class _Harness {
  _Harness({bool probeOk = true}) : this._probeOk = probeOk {
    monitor = StateNotifierProvider<ConnectionMonitor, ConnectionStatus>(
      (ref) => ConnectionMonitor(
        ref,
        probe: () async => _probeOk,
        delayFor: (_) => const Duration(milliseconds: 20),
        onReconnect: () => reconnects++,
      ),
    );
    container = ProviderContainer(overrides: [
      networkErrorProvider.overrideWith((ref) => ref.watch(_silent)),
      virtualDaaScoreProvider.overrideWith((ref) => feed.stream),
    ]);
    container.listen(monitor, (_, __) {});
  }

  bool _probeOk;
  late final StateNotifierProvider<ConnectionMonitor, ConnectionStatus> monitor;
  late final ProviderContainer container;
  final feed = StreamController<BigInt>.broadcast();
  int reconnects = 0;

  ConnectionStatus get status => container.read(monitor);
  set probeOk(bool v) => _probeOk = v;
  void goSilent(bool v) => container.read(_silent.notifier).state = v;
  Future<void> wait([int ms = 120]) =>
      Future<void>.delayed(Duration(milliseconds: ms));
  void dispose() {
    container.dispose();
    feed.close();
  }
}

void main() {
  test('starts live', () {
    final h = _Harness();
    expect(h.status, ConnectionStatus.live);
    h.dispose();
  });

  test('goes quiet -> reconnecting, and keeps reconnecting by itself',
      () async {
    final h = _Harness();
    h.goSilent(true);
    await h.wait();
    expect(h.status, ConnectionStatus.reconnecting); // node answers the probe
    expect(h.reconnects, greaterThanOrEqualTo(2)); // retried more than once
    h.dispose();
  });

  test('node not answering -> unreachable', () async {
    final h = _Harness(probeOk: false);
    h.goSilent(true);
    await h.wait();
    expect(h.status, ConnectionStatus.unreachable);
    h.dispose();
  });

  test('a real update makes it live again and stops the retries', () async {
    final h = _Harness();
    h.goSilent(true);
    await h.wait();
    expect(h.status, ConnectionStatus.reconnecting);

    h.feed.add(BigInt.one);
    await h.wait(30);
    expect(h.status, ConnectionStatus.live);
    final after = h.reconnects;
    await h.wait();
    expect(h.reconnects, after); // no more attempts once updates flow
    h.dispose();
  });

  test('the "last update" clock resetting alone does NOT count as live',
      () async {
    final h = _Harness();
    h.goSilent(true);
    await h.wait(60);
    h.goSilent(false); // what recreating the connection does to that clock
    await h.wait(60);
    expect(h.status, isNot(ConnectionStatus.live));
    h.dispose();
  });

  test('going to the background stops everything', () async {
    final h = _Harness();
    h.goSilent(true);
    await h.wait(60);
    h.container.read(inBackgroundProvider.notifier).state = true;
    await h.wait(30);
    expect(h.status, ConnectionStatus.live);
    final after = h.reconnects;
    await h.wait();
    expect(h.reconnects, after);
    h.dispose();
  });

  test('Retry tries again right away', () async {
    final h = _Harness();
    h.goSilent(true);
    await h.wait(30);
    final before = h.reconnects;
    h.container.read(h.monitor.notifier).retryNow();
    await h.wait(10);
    expect(h.reconnects, greaterThan(before));
    h.dispose();
  });

  test('waits get longer: 2s, 10s, 20s, 40s, then 60s at most', () {
    expect(
      [for (var i = 0; i < 7; i++) defaultReconnectDelay(i).inSeconds],
      [2, 10, 20, 40, 60, 60, 60],
    );
  });

  test('back from the background while the node is still silent: it starts again',
      () async {
    final h = _Harness();
    h.goSilent(true);
    await h.wait(60);
    h.container.read(inBackgroundProvider.notifier).state = true;
    await h.wait(30);
    expect(h.status, ConnectionStatus.live); // paused while away
    h.container.read(inBackgroundProvider.notifier).state = false;
    await h.wait(120);
    expect(h.status, isNot(ConnectionStatus.live),
        reason: 'the node never answered, so it must not stay on green');
    expect(h.reconnects, greaterThanOrEqualTo(1));
    h.dispose();
  });
}
