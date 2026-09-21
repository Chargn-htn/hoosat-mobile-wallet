import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core_providers.dart';
import '../database/boxes.dart';
import '../hoosat/grpc/rpc.pb.dart';
import '../hoosat/transaction/types.dart';
import '../wallet_address/wallet_address_providers.dart';
import '../wallet_auth/wallet_auth_providers.dart';
import '../wallet_balance/wallet_balance_providers.dart';
import 'utxos_notifier.dart';

final _utxoBoxProvider = Provider.autoDispose<TypedBox<Utxo>>((ref) {
  final boxInfo = ref.watch(walletBoxInfoProvider);
  final db = ref.watch(dbProvider);

  final boxKey = boxInfo.utxo.boxKey;
  final box = db.getTypedBox<Utxo>(boxKey);

  return box;
});

final utxosChangedProvider = StreamProvider.autoDispose((ref) {
  final client = ref.watch(hoosatClientProvider);
  final addresses = ref.watch(allAddressesProvider);

  return _debounceUtxoChanges(client.notifyUtxosChanged(addresses));
});

Stream<UtxosChangedNotificationMessage> _debounceUtxoChanges(
  Stream<UtxosChangedNotificationMessage> source,
) {
  late StreamController<UtxosChangedNotificationMessage> controller;
  StreamSubscription<UtxosChangedNotificationMessage>? subscription;
  Timer? timer;
  final pending = <UtxosChangedNotificationMessage>[];

  controller = StreamController<UtxosChangedNotificationMessage>(
    onListen: () {
      subscription = source.listen(
        (event) {
          pending.add(event);
          timer?.cancel();
          timer = Timer(const Duration(milliseconds: 500), () {
            if (pending.isEmpty) {
              return;
            }
            controller.add(_mergeUtxoChanges(pending));
            pending.clear();
          });
        },
        onError: controller.addError,
        onDone: () {
          timer?.cancel();
          if (pending.isNotEmpty) {
            controller.add(_mergeUtxoChanges(pending));
            pending.clear();
          }
          controller.close();
        },
      );
    },
    onCancel: () async {
      timer?.cancel();
      await subscription?.cancel();
    },
  );

  return controller.stream;
}

UtxosChangedNotificationMessage _mergeUtxoChanges(
  List<UtxosChangedNotificationMessage> changes,
) {
  String keyFor(RpcUtxosByAddressesEntry entry) {
    final outpoint = entry.outpoint;
    return '${entry.address}:${outpoint.transactionId}:${outpoint.index}';
  }

  final added = <String, RpcUtxosByAddressesEntry>{};
  final removed = <String, RpcUtxosByAddressesEntry>{};
  for (final change in changes) {
    for (final entry in change.removed) {
      final key = keyFor(entry);
      added.remove(key);
      removed[key] = entry;
    }
    for (final entry in change.added) {
      final key = keyFor(entry);
      removed.remove(key);
      added[key] = entry;
    }
  }

  return UtxosChangedNotificationMessage(
    added: added.values,
    removed: removed.values,
  );
}

final utxoNotifierProvider =
    ChangeNotifierProvider.autoDispose<UtxosNotifier>((ref) {
  final client = ref.watch(hoosatClientProvider);
  final utxoBox = ref.watch(_utxoBoxProvider);
  final log = ref.watch(loggerProvider);

  final notifier = UtxosNotifier(
    client: client,
    utxoBox: utxoBox,
    log: log,
  );

  ref.listen(
    balanceNotifierProvider.select((notifier) => notifier.balances),
    (_, balances) {
      log.d('UTXOs - Refresh with balances for ${balances.keys}');
      notifier.refreshWithBalances(balances: balances);
    },
    fireImmediately: true,
  );

  ref.listen(utxosChangedProvider, (_, next) {
    if (next.asData?.value case final message?) {
      final addresses = Set.of(
        message.removed.followedBy(message.added).map((utxo) => utxo.address),
      );
      log.d('UTXOs - Refresh with utxos changed for $addresses');
      notifier.refresh(addresses: addresses);
    }
  });

  ref.onDispose(() {
    notifier.disposed = true;
  });

  return notifier;
});

final utxoListProvider = Provider.autoDispose((ref) {
  return ref.watch(
    utxoNotifierProvider.select((notifier) => notifier.utxoList),
  );
});

final spendableUtxosProvider = Provider.autoDispose((ref) {
  final utxos = ref.watch(utxoListProvider);
  final virtualDaaScore = ref.read(lastKnownVirtualDaaScoreProvider);

  final spendableUtxos = utxos.where((utxo) {
    if (!utxo.utxoEntry.isCoinbase) {
      return true;
    }
    return utxo.utxoEntry.blockDaaScore + BigInt.from(100) < virtualDaaScore;
  }).toList();

  spendableUtxos.sort(
    (a, b) => b.utxoEntry.amount.compareTo(a.utxoEntry.amount),
  );

  return spendableUtxos;
});

final selectedUtxosProvider = StateProvider<ISet<Utxo>>((ref) => ISet());
