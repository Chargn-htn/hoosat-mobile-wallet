import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../hoosat/hoosat.dart';
import '../hoosat/transaction/move_to_main_grouping.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../widgets/app_simpledialog.dart';
import '../transactions/recent_outpoints_provider.dart';

/// Sweeps every other address's balance into the wallet's main address --
/// a deliberate, separate action from Compound (which only ever merges an
/// address's own utxos back into itself and never moves balance between
/// addresses). See roadmap step 13b / the Node Manager "Move everything to
/// Main" feature this mirrors.
class MoveToMainDialog extends ConsumerStatefulWidget {
  final bool rbf;

  const MoveToMainDialog({super.key, this.rbf = false});

  @override
  ConsumerState<MoveToMainDialog> createState() => _MoveToMainDialogState();
}

class _MoveToMainDialogState extends ConsumerState<MoveToMainDialog> {
  bool _isMoving = false;
  int _totalChunks = 0;
  int _completedChunks = 0;

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final log = ref.read(loggerProvider);
    final addressNotifier = ref.read(addressNotifierProvider);
    final allSpendableUtxos = ref.watch(spendableUtxosProvider);
    final kasSymbol = ref.watch(kasSymbolProvider);

    final chunks = groupUtxosForMoveToMain(
      allSpendableUtxos,
      mainAddress: addressNotifier.defaultReceiveAddress.encoded,
    );
    final addressCount = chunks.map((c) => c.$1).toSet().length;
    final totalAmount = chunks
        .expand((c) => c.$2)
        .fold<BigInt>(BigInt.zero, (sum, u) => sum + u.utxoEntry.amount);
    final formattedAmount =
        NumberUtil.formatedAmount(Amount.raw(totalAmount));

    Future<void> sendMoveToMainTx() async {
      try {
        if (mounted) {
          setState(() {
            _isMoving = true;
            _completedChunks = 0;
            _totalChunks = 0;
          });
        }

        final walletService = ref.read(walletServiceProvider);
        final addressPrefix = ref.read(addressPrefixProvider);
        final mainAddress = addressNotifier.defaultReceiveAddress;

        final spendableUtxos = ref.read(spendableUtxosProvider);
        final spendableChunks = groupUtxosForMoveToMain(
          spendableUtxos,
          mainAddress: mainAddress.encoded,
        );

        if (spendableChunks.isEmpty) {
          UIUtil.showSnackbar(l10n.moveToMainNothingToMove, context);
          if (mounted) setState(() => _isMoving = false);
          appRouter.pop(context);
          return;
        }

        final mainCompoundAddress = Address.tryParse(
          mainAddress.encoded,
          expectedPrefix: addressPrefix,
        );
        if (mainCompoundAddress == null) {
          UIUtil.showSnackbar(l10n.moveToMainFailure, context);
          if (mounted) setState(() => _isMoving = false);
          appRouter.pop(context);
          return;
        }

        // Pre-seed recent outpoints cache with the inputs we are about to spend
        final recent = ref.read(recentOutpointsProvider.notifier);
        for (final (_, chunk) in spendableChunks) {
          for (final u in chunk) {
            recent.add(u.outpoint, u.address, u.utxoEntry.amount.toInt());
          }
        }
        if (mounted) {
          setState(() {
            _totalChunks = spendableChunks.length;
            _completedChunks = 0;
          });
        }

        Amount? priorityFee;
        if (widget.rbf) {
          try {
            final pending = ref.read(txNotifierProvider).pendingTxs;
            if (pending.isNotEmpty) {
              final p = pending.first;
              priorityFee = Amount.raw(p.fees.priorityFee.raw + BigInt.one);
            }
          } catch (_) {
            // ignore
          }
        }

        log.d('Move to Main Chunks: ${spendableChunks.length}');
        for (var i = 0; i < spendableChunks.length; i++) {
          final (address, chunk) = spendableChunks[i];
          log.d('Move to Main Iteration $i, address=$address (chunk=${chunk.length})');

          final moveTx = walletService.createCompoundTx(
            compoundAddress: mainCompoundAddress,
            spendableUtxos: chunk,
            feePerInput: kFeePerInput,
            priorityFee: priorityFee,
          );
          final txId =
              await walletService.sendTransaction(moveTx.tx, rbf: widget.rbf);
          log.i('Move to Main Iteration $i done, txId=$txId');

          if (mounted) {
            setState(() {
              _completedChunks += 1;
            });
          }
        }
        ref.invalidate(pendingTxsProvider);

        UIUtil.showSnackbar(l10n.moveToMainSuccess, context);
      } catch (e) {
        UIUtil.showSnackbar(l10n.moveToMainFailure, context);
      } finally {
        if (mounted) {
          setState(() {
            _isMoving = false;
          });
        }
        appRouter.pop(context);
      }
    }

    Future<void> moveToMain() async {
      final authUtil = ref.read(authUtilProvider);
      final message = l10n.moveToMainConfirmation;
      final auth = await authUtil.authenticate(context, message, message);
      if (auth) {
        await sendMoveToMainTx();
      }
    }

    return AppAlertDialog(
      title: Text(
        l10n.moveToMainConfirmation,
        style: styles.textStyleDialogHeader,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.moveToMainConfirmationDescription(
              formattedAmount,
              kasSymbol,
              addressCount,
            ),
            style: styles.textStyleSettingItemHeader,
          ),
          if (_isMoving) ...[
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: _totalChunks > 0 ? _completedChunks / _totalChunks : null,
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: () => appRouter.pop(context),
          child: Text(
            l10n.closeUppercased,
            style: styles.textStyleDialogOptions,
          ),
        ),
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: (_isMoving || addressCount == 0) ? null : moveToMain,
          child: _isMoving
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _totalChunks > 0
                          ? '${l10n.moveToMainUppercased} $_completedChunks/$_totalChunks'
                          : l10n.moveToMainUppercased,
                      style: styles.textStyleDialogOptions,
                    ),
                  ],
                )
              : Text(
                  l10n.moveToMainUppercased,
                  style: styles.textStyleDialogOptions,
                ),
        ),
      ],
      contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    );
  }
}
