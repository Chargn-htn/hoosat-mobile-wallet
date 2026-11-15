import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../database/boxes.dart';
import '../hoosat/grpc/rpc.pb.dart' show RpcAcceptedTransactionIds;
import '../hoosat/hoosat.dart';
import '../wallet/wallet_types.dart';
import 'transaction_notifier.dart';
import 'transaction_types.dart';
import 'tx_status.dart';
import 'tx_cache_service.dart';
import 'live_feeds.dart';
import 'recent_outpoints_provider.dart';

// All new transactions from hoosat node
final _newTransactionProvider = StreamProvider.autoDispose<ApiTransaction>(
    (ref) => feedUnlessPaused(ref, () {
          final client = ref.watch(hoosatClientProvider);

          final newBlock = client.notifyBlockAdded();

          return newBlock.asyncExpand((message) async* {
            final isChainBlock = message.block.verboseData.isChainBlock;
            var block = message.block;

            // Some nodes send header-only blocks (no transactions) over
            // notifyBlockAdded. Fetch the full block before emitting txs.
            final headerOnly = block.verboseData.isHeaderOnly;
            if ((headerOnly || block.transactions.isEmpty) &&
                block.verboseData.hash.isNotEmpty) {
              try {
                block = await client.getBlockByHash(
                  block.verboseData.hash,
                  includeTransactions: true,
                );
              } catch (_) {
                // Fall back to whatever we got in the notification.
              }
            }

            for (final rpcTx in block.transactions) {
              var apiTx = ApiTransaction.fromRpc(rpcTx);
              if (isChainBlock) {
                apiTx = apiTx.copyWith(isAccepted: true);
              }
              yield apiTx;
            }
          });
        }));

// New transactions associated with this wallet
final _newWalletTransactionProvider = StreamProvider.autoDispose((ref) {
  final controller = StreamController<ApiTransaction>();
  ref.listen(_newTransactionProvider, (_, next) {
    final result = next.whenOrNull(data: (tx) {
      final addressNotifier = ref.read(addressNotifierProvider);
      final utxosNotifier = ref.read(utxoNotifierProvider);

      final isWalletTx = tx.outputs.any((output) {
            final address = output.scriptPublicKeyAddress;
            return addressNotifier.containsAddress(address);
          }) ||
          tx.inputs.any((input) {
            final outpoint = Outpoint(
              transactionId: input.previousOutpointHash,
              index: input.previousOutpointIndex.toInt(),
            );
            return utxosNotifier.isWalletOutpoint(outpoint);
          });
      return isWalletTx ? tx : null;
    });

    if (result != null) {
      controller.add(result);
    }
  });

  ref.onDispose(controller.close);

  return controller.stream;
});

final _acceptedTransactionIdsProvider =
    StreamProvider.autoDispose<RpcAcceptedTransactionIds>((ref) => feedUnlessPaused(ref, () {
          final client = ref.watch(hoosatClientProvider);
          return client
              .notifyVirtualSelectedParentChainChanged(
            includeAcceptedTransactionIds: true,
          )
              .expand((message) {
            return message.acceptedTransactionIds;
          });
        }));

final _txBoxProvider =
    Provider.autoDispose.family<LazyTypedBox<Tx>, WalletInfo>((ref, wallet) {
  final db = ref.watch(dbProvider);
  final networkId = ref.watch(networkIdProvider);
  final repository = ref.watch(boxInfoRepositoryProvider);
  final boxInfo = repository.getBoxInfo(wallet.wid, networkId);
  final txBoxKey = boxInfo.tx.boxKey;
  return db.getLazyTypedBox<Tx>(txBoxKey);
});

final _txIndexBoxProvider = Provider.autoDispose
    .family<IndexedTypedBox<TxIndex>, WalletInfo>((ref, wallet) {
  final db = ref.watch(dbProvider);
  final networkId = ref.watch(networkIdProvider);
  final repository = ref.watch(boxInfoRepositoryProvider);
  final boxInfo = repository.getBoxInfo(wallet.wid, networkId);
  final txIndexBoxKey = boxInfo.txIndex.boxKey;
  return db.getIndexedTypedBox<TxIndex>(txIndexBoxKey);
});

final txCacheServiceProvider =
    Provider.autoDispose.family<TxCacheService, WalletInfo>((ref, wallet) {
  final txIndexBox = ref.watch(_txIndexBoxProvider(wallet));
  final txBox = ref.watch(_txBoxProvider(wallet));
  final log = ref.watch(loggerProvider);

  final txCache = TxCacheService(
    txIndexBox: txIndexBox,
    txBox: txBox,
    log: log,
  );

  // Provide a lightweight resolver for previous outpoint data using the current
  // wallet UTXO set to avoid transient "Missing input tx" logs when parents
  // aren't in cache yet.
  txCache.resolveOutpoint = (String txId, int index) {
    // 1) Check recently-spent outpoints cache first
    final recent = ref.read(recentOutpointsProvider);
    final recentHit = recent['$txId:$index'];
    if (recentHit != null) {
      return recentHit;
    }

    // 2) Fallback to current UTXO set
    final utxos = ref.read(utxoListProvider);
    for (final u in utxos) {
      if (u.outpoint.transactionId == txId && u.outpoint.index == index) {
        return (
          u.address,
          // Amount in sompi; TxInputData expects int
          u.utxoEntry.amount.toInt(),
        );
      }
    }
    return null;
  };

  ref.listen(
    HoosatApiServiceProvider,
    (_, api) => txCache.api = api,
    fireImmediately: true,
  );

  return txCache;
});

final txNotifierForWalletProvider = ChangeNotifierProvider.autoDispose
    .family<TransactionNotifier, WalletInfo>((ref, wallet) {
  final service = ref.watch(txCacheServiceProvider(wallet));
  final log = ref.watch(loggerProvider);

  final notifier = TransactionNotifier(cache: service);
  notifier.loadMore();

  // When opening a wallet, balances may not change (cached == remote), which
  // means `lastBalanceChangesProvider` can be empty and we never discover tx ids.
  // Seed tx ids from all wallet addresses so history can render immediately.
  var historySyncTriggered = false;
  ref.listen(allAddressesProvider, (_, next) {
    if (historySyncTriggered || next.isEmpty) {
      return;
    }
    historySyncTriggered = true;
    log.d('Initial tx history sync: ${next.length} addresses');
    unawaited(notifier.syncHistoryForAddresses(next));
  }, fireImmediately: true);

  // UTXOs can appear before their transactions are in the local cache.
  ref.listen(utxoListProvider, (_, utxos) {
    notifier.checkForMissingTxs(
      utxos.take(100).map((utxo) => utxo.outpoint.transactionId),
    );
  }, fireImmediately: true);

  // Refresh transactions when balance changes
  ref.listen(lastBalanceChangesProvider, (_, next) {
    if (next.isEmpty) {
      return;
    }
    notifier.fetchNewTxsForAddresses(next.keys);
  }, fireImmediately: true);

  // Cache new transactions
  ref.listen(_newTransactionProvider, (_, next) {
    if (next.asData?.value case final tx?) {
      notifier.addToMemcache(tx);
    }
  });

  // Add new wallet transactions
  ref.listen(_newWalletTransactionProvider, (_, next) {
    if (next.asData?.value case final tx?) {
      log.d('New wallet tx: $tx');
      notifier.addWalletTx(tx);

      // Some nodes don't reliably emit `notifyUtxosChanged` for mempool/chain
      // events, so also trigger an explicit balance refresh when we know a
      // wallet-related tx exists.
      final balanceNotifier = ref.read(balanceNotifierProvider);
      final addresses = ref.read(allAddressesProvider);
      unawaited(balanceNotifier.refresh(addresses));
    }
  });

  // Update transaction status
  ref.listen(_acceptedTransactionIdsProvider, (_, next) {
    if (next.asData?.value case final ids?) {
      final client = ref.read(hoosatClientProvider);

      notifier.processAcceptedTxIds(
        ids.acceptedTransactionIds,
        acceptingBlockHash: ids.acceptingBlockHash,
        client: client,
      );

      // Accepted tx ids imply the UTXO set has changed; refresh balances even
      // if the utxos-changed stream didn't fire.
      final balanceNotifier = ref.read(balanceNotifierProvider);
      final addresses = ref.read(allAddressesProvider);
      unawaited(balanceNotifier.refresh(addresses));
    }
  });

  // Update pending transactions
  ref.listen(pendingTxsProvider, (_, next) {
    if (next.asData?.value case final pendingTxs?) {
      notifier.updatePendingTxs(pendingTxs);
    }
  });

  ref.onDispose(() {
    notifier.disposed = true;
  });

  return notifier;
});

final txNotifierProvider = Provider.autoDispose((ref) {
  final wallet = ref.watch(walletProvider);
  final txNotifier = ref.watch(txNotifierForWalletProvider(wallet));
  return txNotifier;
});

/// How many confirmations count as "done" for this transaction: 1000 when it
/// pays this wallet (those coins cannot be spent earlier), else 100.
final txConfirmTargetProvider =
    Provider.autoDispose.family<BigInt, TxItem>((ref, txItem) {
  final addresses = ref.watch(addressNotifierProvider);
  final paysUs = txItem.tx.apiTx.outputs
      .any((o) => addresses.containsAddress(o.scriptPublicKeyAddress));
  return BigInt.from(paysUs ? kMinUtxoMaturityDaaScore : 100);
});

/// Age (in DAA score units) of the newest coin this transaction left in the
/// wallet's coin list, or null if it left none. The node only lists coins of
/// accepted transactions, so this is proof of acceptance that does not depend
/// on us having caught the node's "accepted" message.
final txCoinAgeProvider =
    Provider.autoDispose.family<BigInt?, TxItem>((ref, txItem) {
  final born = ref.watch(coinBirthByTxProvider)[txItem.tx.id];
  if (born == null) return null;
  return ref.watch(lastKnownVirtualDaaScoreProvider) - born;
});

final txConfirmationStatusProvider =
    Provider.autoDispose.family<TxState, TxItem>((ref, txItem) {
  if (txItem.pending) {
    return TxState.pending();
  }
  final apiTx = txItem.tx.apiTx;
  return decideTxState(
    accepted: apiTx.isAccepted,
    acceptingBlockBlueScore: apiTx.acceptingBlockBlueScore,
    blueScore: ref.watch(virtualSelectedParentBlueScoreProvider),
    coinAge: ref.watch(txCoinAgeProvider(txItem)),
    target: ref.watch(txConfirmTargetProvider(txItem)),
    coinStillMaturing: ref.watch(txMaturityProgressProvider(txItem)) != null,
  );
});

/// "Confirmed" (100+ confirmations) and "mature enough to spend" (1000 DAA
/// score units old) are two different thresholds -- this checks whether
/// any of [txItem]'s outputs are still sitting in the wallet as an
/// immature utxo, so the UI can show that a "Confirmed" transaction's
/// funds aren't actually spendable yet, without needing a new TxState
/// variant (freezed codegen is currently broken in this environment due
/// to an analyzer/SDK version mismatch unrelated to this feature).
final txIsMaturingProvider = Provider.autoDispose.family<bool, TxItem>(
  (ref, txItem) => ref.watch(txMaturityProgressProvider(txItem)) != null,
);

/// How far (0 to 999) this transaction's received funds are towards the 1000
/// DAA-score age the network needs before they can be spent, or null when
/// nothing from it is still maturing. This is the ONE number the tag shows
/// while funds mature, instead of a confirmation count that runs out at 100
/// followed by a "confirmed" label while the coins still cannot be spent.
final txMaturityProgressProvider = Provider.autoDispose.family<int?, TxItem>(
  (ref, txItem) {
    final born = ref.watch(coinBirthByTxProvider)[txItem.tx.id];
    if (born == null) return null;
    final virtualDaaScore = ref.watch(lastKnownVirtualDaaScoreProvider);
    // the newest coin of the transaction decides: if it can be spent, all can
    if (born + BigInt.from(kMinUtxoMaturityDaaScore) < virtualDaaScore) {
      return null;
    }
    final progress = (virtualDaaScore - born).toInt();
    return progress.clamp(0, kMinUtxoMaturityDaaScore - 1);
  },
);

/// True when the explorer says this transaction was never accepted.
final txNotAcceptedProvider = Provider.autoDispose.family<bool, String>(
  (ref, id) => ref.watch(txNotifierProvider).notAcceptedIds.contains(id),
);
