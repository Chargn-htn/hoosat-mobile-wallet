import 'dart:async';
import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:hoosat_mobile/hoosat/grpc/rpc.pb.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/wallet_address/address_discovery/address_discovery.dart';
import 'package:hoosat_mobile/wallet_address/wallet_address.dart';

late String funded2;

const _kpub =
    'kpub2JXpdok4yzBUdLiywgMbE36ixpEnffDhG31kJpRextvhpBQgBJVPcQJ7A99JryUvi8JNBcnzGoiu4qbGcvCfpY1T2RWndCaUjJqhwDSUNw8';

class _FakeClient extends VoidHoosatClient {
  _FakeClient(this.handler);
  final Future<List<RpcBalancesByAddressesEntry>> Function(List<String>)
      handler;
  int calls = 0;

  @override
  Future<List<RpcBalancesByAddressesEntry>> getBalancesByAddresses(
    Iterable<String> addresses,
  ) {
    calls++;
    return handler(addresses.toList());
  }
}

/// An explorer whose history lookups never finish (e.g. unreachable).
class HungHistoryApi extends HoosatApiEmpty {
  @override
  Future<List<ApiTxId>> getTxIdsForAddress(
    String address, {
    int limit = 500,
    int offset = 0,
    int retryCount = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) =>
      Completer<List<ApiTxId>>().future;
}

AddressDiscovery _discovery(
  HoosatClient client, {
  HoosatApi? api,
  void Function(String)? onStage,
}) =>
    AddressDiscovery(
      onStage: onStage,
      historyTimeout: const Duration(milliseconds: 100),
      api: HoosatApiService(api ?? HoosatApiEmpty()),
      client: client,
      addressGenerator: SchnorrAddressGenerator(
        hdPublicKey: _kpub,
        addressPrefix: AddressPrefix.hoosat,
      ),
      addressNameCallback: (t, i) => '$t $i',
      retryBaseDelay: const Duration(milliseconds: 5),
    );

void main() {
  test('finds the funded addresses across batches', () async {
    late AddressDiscovery d;
    late String funded;
    final client = _FakeClient((addrs) async => [
          for (final a in addrs)
            RpcBalancesByAddressesEntry(
              address: a,
              balance: Int64(a == funded ? 500 : 0),
            ),
        ]);
    d = _discovery(client);
    funded = (await d.getAddress(index: 7, type: AddressType.receive)).encoded;

    final r = await d.balanceDiscoveryFor(
      type: AddressType.receive,
      startIndex: 0,
      maxIndex: 120,
      batchSize: 50,
    );
    expect(r.addresses.keys, [7]);
    expect(r.addresses[7]!.used, isTrue);
    expect(r.scanIndexes.last, 7);
    expect(client.calls, 3); // 121 addresses -> 50 + 50 + 21
  });

  test('a node that never answers ends in DiscoveryFailed, not a hang',
      () async {
    final client = _FakeClient((_) => Future.error(TimeoutException('x')));
    await expectLater(
      _discovery(client).balanceDiscoveryFor(
        type: AddressType.receive,
        startIndex: 0,
        maxIndex: 10,
      ),
      throwsA(isA<DiscoveryFailed>()),
    );
    expect(client.calls, 3); // three tries, then a clear failure
  });

  test('recovers when the node fails once and then answers', () async {
    var n = 0;
    final client = _FakeClient((addrs) async {
      if (n++ == 0) throw Exception('blip');
      return [
        for (final a in addrs)
          RpcBalancesByAddressesEntry(address: a, balance: Int64(0)),
      ];
    });
    final r = await _discovery(client).balanceDiscoveryFor(
      type: AddressType.receive,
      startIndex: 0,
      maxIndex: 10,
    );
    expect(r.addresses, isEmpty);
    expect(client.calls, 2);
  });

  test('cancel stops the search before asking the node again', () async {
    final client = _FakeClient((addrs) async => [
          for (final a in addrs)
            RpcBalancesByAddressesEntry(address: a, balance: Int64(0)),
        ]);
    var progressCalls = 0;
    await expectLater(
      _discovery(client).balanceDiscoveryFor(
        type: AddressType.receive,
        startIndex: 0,
        maxIndex: 200,
        batchSize: 50,
        onProgress: (_, __) => ++progressCalls < 2, // stop at the 2nd batch
      ),
      throwsA(isA<DiscoveryCancelled>()),
    );
    expect(client.calls, 1);
  });

  test('stops after the gap limit of empty addresses in a row', () async {
    late AddressDiscovery d;
    late String funded;
    final client = _FakeClient((addrs) async => [
          for (final a in addrs)
            RpcBalancesByAddressesEntry(
              address: a,
              balance: Int64(a == funded ? 500 : 0),
            ),
        ]);
    d = _discovery(client);
    funded = (await d.getAddress(index: 3, type: AddressType.receive)).encoded;

    final r = await d.balanceDiscoveryFor(
      type: AddressType.receive,
      startIndex: 0,
      maxIndex: 1000,
      batchSize: 20,
      gapLimit: 40,
    );
    expect(r.addresses.keys, [3]);
    expect(r.scanIndexes.last, 3);
    // 0-19, 20-39, 40-59: 56 empty in a row after index 3 -> stop (not 51 calls)
    expect(client.calls, 3);
    expect(r.scanIndexes.scanned, 59);
  });

  test('background workers derive exactly the same addresses as one-by-one',
      () async {
    final g = SchnorrAddressGenerator(
      hdPublicKey: _kpub,
      addressPrefix: AddressPrefix.hoosat,
    );
    for (final typeIndex in [0, 1]) {
      final batch = await g.addressesAt(
        typeIndex: typeIndex,
        startIndex: 5,
        count: 43, // uneven split across workers
      );
      expect(batch.length, 43);
      for (var k = 0; k < 43; k++) {
        final single =
            await g.addressAtIndex(typeIndex: typeIndex, index: 5 + k);
        expect(batch[k], single, reason: 'type $typeIndex index ${5 + k}');
      }
    }
  });

  test('an explorer that never answers does not hold the scan up', () async {
    late AddressDiscovery d;
    late String funded;
    final stages = <String>[];
    final client = _FakeClient((addrs) async => [
          for (final a in addrs)
            RpcBalancesByAddressesEntry(
              address: a,
              balance: Int64(a == funded || a == funded2 ? 500 : 0),
            ),
        ]);
    d = _discovery(client, api: HungHistoryApi(), onStage: stages.add);
    funded = (await d.getAddress(index: 0, type: AddressType.receive)).encoded;
    funded2 = (await d.getAddress(index: 2, type: AddressType.receive)).encoded;

    final sw = Stopwatch()..start();
    final r = await d.balanceDiscoveryFor(
      type: AddressType.receive,
      startIndex: 0,
      maxIndex: 10,
    );
    expect(r.addresses.keys.toSet(), {0, 2}); // both funded addresses found
    expect(r.txIds, isEmpty); // history skipped, not fatal
    expect(sw.elapsed, lessThan(const Duration(seconds: 3)));
    expect(stages, contains('history unavailable, continuing without it'));
    // gave up after the first failure: asked for history once only
    expect(stages.where((s) => s.startsWith('fetching history')).length, 1);
  });

  test('a real silent server makes the client fail by timeout', () async {
    final server = await ServerSocket.bind(InternetAddress.loopbackIPv4, 0);
    final sockets = <Socket>[];
    server.listen(sockets.add); // accepts, never answers
    final channel = ClientChannel(
      '127.0.0.1',
      port: server.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = HoosatClient(
      channel: channel,
      balancesTimeout: const Duration(milliseconds: 800),
    );
    final sw = Stopwatch()..start();
    await expectLater(
      client.getBalancesByAddresses(['hoosat:anything']),
      throwsA(isA<TimeoutException>()),
    );
    expect(sw.elapsed, lessThan(const Duration(seconds: 5)));
    await channel.terminate();
    for (final s in sockets) {
      s.destroy();
    }
    await server.close();
  });

  group('funds that were found are never thrown away', () {
    Future<(AddressDiscovery, _FakeClient, String)> fundedAt(int index,
        {Future<List<RpcBalancesByAddressesEntry>> Function(List<String>)?
            overrideWhen}) async {
      late String funded;
      late AddressDiscovery d;
      final client = _FakeClient((addrs) async {
        if (overrideWhen != null) return overrideWhen(addrs);
        return [
          for (final a in addrs)
            RpcBalancesByAddressesEntry(
                address: a, balance: Int64(a == funded ? 500 : 0)),
        ];
      });
      d = _discovery(client);
      funded =
          (await d.getAddress(index: index, type: AddressType.receive)).encoded;
      return (d, client, funded);
    }

    test('cancelling after a funded address was found keeps it', () async {
      final (d, _, _) = await fundedAt(3);
      DiscoveryCancelled? caught;
      try {
        await d.balanceDiscoveryFor(
          type: AddressType.receive,
          startIndex: 0,
          maxIndex: 40,
          batchSize: 5,
          // allow the first batch (index 0), stop when the second starts
          onProgress: (type, index) => index < 5,
        );
      } on DiscoveryCancelled catch (e) {
        caught = e;
      }
      expect(caught, isNotNull);
      expect(caught!.partial!.addresses.keys, [3]);
      expect(caught.partial!.scanIndexes.last, 3);
    });

    test('a node failure after funds were found keeps them', () async {
      late String funded;
      late AddressDiscovery d;
      var batch = 0;
      final client = _FakeClient((addrs) async {
        if (batch++ >= 1) throw Exception('node gone');
        return [
          for (final a in addrs)
            RpcBalancesByAddressesEntry(
                address: a, balance: Int64(a == funded ? 500 : 0)),
        ];
      });
      d = _discovery(client);
      funded = (await d.getAddress(index: 2, type: AddressType.receive)).encoded;
      DiscoveryFailed? caught;
      try {
        await d.balanceDiscoveryFor(
          type: AddressType.receive,
          startIndex: 0,
          maxIndex: 40,
          batchSize: 5,
        );
      } on DiscoveryFailed catch (e) {
        caught = e;
      }
      expect(caught, isNotNull);
      expect(caught!.partial!.addresses.keys, [2]);
    });

    test('whole-wallet search: a cancelled change scan keeps the finished receive scan',
        () async {
      final (d, _, _) = await fundedAt(1);
      DiscoveryCancelled? caught;
      try {
        await d.balanceDiscovery(
          startReceiveIndex: 0,
          startChangeIndex: 0,
          maxIndex: 9,
          batchSize: 5,
          gapLimit: 300,
          // cancel as soon as the change scan starts
          onProgress: (type, index) => type == AddressType.receive,
        );
      } on DiscoveryCancelled catch (e) {
        caught = e;
      }
      expect(caught!.walletPartial!.receive.addresses.keys, [1]);
      expect(caught.walletPartial!.change.addresses, isEmpty);
    });

    test('a gap limit of 300 still finds funds after 250 empty addresses',
        () async {
      final (d, _, _) = await fundedAt(250);
      final r = await d.balanceDiscoveryFor(
        type: AddressType.receive,
        startIndex: 0,
        maxIndex: 1000,
        batchSize: 100,
        gapLimit: 300,
      );
      expect(r.addresses.keys, [250]);
    });
  });
}
