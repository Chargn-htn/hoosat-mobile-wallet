import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';
import 'package:hoosat_mobile/transactions/recent_outpoints_provider.dart';

Outpoint op(int i) => Outpoint(transactionId: 'tx$i', index: 0);

void main() {
  test('adds many coins at once and keeps what was already there', () {
    final r = RecentOutpoints();
    r.add(op(0), 'a0', 5);
    r.addAll([(op(1), 'a1', 10), (op(2), 'a2', 20)]);
    expect(r.getEntry('tx0', 0), ('a0', 5));
    expect(r.getEntry('tx1', 0), ('a1', 10));
    expect(r.getEntry('tx2', 0), ('a2', 20));
    expect(r.state.length, 3);
  });

  test('a repeated coin is overwritten, not duplicated', () {
    final r = RecentOutpoints();
    r.addAll([(op(1), 'old', 1)]);
    r.addAll([(op(1), 'new', 2)]);
    expect(r.state.length, 1);
    expect(r.getEntry('tx1', 0), ('new', 2));
  });

  test('a whole big wallet is remembered in well under a second', () {
    // 61,000 coins used to take about a minute (one map copy per coin).
    final r = RecentOutpoints();
    final sw = Stopwatch()..start();
    r.addAll([for (var i = 0; i < 61000; i++) (op(i), 'addr', i)]);
    sw.stop();
    expect(r.state.length, 61000);
    expect(sw.elapsedMilliseconds, lessThan(3000));
  });
}
