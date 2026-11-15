import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/utxos/utxos_providers.dart';

void main() {
  final t0 = DateTime(2026, 11, 13, 12, 0);

  test('spent coins are held back for 10 minutes, then released', () {
    final h = HeldBackCoins();
    h.add([outpointKey('aa', 0), outpointKey('bb', 1)], now: t0);
    expect(h.active(now: t0.add(const Duration(minutes: 9))),
        {'aa:0', 'bb:1'});
    expect(h.active(now: t0.add(const Duration(minutes: 11))), isEmpty);
  });

  test('adding later forgets expired entries and keeps fresh ones', () {
    final h = HeldBackCoins();
    h.add(['old:0'], now: t0);
    h.add(['new:0'], now: t0.add(const Duration(minutes: 12)));
    expect(h.state.keys, ['new:0']);
  });
}
