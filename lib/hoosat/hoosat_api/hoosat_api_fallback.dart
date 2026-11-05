import 'hoosat_api_base.dart';
import 'types.dart';

/// Tries [primary] first; only on a clean failure (after primary's own
/// internal retries are exhausted) does it try [secondary]. Mirrors the
/// same primary-then-fallback pattern already proven for the Owl bank's
/// EU-explorer fallback (see chain.go's explorerTx()) -- a real outage
/// on one side is retried on the other instead of surfacing as a crash.
class HoosatApiFallback implements HoosatApi {
  final HoosatApi primary;
  final HoosatApi secondary;

  HoosatApiFallback(this.primary, this.secondary);

  @override
  Future<ApiAddressBalance> getBalance({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getBalance(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getBalance(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<List<ApiUtxo>> getUtxos({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getUtxos(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getUtxos(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<List<ApiTxLink>> getTxLinks({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getTxLinks(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getTxLinks(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<int> getTxCount({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getTxCount(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getTxCount(
        address: address,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<List<ApiTxId>> getTxIdsForAddress(
    String address, {
    int limit = 500,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getTxIdsForAddress(
        address,
        limit: limit,
        offset: offset,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getTxIdsForAddress(
        address,
        limit: limit,
        offset: offset,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<List<ApiTransaction>> getTxsForAddress(
    String address, {
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int limit = 100,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getTxsForAddress(
        address,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        limit: limit,
        offset: offset,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getTxsForAddress(
        address,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        limit: limit,
        offset: offset,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<ApiTransaction> getTransaction({
    required String id,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getTransaction(
        id: id,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getTransaction(
        id: id,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }

  @override
  Future<List<ApiTransaction>> getTransactions({
    required Iterable<String> ids,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    try {
      return await primary.getTransactions(
        ids: ids,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    } catch (_) {
      return secondary.getTransactions(
        ids: ids,
        resolvePreviousOutpoints: resolvePreviousOutpoints,
        retryCount: retryCount,
        retryDelay: retryDelay,
      );
    }
  }
}
