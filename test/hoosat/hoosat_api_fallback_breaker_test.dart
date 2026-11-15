import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat_api/hoosat_api.dart';

class _Spy extends HoosatApiEmpty {
  _Spy({this.fail = false, this.value = 7, this.failWith});
  bool fail;
  Object? failWith; // what a failure throws (default: a plain outage)
  final int value;
  int calls = 0;
  int? lastRetryCount;

  @override
  Future<int> getTxCount({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    calls++;
    lastRetryCount = retryCount;
    if (fail) throw failWith ?? Exception('down');
    return value;
  }
}

void main() {
  test('primary gets one attempt; the secondary gets the full retries',
      () async {
    final primary = _Spy(fail: true);
    final secondary = _Spy(value: 9);
    final api = HoosatApiFallback(primary, secondary);

    expect(await api.getTxCount(address: 'a', retryCount: 3), 9);
    expect(primary.calls, 1);
    expect(primary.lastRetryCount, 0);
    expect(secondary.lastRetryCount, 3);
  });

  test('after the primary fails, later calls skip it for a while', () async {
    final primary = _Spy(fail: true);
    final secondary = _Spy(value: 9);
    final api = HoosatApiFallback(primary, secondary);

    await api.getTxCount(address: 'a');
    await api.getTxCount(address: 'b');
    await api.getTxCount(address: 'c');
    expect(primary.calls, 1); // not asked again
    expect(secondary.calls, 3);
  });

  test('the primary is tried again once the window has passed', () async {
    final primary = _Spy(fail: true);
    final secondary = _Spy(value: 9);
    final api = HoosatApiFallback(
      primary,
      secondary,
      breakerWindow: const Duration(milliseconds: 50),
    );
    await api.getTxCount(address: 'a');
    primary.fail = false;
    await Future<void>.delayed(const Duration(milliseconds: 80));
    expect(await api.getTxCount(address: 'b'), 7); // back on the primary
  });

  test(
      'if the secondary fails while the primary is skipped, the primary is '
      'tried as a last resort', () async {
    final primary = _Spy(fail: true);
    final secondary = _Spy(fail: true);
    final api = HoosatApiFallback(primary, secondary);
    await expectLater(api.getTxCount(address: 'a'), throwsException);

    primary.fail = false; // primary recovers while still "skipped"
    secondary.fail = true;
    expect(await api.getTxCount(address: 'b'), 7);
  });

  test('"not found" from the primary does not make it skipped for minutes',
      () async {
    final primary = _Spy(fail: true, failWith: ApiHttpError(404, 'Failed to get transaction'));
    final secondary = _Spy(value: 9);
    final api = HoosatApiFallback(primary, secondary);

    expect(await api.getTxCount(address: 'a'), 9); // this call still tries the secondary
    primary.fail = false;
    expect(await api.getTxCount(address: 'b'), 7,
        reason: 'the primary answered, so it is still used');
    expect(primary.calls, 2);
  });

  test('a failing server (HTTP 500) does trip the breaker', () async {
    final primary = _Spy(fail: true, failWith: ApiHttpError(500, 'Failed to get balance'));
    final secondary = _Spy(value: 9);
    final api = HoosatApiFallback(primary, secondary);
    await api.getTxCount(address: 'a');
    await api.getTxCount(address: 'b');
    expect(primary.calls, 1);
  });
}
