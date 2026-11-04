import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../settings/address_settings.dart';
import '../util/ui_util.dart';
import '../widgets/app_simpledialog.dart';
import '../transactions/recent_outpoints_provider.dart';

class CompoundUtxosDialog extends ConsumerStatefulWidget {
  final bool lightMode;
  final bool rbf;

  const CompoundUtxosDialog({
    super.key,
    this.lightMode = false,
    required this.rbf,
  });

  @override
  ConsumerState<CompoundUtxosDialog> createState() =>
      _CompoundUtxosDialogState();
}

class _CompoundUtxosDialogState extends ConsumerState<CompoundUtxosDialog> {
  bool _isCompounding = false;
  int _totalChunks = 0;
  int _completedChunks = 0;

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final log = ref.read(loggerProvider);
    final utxos = ref.watch(utxoListProvider);
    final balance = ref.watch(formatedTotalBalanceProvider);
    final maxSend = NumberUtil.formatedAmount(ref.watch(maxSendProvider));
    final kasSymbol = ref.watch(kasSymbolProvider);

    Future<void> sendCompoundTx() async {
      try {
        if (mounted) {
          setState(() {
            _isCompounding = true;
            _completedChunks = 0;
            _totalChunks = 0;
          });
        }

        final walletService = ref.read(walletServiceProvider);
        final addressNotifier = ref.read(addressNotifierProvider);
        final changeAddressMode = ref.read(changeAddressModeProvider);
        final changeAddress = await addressNotifier.changeAddressFor(changeAddressMode);

        final List<Utxo> allSpendableUtxos = ref.read(spendableUtxosProvider);
        // Select the first chunk for the compound tx (or iterate spendableChunks if you want to process all)
        if (allSpendableUtxos.length <= 1) {
          UIUtil.showSnackbar(l10n.compoundTooFewUtxos, context);
          // Close dialog since there's nothing to do
          if (mounted) setState(() => _isCompounding = false);
          appRouter.pop(context);
          return;
        }
        const int chunkSize = 84;
        final List<List<Utxo>> spendableChunks = [];
        for (var i = 0; i < allSpendableUtxos.length; i += chunkSize) {
          final end = (i + chunkSize) > allSpendableUtxos.length
              ? allSpendableUtxos.length
              : i + chunkSize;
          spendableChunks.add(allSpendableUtxos.sublist(i, end));
        }

        // Pre-seed recent outpoints cache with the inputs we are about to spend
        final recent = ref.read(recentOutpointsProvider.notifier);
        for (final u in allSpendableUtxos) {
          recent.add(
            u.outpoint,
            u.address,
            u.utxoEntry.amount.toInt(),
          );
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

        log.d('Spendable Chunks: ${spendableChunks.length}');
        // Fire transactions at ~200ms intervals to speed up compounding while
        // avoiding a flood. Schedule all sends and wait for completion.
        for (var i = 0; i < spendableChunks.length; i++) {
          log.d('Compound Iteration $i, (chunk=${spendableChunks[i].length})');

          final compoundTx = walletService.createCompoundTx(
            compoundAddress: changeAddress.address,
            spendableUtxos: spendableChunks[i],
            feePerInput: kFeePerInput,
            priorityFee: priorityFee,
          );
          final txId = await walletService.sendTransaction(compoundTx.tx,
              rbf: widget.rbf);
          log.i('Compound Iteration $i done, txId=$txId');

          if (mounted) {
            setState(() {
              _completedChunks += 1;
            });
          }
        }
        ref.invalidate(pendingTxsProvider);

        if (widget.lightMode) {
          // give some time for compound tx to broadcast and get accepted
          await Future.delayed(const Duration(seconds: 5));
        }

        UIUtil.showSnackbar(l10n.compoundSuccess, context);
      } catch (e) {
        UIUtil.showSnackbar(l10n.compoundFailure, context);
      } finally {
        if (mounted) {
          setState(() {
            _isCompounding = false;
          });
        }
        // Do not auto-close if this is the on-open light-mode prompt; let user close it.
        appRouter.pop(context);
      }
    }

    Future<void> compound() async {
      final authUtil = ref.read(authUtilProvider);
      final message = l10n.compoundUtxosConfirmation;
      final auth = await authUtil.authenticate(context, message, message);
      if (auth) {
        await sendCompoundTx();
      }
    }

    return AppAlertDialog(
      title: Text(
        widget.lightMode
            ? l10n.compoundRequired
            : l10n.compoundUtxosConfirmation,
        style: styles.textStyleDialogHeader,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.lightMode)
            Text(
              l10n.compoundRequiredDescription,
              style: styles.textStyleSettingItemHeader,
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.utxosUppercase,
                        style: styles.textStyleSettingItemHeader,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          l10n.balance,
                          style: styles.textStyleSettingItemHeader,
                        ),
                      ),
                      Text(
                        l10n.maxSend,
                        style: styles.textStyleSettingItemHeader,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          '${utxos.length}',
                          style: styles.textStyleSettingItemHeader,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '$balance $kasSymbol',
                          style: styles.textStyleSettingItemHeader,
                        ),
                      ),
                      Container(
                        child: Text(
                          '$maxSend $kasSymbol',
                          style: styles.textStyleSettingItemHeader,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (_isCompounding) ...[
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
          onPressed: _isCompounding ? null : compound,
          child: _isCompounding
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _totalChunks > 0
                          ? '${l10n.compoundUppercased} ${_completedChunks}/${_totalChunks}'
                          : l10n.compoundUppercased,
                      style: styles.textStyleDialogOptions,
                    ),
                  ],
                )
              : Text(
                  l10n.compoundUppercased,
                  style: styles.textStyleDialogOptions,
                ),
        ),
      ],
      // Show a linear progress indicator under content when compounding
      contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    );
  }
}
