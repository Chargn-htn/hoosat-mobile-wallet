import 'dart:async';
import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hoosat_mobile/database/boxes.dart';
import 'package:hoosat_mobile/database/database.dart';
import 'package:hoosat_mobile/hoosat/grpc/rpc.pb.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/utxos/utxos_notifier.dart';
import 'package:hoosat_mobile/utxos/utxos_providers.dart';
import 'package:logger/logger.dart';

const addrA =
    'hoosat:qp4ad2eh72xc8dtjjyz4llxzq9utn6k26uyl644xxw70wskdfl85zsqj9k4vz';
const addrB =
    'hoosat:qpzyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyguuhlqeac';

class SlowNode extends VoidHoosatClient {
  List<RpcUtxosByAddressesEntry> entries;
  Duration latency;
  int calls = 0;
  SlowNode(this.entries, {this.latency = Duration.zero});
  @override
  Future<List<RpcUtxosByAddressesEntry>> getUtxosByAddresses(
      Iterable<String> a) async {
    calls++;
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    return entries;
  }
}

List<RpcUtxosByAddressesEntry> rpcCoins(int n, {int from = 0}) => [
      for (var i = from; i < from + n; i++)
        RpcUtxosByAddressesEntry(
          address: i.isEven ? addrA : addrB,
          outpoint: RpcOutpoint(
              transactionId: i.toRadixString(16).padLeft(64, '0'), index: 0),
          utxoEntry: RpcUtxoEntry(
            amount: Int64(100000000 + i),
            scriptPublicKey:
                RpcScriptPublicKey(scriptPublicKey: '20aa', version: 0),
            blockDaaScore: Int64(1000 + i),
            isCoinbase: false,
          ),
        ),
    ];

void main() {
  late Directory dir;
  late TypedBox<Utxo> box;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('big_wallet');
    Hive.init(dir.path);
    if (!Hive.isAdapterRegistered(utxoAdapter.typeId)) {
      Hive.registerAdapter(utxoAdapter);
    }
    box = TypedBox<Utxo>(await Hive.openBox<Utxo>('big'));
  });
  tearDown(() async {
    await Hive.deleteFromDisk();
    await dir.delete(recursive: true);
  });

  test('a 61,000-coin wallet loads and the screen keeps getting turns',
      () async {
    final node = SlowNode(rpcCoins(61000));
    final n = UtxosNotifier(
        utxoBox: box, client: node, log: Logger(level: Level.off));

    var ticks = 0;
    final timer =
        Timer.periodic(const Duration(milliseconds: 5), (_) => ticks++);
    await n.refresh(addresses: [addrA, addrB], force: true);
    timer.cancel();

    expect(n.utxoList.length, 61000);
    // The screen's own timers fired during the load: it was not frozen for the
    // whole time (it is given a turn every 2,000 coins).
    expect(ticks, greaterThan(10));
    n.dispose();
  }, timeout: const Timeout(Duration(minutes: 3)));

  test('two refreshes at once do not corrupt the coin list', () async {
    final node = SlowNode(rpcCoins(5000), latency: const Duration(milliseconds: 50));
    final n = UtxosNotifier(
        utxoBox: box, client: node, log: Logger(level: Level.off));

    final first = n.refresh(addresses: [addrA, addrB], force: true);
    // while the first is still running, the node's answer changes and another
    // refresh is asked for
    await Future<void>.delayed(const Duration(milliseconds: 10));
    node.entries = rpcCoins(5000, from: 100); // 100 coins gone, 100 new
    final second = n.refresh(addresses: [addrA, addrB], force: true);
    await Future.wait([first, second]);
    // the queued refresh runs once the first has finished
    for (var i = 0; i < 100 && n.utxoList.first.outpoint.transactionId != (5099).toRadixString(16).padLeft(64, '0'); i++) {
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }

    // no duplicates, and it matches the node's LATEST answer exactly
    final ids = n.utxoList.map((u) => u.outpoint.transactionId).toList();
    expect(ids.toSet().length, ids.length);
    expect(ids.length, 5000);
    expect(ids.contains((0).toRadixString(16).padLeft(64, '0')), isFalse);
    expect(ids.contains((5099).toRadixString(16).padLeft(64, '0')), isTrue);
    n.dispose();
  }, timeout: const Timeout(Duration(minutes: 2)));

  test('the per-transaction coin index is one pass and picks the newest', () {
    final coins = rpcCoins(61000).map(Utxo.fromRpc).toList();
    final sw = Stopwatch()..start();
    final idx = newestBirthByTx(coins);
    sw.stop();
    expect(idx.length, 61000);
    expect(sw.elapsedMilliseconds, lessThan(2000));

    // two coins of one transaction: the newer one decides
    final a = Utxo.fromRpc(rpcCoins(1).first);
    final b = a.copyWith(
      outpoint: Outpoint(transactionId: a.outpoint.transactionId, index: 1),
      utxoEntry: a.utxoEntry.copyWith(blockDaaScore: BigInt.from(5000)),
    );
    expect(newestBirthByTx([a, b])[a.outpoint.transactionId], BigInt.from(5000));
  });
}
