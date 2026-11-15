import 'dart:async';
import 'dart:math';

import '../../hoosat/grpc/rpc.pb.dart';
import '../../hoosat/hoosat.dart';
import '../wallet_address.dart';
import 'address_discovery_types.dart';

/// The caller asked to stop (onProgress returned false).
///
/// Whatever was found before stopping is NOT thrown away: [partial] holds the
/// result of the scan that was running, [walletPartial] the receive + change
/// result when the whole-wallet search was running.
class DiscoveryCancelled implements Exception {
  DiscoveryCancelled({this.partial, this.walletPartial});
  final DiscoveryResult? partial;
  final WalletDiscoveryResult? walletPartial;
  @override
  String toString() => 'Address discovery was cancelled';
}

/// The node kept failing after several tries, so the search is incomplete.
/// What was found so far is kept in [partial] / [walletPartial], as above.
class DiscoveryFailed implements Exception {
  DiscoveryFailed(this.message, {this.partial, this.walletPartial});
  final String message;
  final DiscoveryResult? partial;
  final WalletDiscoveryResult? walletPartial;
  @override
  String toString() => message;
}

class AddressDiscovery {
  final HoosatApiService api;
  final HoosatClient client;
  final HdAddressGenerator addressGenerator;
  final AddressNameCallback addressNameCallback;

  /// Wait before retry n is `retryBaseDelay * n` (adjustable for tests).
  final Duration retryBaseDelay;

  /// Plain-words report of what the scan is doing right now (shown on screen
  /// so a stall can be located). Optional.
  final void Function(String stage)? onStage;

  /// Longest wait for one address's transaction history from the explorer.
  /// History is a nice-to-have during a scan (the normal sync fetches it
  /// later), so a slow or unreachable explorer must never hold the scan up.
  final Duration historyTimeout;

  final _cache = <(int, AddressType), WalletAddress>{};

  AddressDiscovery({
    required this.api,
    required this.client,
    required this.addressGenerator,
    required this.addressNameCallback,
    this.retryBaseDelay = const Duration(seconds: 2),
    this.onStage,
    this.historyTimeout = const Duration(seconds: 20),
  });

  WalletAddress get mainAddress {
    const index = 0;
    const type = AddressType.receive;
    return WalletAddress(
      index: index,
      type: type,
      name: addressNameCallback(type, index),
      address: addressGenerator.mainAddress,
      used: false,
    );
  }

  WalletDiscoveryResult get newWalletDiscoveryResult {
    const index = 0;
    final discovery = (
      receive: DiscoveryResult(
        addresses: {index: mainAddress},
        txIds: {},
        scanIndexes: ScanIndexes(start: index, scanned: index, last: index),
      ),
      change: DiscoveryResult(
        addresses: {},
        txIds: {},
        scanIndexes: ScanIndexes.empty,
      ),
    );
    return discovery;
  }

  Future<WalletAddress> getAddress({
    required int index,
    required AddressType type,
  }) async {
    if (_cache[(index, type)] case final cached?) {
      return cached;
    }
    final address = await addressGenerator.addressAtIndex(
      typeIndex: type.index,
      index: index,
    );
    final name = addressNameCallback(type, index);
    final walletAddress = WalletAddress(
      index: index,
      type: type,
      address: address,
      name: name,
      used: false,
    );
    _cache[(index, type)] = walletAddress;
    return walletAddress;
  }

  Future<Iterable<WalletAddress>> getAddresses({
    required int startIndex,
    required AddressType type,
    required int count,
  }) async {
    final wanted = [for (var i = startIndex; i < startIndex + count; i++) i];
    final missing = wanted.where((i) => !_cache.containsKey((i, type)));
    if (missing.isNotEmpty) {
      final first = missing.first;
      final last = missing.last;
      // Derived in background workers: the maths is heavy on a slow phone
      // and would otherwise freeze the screen.
      final sw = Stopwatch()..start();
      onStage?.call('calculating addresses $first-$last');
      final derived = await addressGenerator.addressesAt(
        typeIndex: type.index,
        startIndex: first,
        count: last - first + 1,
      );
      onStage?.call(
          'calculated ${derived.length} in ${sw.elapsedMilliseconds} ms');
      for (var k = 0; k < derived.length; k++) {
        final index = first + k;
        _cache.putIfAbsent(
          (index, type),
          () => WalletAddress(
            index: index,
            type: type,
            address: derived[k],
            name: addressNameCallback(type, index),
            used: false,
          ),
        );
      }
    }
    return [for (final i in wanted) _cache[(i, type)]!];
  }

  Future<bool> _checkForUsedAddresses(Iterable<String> addresses) async {
    final balances = await client.getBalancesByAddresses(addresses);

    final anyUsedAddress = balances.any((balance) => balance.balance > 0);

    return anyUsedAddress;
  }

  /// A few tries with a short wait between them; a node that stays silent
  /// ends in a clear [DiscoveryFailed] instead of an endless wait.
  Future<List<RpcBalancesByAddressesEntry>> _balancesWithRetry(
    List<String> addresses,
  ) async {
    const attempts = 3;
    Object? lastError;
    for (var attempt = 1; attempt <= attempts; attempt++) {
      try {
        onStage?.call('asking the node (try $attempt of $attempts)');
        final r = await client.getBalancesByAddresses(addresses);
        onStage?.call('node answered');
        return r;
      } catch (e) {
        lastError = e;
        onStage?.call('node try $attempt failed: ${e.runtimeType}');
        if (attempt < attempts) {
          await Future<void>.delayed(retryBaseDelay * attempt);
        }
      }
    }
    throw DiscoveryFailed(
      lastError is TimeoutException
          ? 'The node did not answer in time.'
          : 'Could not reach the node.',
    );
  }

  Future<DiscoveryResult> balanceDiscoveryFor({
    required AddressType type,
    required int startIndex,
    int maxIndex = 1000,
    int batchSize = 100,
    int? gapLimit,
    bool Function(AddressType type, int index)? onProgress,
  }) async {
    final addresses = <int, WalletAddress>{};
    final txIds = <String, ApiTxId>{};
    int? lastUsedIndex;
    var historyUnavailable = false;

    int currentIndex = startIndex;
    // Everything found so far, for the normal end of the scan and for a
    // cancelled or failed one (funds already found must never be dropped).
    DiscoveryResult buildResult() => DiscoveryResult(
          addresses: Map.of(addresses),
          txIds: txIds.values.toSet(),
          scanIndexes: ScanIndexes(
            start: startIndex,
            scanned: currentIndex - 1,
            last: lastUsedIndex,
          ),
        );

    while (currentIndex <= maxIndex) {
      if (onProgress != null && !onProgress(type, currentIndex)) {
        throw DiscoveryCancelled(partial: buildResult());
      }

      final count = min(batchSize, maxIndex - currentIndex + 1);
      final batch = (await getAddresses(
        startIndex: currentIndex,
        type: type,
        count: count,
      ))
          .toList();

      final byEncodedAddress = {
        for (final walletAddress in batch) walletAddress.encoded: walletAddress,
      };

      final balances = await _balancesWithRetry(
        batch.map((walletAddress) => walletAddress.encoded).toList(),
      ).onError<DiscoveryFailed>(
        (e, _) => throw DiscoveryFailed(e.message, partial: buildResult()),
      );

      for (final balance in balances.where((balance) => balance.balance > 0)) {
        final walletAddress = byEncodedAddress[balance.address];
        if (walletAddress == null) continue;

        addresses[walletAddress.index] = walletAddress.copyWith(used: true);
        lastUsedIndex = lastUsedIndex == null
            ? walletAddress.index
            : max(lastUsedIndex, walletAddress.index);

        if (!historyUnavailable) {
          try {
            onStage
                ?.call('fetching history for address ${walletAddress.index}');
            final txIdsForAddress = await api
                .getTxIdsForAddress(walletAddress.encoded)
                .timeout(historyTimeout);
            txIds.addEntries(
              txIdsForAddress.map((txId) => MapEntry(txId.transactionId, txId)),
            );
          } catch (_) {
            // Balance discovery must not fail restore just because the history
            // fetch is unavailable. Stop asking for the rest of this scan; the
            // normal transaction sync fetches history later.
            historyUnavailable = true;
            onStage?.call('history unavailable, continuing without it');
          }
        }
      }

      currentIndex += count;

      // Stop once [gapLimit] addresses in a row had no funds, the usual wallet
      // rule: later addresses are only used after the earlier ones.
      if (gapLimit != null &&
          currentIndex - 1 - (lastUsedIndex ?? startIndex - 1) >= gapLimit) {
        break;
      }
    }

    return buildResult();
  }

  Future<DiscoveryResult> addressDiscoveryFor({
    required AddressType type,
    required int startIndex,
    int maxGap = 5,
    int maxRetries = 3,
    int lookAhead = 100,
    bool Function(AddressType type, int index)? onProgress,
  }) async {
    int retryCount = 0;
    int currentIndex = startIndex;
    int? lastUsedIndex;

    final addresses = <int, WalletAddress>{};
    final txIds = <String, ApiTxId>{};

    int step = 0;
    final maxSteps = 1000;
    while (step++ < maxSteps) {
      try {
        onProgress?.call(type, currentIndex);

        final walletAddress = await getAddress(index: currentIndex, type: type);
        final address = walletAddress.encoded;
        final txIdsForAddress = await api.getTxIdsForAddress(address);

        txIds.addEntries(
          txIdsForAddress.map((txId) => MapEntry(txId.transactionId, txId)),
        );

        if (txIdsForAddress.isNotEmpty) {
          addresses[currentIndex] = walletAddress.copyWith(used: true);
          lastUsedIndex = currentIndex;
        } else {
          addresses[currentIndex] = walletAddress;
        }
        retryCount = 0;
      } catch (e) {
        retryCount += 1;
        await Future.delayed(const Duration(seconds: 1));
      }

      if (retryCount > maxRetries) {
        break;
      }

      if (currentIndex - (lastUsedIndex ?? startIndex) >= maxGap) {
        try {
          // Look ahead for possible used addresses over maxGap by checking balances
          final addresses = await getAddresses(
            startIndex: currentIndex + 1,
            type: type,
            count: lookAhead,
          );
          final hasUsedAddresses =
              await _checkForUsedAddresses(addresses.map((e) => e.encoded));

          if (hasUsedAddresses) {
            lastUsedIndex = currentIndex;
          } else {
            break;
          }
        } catch (e) {
          break;
        }
      }

      currentIndex++;
    }

    final scanIndexes = ScanIndexes(
      start: startIndex,
      scanned: currentIndex,
      last: lastUsedIndex,
    );

    return DiscoveryResult(
      addresses: addresses,
      txIds: txIds.values.toSet(),
      scanIndexes: scanIndexes,
    );
  }

  Future<WalletDiscoveryResult> addressDiscovery({
    required int startReceiveIndex,
    required int startChangeIndex,
    int maxGap = 5,
    int maxRetries = 3,
    bool Function(AddressType type, int index)? onProgress,
  }) async {
    final receiveResult = await addressDiscoveryFor(
      type: AddressType.receive,
      startIndex: startReceiveIndex,
      maxGap: maxGap,
      maxRetries: maxRetries,
      onProgress: onProgress,
    );

    final changeResult = await addressDiscoveryFor(
      type: AddressType.change,
      startIndex: startChangeIndex,
      maxGap: maxGap,
      maxRetries: maxRetries,
      onProgress: onProgress,
    );

    return (receive: receiveResult, change: changeResult);
  }

  Future<WalletDiscoveryResult> balanceDiscovery({
    required int startReceiveIndex,
    required int startChangeIndex,
    int maxIndex = 1000,
    int batchSize = 100,
    int? gapLimit,
    bool Function(AddressType type, int index)? onProgress,
  }) async {
    DiscoveryResult empty(int start) => DiscoveryResult(
          addresses: {},
          txIds: {},
          scanIndexes: ScanIndexes.empty,
        );

    DiscoveryResult receiveResult;
    try {
      receiveResult = await balanceDiscoveryFor(
        type: AddressType.receive,
        startIndex: startReceiveIndex,
        maxIndex: maxIndex,
        batchSize: batchSize,
        gapLimit: gapLimit,
        onProgress: onProgress,
      );
    } on DiscoveryCancelled catch (e) {
      throw DiscoveryCancelled(
        partial: e.partial,
        walletPartial: (
          receive: e.partial ?? empty(startReceiveIndex),
          change: empty(startChangeIndex),
        ),
      );
    } on DiscoveryFailed catch (e) {
      throw DiscoveryFailed(
        e.message,
        partial: e.partial,
        walletPartial: (
          receive: e.partial ?? empty(startReceiveIndex),
          change: empty(startChangeIndex),
        ),
      );
    }

    try {
      final changeResult = await balanceDiscoveryFor(
        type: AddressType.change,
        startIndex: startChangeIndex,
        maxIndex: maxIndex,
        batchSize: batchSize,
        gapLimit: gapLimit,
        onProgress: onProgress,
      );
      return (receive: receiveResult, change: changeResult);
    } on DiscoveryCancelled catch (e) {
      throw DiscoveryCancelled(
        partial: e.partial,
        walletPartial: (
          receive: receiveResult,
          change: e.partial ?? empty(startChangeIndex),
        ),
      );
    } on DiscoveryFailed catch (e) {
      throw DiscoveryFailed(
        e.message,
        partial: e.partial,
        walletPartial: (
          receive: receiveResult,
          change: e.partial ?? empty(startChangeIndex),
        ),
      );
    }
  }
}
