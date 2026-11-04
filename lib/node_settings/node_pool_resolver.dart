import 'dart:async';
import 'dart:io';

import '../hoosat/client/hoosat_client.dart';

/// Result of successfully probing one candidate node.
class NodeProbeResult {
  final String host;
  final Duration latency;

  const NodeProbeResult({required this.host, required this.latency});
}

/// Resolves a DNS round-robin node pool (e.g. `rpc.hoosat.network`, which
/// has one A record per node) to the fastest healthy node behind it.
///
/// Client-side, no DNS/server smarts required: resolve all A records, ask
/// each one GetInfo in parallel with a short timeout, drop anything that
/// doesn't answer or isn't synced, and use the fastest responder.
class NodePoolResolver {
  const NodePoolResolver();

  /// Resolves [hostname] to every IPv4 address behind it. Falls back to
  /// the hostname itself (letting the system resolver try again later)
  /// if the lookup fails outright or returns nothing.
  Future<List<String>> resolveDnsPool(String hostname) async {
    try {
      final addresses = await InternetAddress.lookup(
        hostname,
        type: InternetAddressType.IPv4,
      );
      final ips = addresses.map((a) => a.address).toSet().toList();
      return ips.isEmpty ? [hostname] : ips;
    } catch (_) {
      return [hostname];
    }
  }

  /// Probes every candidate in parallel and returns the fastest one that
  /// answers GetInfo as synced and UTXO-indexed within [timeout]. Returns
  /// null if nothing in the pool answered in time.
  Future<String?> pickFastestNode(
    List<String> candidates, {
    required int port,
    bool isSecure = false,
    Duration timeout = const Duration(seconds: 4),
  }) async {
    final results = await Future.wait(
      candidates.map((host) => _probe(host, port, isSecure, timeout)),
    );

    final healthy = results.whereType<NodeProbeResult>().toList()
      ..sort((a, b) => a.latency.compareTo(b.latency));

    return healthy.isEmpty ? null : healthy.first.host;
  }

  Future<NodeProbeResult?> _probe(
    String host,
    int port,
    bool isSecure,
    Duration timeout,
  ) async {
    final client = HoosatClient.url('$host:$port', isSecure: isSecure);
    final stopwatch = Stopwatch()..start();
    try {
      final info = await client.getInfo().timeout(timeout);
      stopwatch.stop();
      if (!info.isSynced || !info.isUtxoIndexed) {
        return null;
      }
      return NodeProbeResult(host: host, latency: stopwatch.elapsed);
    } catch (_) {
      return null;
    } finally {
      unawaited(client.close());
    }
  }
}
