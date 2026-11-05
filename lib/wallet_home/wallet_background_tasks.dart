import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../auth_sign/auth_sign_util.dart';
import '../hoosat/hoosat.dart';
import '../hoosat/types.dart';
import '../l10n/l10n.dart';
import '../settings_advanced/compound_utxos_dialog.dart';
import '../util/ui_util.dart';
import '../widgets/app_simpledialog.dart';

final _walletWatcherProvider = Provider.autoDispose((ref) {
  ref.watch(virtualDaaScoreProvider);
  ref.watch(virtualSelectedParentBlueScoreStreamProvider);

  ref.watch(addressNotifierProvider);
  ref.watch(balanceNotifierProvider);
  ref.watch(txNotifierProvider);
  ref.watch(utxoNotifierProvider);
  ref.watch(utxoListProvider);
  ref.watch(pendingTxsProvider);

  ref.watch(addressMonitorProvider);
});

/// Keeps wallet data (balance/tx/utxo/addresses) actively watched and
/// refreshed, handles app-link URIs, and suggests compounding when UTXOs
/// pile up -- regardless of which of the 4 main tabs is currently
/// visible. Extracted from the old WalletHome (which only ran this while
/// Home itself was the only screen); renders nothing itself.
class WalletBackgroundTasks extends HookConsumerWidget {
  const WalletBackgroundTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    ref.watch(_walletWatcherProvider);
    // Ensure stable hook order: declare useRef outside useEffect
    final isHandling = useRef(false);

    useEffect(() {
      // Suggest compounding if UTXO count exceeds chunk size when wallet is opened.
      void maybeSuggestCompound() async {
        final walletAuth = ref.read(walletAuthProvider);
        if (walletAuth.isLocked) return;

        // Skip suggestion for view-only wallets
        final wallet = ref.read(walletProvider);
        if (wallet.isViewOnly) return;

        // Avoid suggesting while an app link is being processed.
        final appLink = ref.read(appLinkProvider);
        if (appLink != null) return;

        final utxos = ref.read(utxoListProvider);
        const chunkSize = 84;
        if (utxos.length > chunkSize) {
          // Check for pending txs to decide RBF behavior (may show a quick prompt if pending exists)
          final (:cont, :rbf) =
              await UIUtil.checkForPendingTx(context, ref: ref);
          if (!cont) {
            // user cancelled; don't show again this session
            ref.read(compoundPromptShownProvider.notifier).state = true;
            return;
          }
          if (!context.mounted) return;
          // Show a lightweight suggestion dialog that reuses the compound dialog in light mode
          await showAppDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => CompoundUtxosDialog(lightMode: true, rbf: rbf),
          );
          // Mark as shown for this session
          ref.read(compoundPromptShownProvider.notifier).state = true;
        }
      }

      void handle(String? appLink) {
        if (appLink == null) {
          return;
        }

        final walletAuth = ref.read(walletAuthProvider);
        if (walletAuth.isLocked) {
          return;
        }
        if (isHandling.value) return;
        isHandling.value = true;

        final prefix = ref.read(addressPrefixProvider);
        final authUri = HoosatAuthUri.tryParse(appLink);
        final uri = HoosatUri.tryParse(appLink, prefix: prefix);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Delay slightly to let any transient lifecycle (inactive/resumed)
          // so the sheet isn't immediately closed.
          Future.delayed(const Duration(milliseconds: 300), () {
            if (authUri != null) {
              handleAuthSignUri(context, ref: ref, uri: authUri);
              ref.read(appLinkProvider.notifier).state = null;
              isHandling.value = false;
              return;
            }

            if (uri == null) {
              UIUtil.showSnackbar(l10n.hoosatUriInvalid, context);
              // clear link and unlock handling
              ref.read(appLinkProvider.notifier).state = null;
              isHandling.value = false;
              return;
            }

            UIUtil.showSendFlow(context, ref: ref, uri: uri);
            // clear link and unlock handling
            ref.read(appLinkProvider.notifier).state = null;
            isHandling.value = false;
          });
        });
      }

      ref.listen<String?>(
        appLinkProvider,
        (_, next) => handle(next),
      );
      ref.listen(
        walletAuthProvider.select((auth) => auth.isLocked),
        (_, __) => handle(ref.read(appLinkProvider)),
      );

      // Defer initial handle to next frame to avoid modifying providers during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        handle(ref.read(appLinkProvider));
        // Also check for compound suggestion after first frame
        maybeSuggestCompound();
      });

      return null;
    }, const []);

    return const SizedBox.shrink();
  }
}
