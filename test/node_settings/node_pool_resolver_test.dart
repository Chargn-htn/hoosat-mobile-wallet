import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/node_settings/node_pool_resolver.dart';

void main() {
  group('NodePoolResolver', () {
    final resolver = const NodePoolResolver();

    test('resolveDnsPool falls back to the hostname itself when DNS lookup fails',
        () async {
      // A hostname that cannot resolve (.invalid is reserved by RFC 2606
      // and guaranteed to never be a real registered domain, so this
      // doesn't depend on any external service's uptime).
      final result =
          await resolver.resolveDnsPool('this-does-not-exist.invalid');
      expect(result, ['this-does-not-exist.invalid']);
    });

    test('pickFastestNode returns null when nothing in the pool answers',
        () async {
      // 192.0.2.0/24 is reserved for documentation (RFC 5737) -- it will
      // never route anywhere, so this reliably times out without
      // depending on any real node being up or down.
      final result = await resolver.pickFastestNode(
        ['192.0.2.1', '192.0.2.2'],
        port: 42420,
        timeout: const Duration(seconds: 1),
      );
      expect(result, isNull);
    });

    test('pickFastestNode returns null for an empty candidate list', () async {
      final result = await resolver.pickFastestNode(
        [],
        port: 42420,
        timeout: const Duration(seconds: 1),
      );
      expect(result, isNull);
    });
  });
}
