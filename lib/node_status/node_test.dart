import 'dart:async';

import 'package:grpc/grpc.dart';

import '../hoosat/client/hoosat_client.dart';
import 'connection_status.dart';

/// What a connection test found out about a node.
class NodeTestResult {
  const NodeTestResult({
    required this.address,
    this.answerMs,
    this.version,
    this.synced,
    this.addressIndex,
    this.updatesIn5s,
    this.error,
  });

  final String address;
  final int? answerMs;
  final String? version;
  final bool? synced;
  final bool? addressIndex;
  final int? updatesIn5s;
  final String? error;

  bool get answered => error == null && answerMs != null;
}

enum NodeTestSeverity { good, warning, bad }

class NodeTestLine {
  const NodeTestLine(this.severity, this.text);
  final NodeTestSeverity severity;
  final String text;
}

typedef NodeClientFactory = HoosatClient Function(String url, bool secure);

HoosatClient _defaultFactory(String url, bool secure) =>
    HoosatClient.url(url, isSecure: secure);

String _plainError(Object e) {
  if (e is TimeoutException) return 'no answer in time';
  if (e is GrpcError) return 'could not connect (${e.codeName})';
  return 'could not connect';
}

/// Connects to [url] on a FRESH connection (so it shows whether the node
/// itself is healthy, separately from the wallet's own long-lived connection),
/// asks it for its details, then counts live updates for [listenFor].
Future<NodeTestResult> runNodeTest({
  required String url,
  required bool secure,
  Duration infoTimeout = const Duration(seconds: 8),
  Duration listenFor = const Duration(seconds: 5),
  NodeClientFactory clientFactory = _defaultFactory,
}) async {
  final client = clientFactory(url, secure);
  try {
    final sw = Stopwatch()..start();
    final info = await client.getInfo().timeout(infoTimeout);
    final ms = sw.elapsedMilliseconds;

    var updates = 0;
    final sub = client
        .notifyVirtualDaaScoreChanged()
        .listen((_) => updates++, onError: (_) {});
    await Future<void>.delayed(listenFor);
    await sub.cancel();

    return NodeTestResult(
      address: url,
      answerMs: ms,
      version: info.serverVersion,
      synced: info.isSynced,
      addressIndex: info.isUtxoIndexed,
      updatesIn5s: updates,
    );
  } catch (e) {
    return NodeTestResult(address: url, error: _plainError(e));
  } finally {
    try {
      await client.terminate();
    } catch (_) {}
  }
}

/// Plain-words findings for the dialog.
List<NodeTestLine> describeNodeTest(
  NodeTestResult r,
  ConnectionStatus walletFeed,
) {
  final lines = <NodeTestLine>[];

  if (!r.answered) {
    lines.add(NodeTestLine(
      NodeTestSeverity.bad,
      'The node did not answer: ${r.error ?? 'unknown problem'}.',
    ));
  } else {
    final ms = r.answerMs!;
    lines.add(NodeTestLine(
      ms > 1500 ? NodeTestSeverity.warning : NodeTestSeverity.good,
      ms > 1500 ? 'Slow: it answered in $ms ms.' : 'It answered in $ms ms.',
    ));
    if ((r.version ?? '').isNotEmpty) {
      lines.add(NodeTestLine(
        NodeTestSeverity.good,
        'Node software version ${r.version}.',
      ));
    }
    lines.add(r.synced == true
        ? const NodeTestLine(
            NodeTestSeverity.good, 'It is in sync with the network.')
        : const NodeTestLine(NodeTestSeverity.bad,
            'It is still catching up, so balances may be behind.'));
    lines.add(r.addressIndex == true
        ? const NodeTestLine(NodeTestSeverity.good,
            'Its address index is on, so it can report balances.')
        : const NodeTestLine(NodeTestSeverity.bad,
            'Its address index is off, so it cannot report balances.'));
    final n = r.updatesIn5s ?? 0;
    lines.add(n > 0
        ? NodeTestLine(NodeTestSeverity.good, 'Live updates: $n in 5 seconds.')
        : const NodeTestLine(
            NodeTestSeverity.bad, 'It answers, but sent no live updates.'));
  }

  switch (walletFeed) {
    case ConnectionStatus.live:
      lines.add(const NodeTestLine(
          NodeTestSeverity.good, "This wallet's live feed is working."));
    case ConnectionStatus.reconnecting:
      lines.add(const NodeTestLine(NodeTestSeverity.warning,
          "This wallet's live feed stopped and is reconnecting."));
    case ConnectionStatus.unreachable:
      lines.add(const NodeTestLine(NodeTestSeverity.bad,
          "This wallet's live feed is down: the node is not answering."));
  }
  return lines;
}
