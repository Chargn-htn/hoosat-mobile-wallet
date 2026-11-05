import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat_api/hoosat_api.dart';

/// Always throws -- stands in for a dead/unreachable explorer.
class _FailingApi implements HoosatApi {
  @override
  Future<ApiAddressBalance> getBalance({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<List<ApiUtxo>> getUtxos({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<List<ApiTxLink>> getTxLinks({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<int> getTxCount({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<List<ApiTxId>> getTxIdsForAddress(
    String address, {
    int limit = 500,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<List<ApiTransaction>> getTxsForAddress(
    String address, {
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int limit = 100,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<ApiTransaction> getTransaction({
    required String id,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');

  @override
  Future<List<ApiTransaction>> getTransactions({
    required Iterable<String> ids,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      throw Exception('down');
}

/// Always succeeds, with a value that's identifiable as "the fallback".
class _WorkingApi implements HoosatApi {
  @override
  Future<ApiAddressBalance> getBalance({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      ApiAddressBalance(address: address, balance: 42);

  @override
  Future<List<ApiUtxo>> getUtxos({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      [];

  @override
  Future<List<ApiTxLink>> getTxLinks({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      [];

  @override
  Future<int> getTxCount({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      7;

  @override
  Future<List<ApiTxId>> getTxIdsForAddress(
    String address, {
    int limit = 500,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      [];

  @override
  Future<List<ApiTransaction>> getTxsForAddress(
    String address, {
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int limit = 100,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      [];

  @override
  Future<ApiTransaction> getTransaction({
    required String id,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      ApiTransaction(
        transactionId: id,
        blockTime: 0,
        isAccepted: true,
        inputs: const [],
        outputs: const [],
      );

  @override
  Future<List<ApiTransaction>> getTransactions({
    required Iterable<String> ids,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async =>
      [];
}

void main() {
  group('HoosatApiFallback', () {
    test('uses primary when it succeeds', () async {
      final fallback = HoosatApiFallback(_WorkingApi(), _FailingApi());
      final balance = await fallback.getBalance(address: 'addr');
      expect(balance.balance, 42);
    });

    test('falls back to secondary when primary throws', () async {
      final fallback = HoosatApiFallback(_FailingApi(), _WorkingApi());
      final balance = await fallback.getBalance(address: 'addr');
      expect(balance.balance, 42);
    });

    test('propagates the error when both sides fail', () async {
      final fallback = HoosatApiFallback(_FailingApi(), _FailingApi());
      expect(() => fallback.getBalance(address: 'addr'), throwsException);
    });

    test('falls back correctly for getTransaction too', () async {
      final fallback = HoosatApiFallback(_FailingApi(), _WorkingApi());
      final tx = await fallback.getTransaction(id: 'tx1');
      expect(tx.isAccepted, true);
    });

    test('falls back correctly for getTxCount too', () async {
      final fallback = HoosatApiFallback(_FailingApi(), _WorkingApi());
      final count = await fallback.getTxCount(address: 'addr');
      expect(count, 7);
    });
  });
}
