import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../hoosat/transaction/types.dart';
import '../util/friendly_error.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../transactions/live_feeds.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/hs_kit.dart';
import '../util/keep_awake.dart';
import 'compound_advice.dart';
import 'compound_advice_provider.dart';
import 'compound_runner.dart';
import 'wallet_compound_env.dart';

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

/// 1185 -> "1,185"
String _count(int n) => n.toString().replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]},');

class _CompoundUtxosDialogState extends ConsumerState<CompoundUtxosDialog> {
  bool _isCompounding = false;
  CompoundProgress? _progress;
  CompoundRunner? _runner;
  // One pacer for the life of the dialog: Stop then Continue must not forget
  // the sends of the last minute (the node counts them).
  final _pacer = CompoundPacer();

  @override
  void dispose() {
    // Closing the dialog stops the job; the screen stops being held awake.
    _runner?.stop();
    KeepAwake.off();
    super.dispose();
  }

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

    final advice = ref.watch(compoundAdviceProvider);

    Future<void> sendCompoundTx() async {
      final runner = CompoundRunner(
        WalletCompoundEnv(ref, alive: () => mounted),
        pacer: _pacer,
      );
      _runner = runner;
      // The merge does not need the network-wide block feeds, and a busy phone
      // cannot keep up with them (the node then cuts it off): pause them.
      final feeds = ref.read(liveFeedsHoldersProvider.notifier);
      final txNotifier = ref.read(txNotifierProvider);
      setState(() {
        _isCompounding = true;
        _progress = null;
      });
      // A long job: keep the screen on so the wallet is not locked half way.
      await KeepAwake.on();
      try {
        feeds.pauseFeeds(); // first thing in the try: the resume below always pairs with it
        await for (final p in runner.run()) {
          if (!mounted) {
            runner.stop();
            break;
          }
          setState(() => _progress = p);
        }
      } catch (e, st) {
        log.e('Compound failed', error: e, stackTrace: st);
        if (mounted) {
          UIUtil.showSnackbar(
              '${l10n.compoundFailure}. ${friendlyError(e)}', context);
        }
      } finally {
        feeds.resumeFeeds();
        // Payments that arrived while the feeds were off are not in the list:
        // read the history again now that they are back.
        txNotifier.reload().catchError((_) {});
        await KeepAwake.off();
        if (mounted) {
          setState(() => _isCompounding = false);
          final last = _progress;
          if (last != null && last.phase == CompoundPhase.done) {
            UIUtil.showSnackbar(l10n.compoundSuccess, context);
          }
        }
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
          if (!widget.lightMode && _progress == null) ...[
            const SizedBox(height: 14),
            Text(advice.message, style: styles.textStyleParagraph),
          ],
          if (_progress != null) ...[
            const SizedBox(height: 16),
            HsProgressBar(
              value: _isCompounding || _progress!.finished
                  ? _progress!.fraction
                  : null,
            ),
            const SizedBox(height: 8),
            Text(
              _progress!.message +
                  (_progress!.waitSeconds > 0
                      ? ' (${_progress!.waitSeconds ~/ 60}:${(_progress!.waitSeconds % 60).toString().padLeft(2, '0')})'
                      : ''),
              style: styles.textStyleParagraph,
            ),
            if (_progress!.round > 0 && _isCompounding) ...[
              const SizedBox(height: 4),
              Text(
                '${_count(_progress!.coinsNow)} coins now (started with '
                '${_count(_progress!.coinsAtStart)}). Goal: about '
                '$kCoinsToKeep per account, ${_count(_progress!.targetCoins)} '
                'in all.',
                style: styles.textStyleParagraph,
              ),
              const SizedBox(height: 4),
              Text(
                [
                  'Round ${_progress!.round}',
                  if (_progress!.etaText != null) _progress!.etaText!,
                ].join(' • ') +
                    '. Keep the app open.',
                style: styles.textStyleParagraph,
              ),
            ],
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
        if (_isCompounding)
          TextButton(
            style: styles.dialogButtonStyle,
            onPressed: () => _runner?.stop(),
            child: Text('STOP', style: styles.textStyleDialogOptions),
          )
        else
          TextButton(
            style: styles.dialogButtonStyle,
            // Something to merge now, or coins that just need a few minutes
            // (the job waits for them), or a stopped job to carry on with.
            onPressed: (widget.lightMode ||
                    advice.situation == CompoundSituation.ready ||
                    advice.situation == CompoundSituation.maturing)
                ? compound
                : null,
            child: Text(
              (_progress != null &&
                      _progress!.finished &&
                      _progress!.phase != CompoundPhase.done)
                  ? 'CONTINUE'
                  : l10n.compoundUppercased,
              style: styles.textStyleDialogOptions,
            ),
          ),
      ],
      // Show a linear progress indicator under content when compounding
    );
  }
}
