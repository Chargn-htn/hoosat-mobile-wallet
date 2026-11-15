import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/util/retry_delay.dart';

void main() {
  group('retryDelay', () {
    test('starts at the base, triples each time and stops at the cap', () {
      expect(retryDelay(1), const Duration(seconds: 5));
      expect(retryDelay(2), const Duration(seconds: 15));
      expect(retryDelay(3), const Duration(seconds: 45));
      expect(retryDelay(4), const Duration(seconds: 60));
      expect(retryDelay(5), const Duration(seconds: 60));
    });

    test('a very long outage never gives a zero or negative wait', () {
      // The old formula (base * 3^(n-1)) overflowed to a negative number at
      // some of these counts, which meant "retry immediately".
      for (final n in [30, 35, 36, 37, 39, 40, 41, 42, 43, 50, 60, 64, 100,
          1000, 100000]) {
        final d = retryDelay(n);
        expect(d, const Duration(seconds: 60), reason: 'failure #$n');
      }
    });

    test('works with a short base (as the tests use) and a custom cap', () {
      expect(retryDelay(1, base: const Duration(milliseconds: 40)),
          const Duration(milliseconds: 40));
      expect(retryDelay(2, base: const Duration(milliseconds: 40)),
          const Duration(milliseconds: 120));
      expect(
          retryDelay(10,
              base: const Duration(milliseconds: 40),
              max: const Duration(milliseconds: 500)),
          const Duration(milliseconds: 500));
    });

    test('zero or negative failure counts act like the first retry', () {
      expect(retryDelay(0), const Duration(seconds: 5));
      expect(retryDelay(-3), const Duration(seconds: 5));
    });
  });
}
