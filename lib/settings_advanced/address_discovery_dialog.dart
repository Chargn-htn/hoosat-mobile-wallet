import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../wallet_address/address_discovery.dart';
import '../wallet_address/discovery_incomplete.dart';
import '../wallet_address/wallet_address.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/dialog.dart';

class AddressDiscoveryDialog extends HookConsumerWidget {
  const AddressDiscoveryDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addresses = ref.read(addressNotifierProvider);

    // True while a scan is running, including the moments after Cancel while it
    // finishes its current batch: a second scan must not start meanwhile.
    final scanning = useRef(false);
    final scanIndexes = useState<ScanIndexesPair>((
      receive: ScanIndexes(
        start: addresses.lastUsedReceiveIndex,
        scanned: null,
        last: null,
      ),
      change: ScanIndexes(
        start: addresses.lastUsedChangeIndex,
        scanned: null,
        last: null,
      ),
    ));

    final receiveIndexes = scanIndexes.value.receive;
    final changeIndexes = scanIndexes.value.change;

    Future<void> scan() async {
      if (scanning.value) return;
      scanning.value = true;
      final cancelled = ValueNotifier<bool>(false);
      final progress = ValueNotifier<String>('Starting...');
      var closedByCancel = false;
      DiscoveryResult? receiveDone;

      // Funds that were found must never be dropped, even when the scan is
      // cancelled or the node stops answering half way.
      Future<void> keepFound(WalletDiscoveryResult result) async {
        if (!result.isNotEmpty) return;
        await addresses.addAddresses(result.addresses);
        final txNotifier = ref.read(txNotifierProvider);
        await txNotifier.cache.addWalletTxIds(result.txIds);
        await txNotifier.reload();
      }

      Future<void> keepPartial(DiscoveryResult? partial) async {
        final none = DiscoveryResult(
          addresses: {},
          txIds: {},
          scanIndexes: ScanIndexes.empty,
        );
        await keepFound((
          receive: receiveDone ?? partial ?? none,
          change: receiveDone != null ? (partial ?? none) : none,
        ));
      }

      try {
        AppDialogs.showInProgressDialog(
          context,
          l10n.scanningTitle,
          l10n.scanningDescription,
          contentWidget: ValueListenableBuilder<String>(
            valueListenable: progress,
            builder: (_, text, __) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.scanningDescription,
                    style: styles.textStyleParagraph),
                const SizedBox(height: 14),
                Text(text, style: styles.textStyleParagraph),
              ],
            ),
          ),
          onCancel: () {
            closedByCancel = true;
            cancelled.value = true;
          },
        );
        final network = ref.read(networkProvider);
        final auth = ref.read(walletAuthProvider.notifier);
        final addressGenerator = auth.addressGenerator(network);
        final client = ref.read(hoosatClientProvider);
        final api = ref.read(HoosatApiServiceProvider);

        var mainLine = 'Starting...';
        var stageLine = '';
        void refresh() => progress.value =
            stageLine.isEmpty ? mainLine : '$mainLine\n($stageLine)';

        final addressDiscovery = AddressDiscovery(
          client: client,
          api: api,
          addressGenerator: addressGenerator,
          addressNameCallback: (type, index) {
            return type == AddressType.receive
                ? l10n.receiveIndexParam('$index')
                : l10n.changeIndexParam('$index');
          },
          onStage: (stage) {
            stageLine = stage;
            refresh();
          },
        );

        // Searches the node itself for funded addresses (works on every
        // network, no explorer needed). Each press continues from where the
        // last one stopped and keeps going while funds keep turning up, then
        // stops after 300 empty addresses in a row.
        const gap = 300;
        const cap = 3000;
        final receiveStart =
            receiveIndexes.scanned != null ? receiveIndexes.scanned! + 1 : 0;
        final changeStart =
            changeIndexes.scanned != null ? changeIndexes.scanned! + 1 : 0;

        final stopwatch = Stopwatch()..start();
        final checkedByType = <AddressType, int>{};

        bool onProgress(AddressType type, int index, int start) {
          checkedByType[type] = index - start;
          final total = checkedByType.values.fold<int>(0, (a, b) => a + b);
          final label = type == AddressType.receive ? 'Receive' : 'Change';
          mainLine = '$label addresses... $total checked '
              '(${stopwatch.elapsed.inSeconds}s)';
          refresh();
          return !cancelled.value;
        }

        final receiveResult = await addressDiscovery.balanceDiscoveryFor(
          type: AddressType.receive,
          startIndex: receiveStart,
          maxIndex: receiveStart + cap,
          batchSize: 20,
          gapLimit: gap,
          onProgress: (t, i) => onProgress(t, i, receiveStart),
        );
        receiveDone = receiveResult;
        final changeResult = await addressDiscovery.balanceDiscoveryFor(
          type: AddressType.change,
          startIndex: changeStart,
          maxIndex: changeStart + cap,
          batchSize: 20,
          gapLimit: gap,
          onProgress: (t, i) => onProgress(t, i, changeStart),
        );
        final result = (receive: receiveResult, change: changeResult);
        final totalChecked =
            ((receiveResult.scanIndexes.scanned ?? receiveStart - 1) -
                    receiveStart +
                    1) +
                ((changeResult.scanIndexes.scanned ?? changeStart - 1) -
                    changeStart +
                    1);

        scanIndexes.value = (
          receive: ScanIndexes(
            start: receiveIndexes.start,
            scanned: result.receive.scanIndexes.scanned,
            last: result.receive.scanIndexes.last ??
                receiveIndexes.last ??
                receiveIndexes.start,
          ),
          change: ScanIndexes(
            start: changeIndexes.start,
            scanned: result.change.scanIndexes.scanned,
            last: result.change.scanIndexes.last ??
                changeIndexes.last ??
                changeIndexes.start,
          )
        );

        await keepFound(result);

        // A full scan finished, so the "search did not finish" notice no
        // longer applies.
        final wallet = ref.read(selectedWalletProvider);
        if (wallet != null) {
          await setDiscoveryIncomplete(ref, wallet.wid, false);
        }
        if (context.mounted) {
          UIUtil.showSnackbar(
            'Scan finished: $totalChecked addresses checked in '
            '${stopwatch.elapsed.inSeconds}s.',
            context,
          );
        }
      } on DiscoveryCancelled catch (e) {
        await keepPartial(e.partial);
        UIUtil.showSnackbar(
            'Scan cancelled. What was found so far was kept.', context);
      } on DiscoveryFailed catch (e) {
        await keepPartial(e.partial);
        UIUtil.showSnackbar(
            '${e.message} What was found so far was kept. Please try again.',
            context);
      } catch (e) {
        UIUtil.showSnackbar(l10n.scanFailedMessage, context);
      } finally {
        scanning.value = false;
        if (!closedByCancel) appRouter.pop(context);
        cancelled.dispose();
        progress.dispose();
      }
    }

    return AppAlertDialog(
      title: Text(
        l10n.addressDiscovery,
        style: styles.textStyleDialogHeader,
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.indexHeader,
                  style: styles.textStyleParagraph,
                ),
                Text(
                  l10n.currentIndex,
                  style: styles.textStyleParagraph,
                ),
                Text(
                  l10n.scannedIndex,
                  style: styles.textStyleParagraph,
                ),
                Text(
                  l10n.newIndex,
                  style: styles.textStyleParagraph,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  l10n.receive,
                  style: styles.textStyleParagraph,
                ),
                Text(
                  '${receiveIndexes.start ?? '-'}',
                  style: styles.textStyleParagraph,
                ),
                Text(
                  '${receiveIndexes.scanned ?? '-'}',
                  style: styles.textStyleParagraph,
                ),
                Text(
                  '${receiveIndexes.last ?? '-'}',
                  style: styles.textStyleParagraph,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  l10n.change,
                  style: styles.textStyleParagraph,
                ),
                Text(
                  '${changeIndexes.start ?? '-'}',
                  style: styles.textStyleParagraph,
                ),
                Text(
                  '${changeIndexes.scanned ?? '-'}',
                  style: styles.textStyleParagraph,
                ),
                Text(
                  '${changeIndexes.last ?? '-'}',
                  style: styles.textStyleParagraph,
                ),
              ],
            ),
          ),
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
          onPressed: scan,
          child: Text(
            l10n.scanMore,
            style: styles.textStyleDialogOptions,
          ),
        ),
      ],
    );
  }
}
