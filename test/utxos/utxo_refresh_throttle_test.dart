import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hoosat_mobile/database/boxes.dart';
import 'package:hoosat_mobile/database/database.dart';
import 'package:hoosat_mobile/hoosat/grpc/rpc.pb.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/utxos/utxos_notifier.dart';
import 'package:logger/logger.dart';

/// A node that always answers with whatever coins we tell it it has.
class FakeNode extends VoidHoosatClient {
  final coins = <String, List<RpcUtxosByAddressesEntry>>{};
  int calls = 0;
  int failNext = 0;

  @override
  Future<List<RpcUtxosByAddressesEntry>> getUtxosByAddresses(
      Iterable<String> addresses) async {
    calls++;
    if (failNext > 0) {
      failNext--;
      throw Exception('node hiccup');
    }
    return [for (final a in addresses) ...?coins[a]];
  }
}

RpcUtxosByAddressesEntry coin(String address, String txId, int amount) =>
    RpcUtxosByAddressesEntry(
      address: address,
      outpoint: RpcOutpoint(transactionId: txId, index: 0),
      utxoEntry: RpcUtxoEntry(
        amount: Int64(amount),
        scriptPublicKey: RpcScriptPublicKey(
            scriptPublicKey: '20aa', version: 0),
        blockDaaScore: Int64(1000),
        isCoinbase: false,
      ),
    );

/// Waits until [condition] is true (up to [limit]) instead of guessing a fixed
/// delay, so the test does not depend on how busy the machine is.
Future<void> eventually(bool Function() condition,
    {Duration limit = const Duration(seconds: 8)}) async {
  final end = DateTime.now().add(limit);
  while (!condition() && DateTime.now().isBefore(end)) {
    await Future<void>.delayed(const Duration(milliseconds: 20));
  }
}

void main() {
  late Directory tempDir;
  late FakeNode node;
  late UtxosNotifier notifier;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('utxo_throttle_test');
    Hive.init(tempDir.path);
    if (!Hive.isAdapterRegistered(utxoAdapter.typeId)) {
      Hive.registerAdapter(utxoAdapter);
    }
    final box = await Hive.openBox<Utxo>('utxo_throttle_test');
    node = FakeNode();
    notifier = UtxosNotifier(
      utxoBox: TypedBox<Utxo>(box),
      client: node,
      log: Logger(level: Level.off),
    )
      ..refreshInterval = const Duration(milliseconds: 150)
      ..retryBase = const Duration(milliseconds: 40);
  });

  tearDown(() async {
    notifier.dispose();
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  test('a refresh asked for just after another is NOT lost', () async {
    node.coins['hoosat:A'] = [coin('hoosat:A', 'tx1', 100)];
    await notifier.refresh(addresses: ['hoosat:A']);
    expect(notifier.utxoList.length, 1);

    // Seconds later a send happens: A's coin is spent and the payment lands
    // on B. The wallet is told, and asks for a refresh of both.
    node.coins['hoosat:A'] = [];
    node.coins['hoosat:B'] = [coin('hoosat:B', 'tx2', 5)];
    await notifier.refresh(addresses: ['hoosat:A', 'hoosat:B']);
    // The lockout may postpone it, but it must still happen.
    await eventually(() =>
        notifier.utxoList.any((u) => u.outpoint.transactionId == 'tx2'));

    // The wallet's coin list must now match the node.
    expect(notifier.utxoList.map((u) => u.outpoint.transactionId).toSet(),
        {'tx2'});
  });

  test('a refresh that fails is retried by itself, not left stale', () async {
    node.coins['hoosat:A'] = [coin('hoosat:A', 'tx1', 100)];
    node.failNext = 2;
    await notifier.refresh(addresses: ['hoosat:A']); // fails, schedules retry
    expect(notifier.utxoList, isEmpty);

    await eventually(() => notifier.utxoList.isNotEmpty);
    expect(notifier.utxoList.map((u) => u.outpoint.transactionId), ['tx1']);
  });

  test('force skips the lockout (pull to refresh, opening Send)', () async {
    node.coins['hoosat:A'] = [coin('hoosat:A', 'tx1', 100)];
    await notifier.refresh(addresses: ['hoosat:A']);
    node.coins['hoosat:A'] = [coin('hoosat:A', 'tx2', 100)];

    await notifier.refresh(addresses: ['hoosat:A'], force: true);
    expect(notifier.utxoList.map((u) => u.outpoint.transactionId), ['tx2']);
  });

  test('coins and balances that disagree get repaired', () async {
    // The wallet believes address A holds 100, but its coin list is empty
    // (for example a refresh was lost).
    node.coins['hoosat:A'] = [coin('hoosat:A', 'tx1', 100)];
    expect(notifier.utxoList, isEmpty);

    await notifier.refreshWithBalances(
        balances: IMap({'hoosat:A': BigInt.from(100)}));
    expect(notifier.utxoList.map((u) => u.outpoint.transactionId), ['tx1']);
  });

  test('balances and coins that already agree cost the node nothing', () async {
    node.coins['hoosat:A'] = [coin('hoosat:A', 'tx1', 100)];
    await notifier.refresh(addresses: ['hoosat:A']);
    final before = node.calls;

    await notifier.refreshWithBalances(
        balances: IMap({'hoosat:A': BigInt.from(100)}));
    expect(node.calls, before);
  });
}
