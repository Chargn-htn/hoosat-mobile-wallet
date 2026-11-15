import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/client/hoosat_client.dart';
import 'package:hoosat_mobile/hoosat/grpc/rpc.pb.dart';
import 'package:hoosat_mobile/node_status/connection_status.dart';
import 'package:hoosat_mobile/node_status/node_test.dart';

class _GoodNode extends VoidHoosatClient {
  _GoodNode({this.synced = true, this.index = true, this.updates = true});
  final bool synced, index, updates;
  @override
  Future<GetInfoResponseMessage> getInfo() async => GetInfoResponseMessage(
      serverVersion: '2.19.0', isSynced: synced, isUtxoIndexed: index);
  @override
  Stream<Int64> notifyVirtualDaaScoreChanged() => updates
      ? Stream<Int64>.periodic(
          const Duration(milliseconds: 20), (i) => Int64(i))
      : const Stream<Int64>.empty();
}

class _DeadNode extends VoidHoosatClient {
  @override
  Future<GetInfoResponseMessage> getInfo() =>
      Completer<GetInfoResponseMessage>().future;
}

Future<NodeTestResult> _run(HoosatClient c, {int infoMs = 200}) => runNodeTest(
      url: 'node:42420',
      secure: false,
      infoTimeout: Duration(milliseconds: infoMs),
      listenFor: const Duration(milliseconds: 300),
      clientFactory: (_, __) => c,
    );

void main() {
  test('a healthy node is reported as good', () async {
    final r = await _run(_GoodNode());
    expect(r.answered, isTrue);
    expect(r.version, '2.19.0');
    expect(r.updatesIn5s, greaterThan(3));
    final lines = describeNodeTest(r, ConnectionStatus.live);
    expect(lines.every((l) => l.severity == NodeTestSeverity.good), isTrue);
  });

  test('a node that never answers is reported as a clear failure', () async {
    final sw = Stopwatch()..start();
    final r = await _run(_DeadNode());
    expect(sw.elapsed, lessThan(const Duration(seconds: 3)));
    expect(r.answered, isFalse);
    final lines = describeNodeTest(r, ConnectionStatus.unreachable);
    expect(lines.first.severity, NodeTestSeverity.bad);
    expect(lines.first.text, contains('did not answer'));
  });

  test('not synced, no address index and no updates are each called out',
      () async {
    final r =
        await _run(_GoodNode(synced: false, index: false, updates: false));
    final text = describeNodeTest(r, ConnectionStatus.live)
        .where((l) => l.severity == NodeTestSeverity.bad)
        .map((l) => l.text)
        .join(' | ');
    expect(text, contains('catching up'));
    expect(text, contains('address index is off'));
    expect(text, contains('no live updates'));
  });

  test("the wallet's own feed state is shown separately from the node test",
      () async {
    final r = await _run(_GoodNode());
    final stalled = describeNodeTest(r, ConnectionStatus.reconnecting).last;
    expect(stalled.severity, NodeTestSeverity.warning);
    expect(stalled.text, contains('stopped'));
  });
}
