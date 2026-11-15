import 'hoosat_api_base.dart';
import 'types.dart';

/// Tries [primary] first; if it fails, uses [secondary], so a real outage on
/// one side is retried on the other instead of surfacing as a crash.
///
/// Two things keep a dead primary from slowing everything down (an explorer
/// that is unreachable from the user's network, for example):
///  * the primary gets ONE attempt, and the retries go to the secondary;
///  * once the primary has failed, calls go straight to the secondary for
///    [breakerWindow] before the primary is tried again.
/// If the secondary also fails while the primary is being skipped, the
/// primary is tried once as a last resort.
class HoosatApiFallback implements HoosatApi {
  final HoosatApi primary;
  final HoosatApi secondary;
  final Duration breakerWindow;

  DateTime? _primaryDownUntil;

  HoosatApiFallback(
    this.primary,
    this.secondary, {
    this.breakerWindow = const Duration(minutes: 3),
  });

  /// True when [e] means the server could not be reached or is failing. An
  /// explorer that ANSWERED with a client error ("not found", "bad request") is
  /// working, so it is not skipped for a while because of that.
  static bool _isOutage(Object e) {
    if (e is ApiHttpError) {
      return e.status >= 500 || e.status == 429 || e.status == 408;
    }
    return true; // time-outs, no connection, anything unknown
  }

  Future<T> _call<T>(
    Future<T> Function(HoosatApi api, int retryCount) fn,
    int retryCount,
  ) async {
    final until = _primaryDownUntil;
    final skipPrimary = until != null && DateTime.now().isBefore(until);

    if (!skipPrimary) {
      try {
        return await fn(primary, 0);
      } catch (e) {
        // Only a primary that could not be REACHED (time-out, no connection,
        // server error) is skipped for a while. An explorer that answered
        // "not found" or "bad request" is working: skipping it would silently
        // serve everything from the secondary.
        // This one call still goes to the secondary below.
        if (_isOutage(e)) {
          _primaryDownUntil = DateTime.now().add(breakerWindow);
        }
      }
    }

    try {
      return await fn(secondary, retryCount);
    } catch (e) {
      if (skipPrimary) {
        try {
          final result = await fn(primary, 0);
          _primaryDownUntil = null;
          return result;
        } catch (_) {}
      }
      rethrow;
    }
  }

  @override
  Future<ApiAddressBalance> getBalance({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getBalance(
          address: address,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

  @override
  Future<List<ApiUtxo>> getUtxos({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getUtxos(
          address: address,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

  @override
  Future<List<ApiTxLink>> getTxLinks({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getTxLinks(
          address: address,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

  @override
  Future<int> getTxCount({
    required String address,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getTxCount(
          address: address,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

  @override
  Future<List<ApiTxId>> getTxIdsForAddress(
    String address, {
    int limit = 500,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getTxIdsForAddress(
          address,
          limit: limit,
          offset: offset,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

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
      _call(
        (api, retries) => api.getTxsForAddress(
          address,
          resolvePreviousOutpoints: resolvePreviousOutpoints,
          limit: limit,
          offset: offset,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

  @override
  Future<ApiTransaction> getTransaction({
    required String id,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getTransaction(
          id: id,
          resolvePreviousOutpoints: resolvePreviousOutpoints,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );

  @override
  Future<List<ApiTransaction>> getTransactions({
    required Iterable<String> ids,
    ResolvePreviousOutpoints resolvePreviousOutpoints =
        ResolvePreviousOutpoints.light,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      _call(
        (api, retries) => api.getTransactions(
          ids: ids,
          resolvePreviousOutpoints: resolvePreviousOutpoints,
          retryCount: retries,
          retryDelay: retryDelay,
        ),
        retryCount,
      );
}
