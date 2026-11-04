import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/wallet_accounts.dart';
import '../widgets/app_simpledialog.dart';
import 'send_from_providers.dart';

/// Returned by SendFromDialog to mean "chose Any" -- never a real bech32
/// address (those always carry a "hoosat:" prefix), so it can't collide
/// with an actual chosen address, and stays distinct from the plain null
/// showAppDialog's Future<T?> already uses for "dismissed without choosing."
const sendFromAnyResult = '__send_from_any__';

/// Row shown on the Send compose screen letting the user pick which
/// address this send draws from. Defaults to "Any" -- today's existing
/// pooled-balance behavior -- unless the user explicitly picks one.
class SendFromRow extends ConsumerWidget {
  const SendFromRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final fromAddress = ref.watch(sendFromAddressProvider);
    final label = fromAddress == null ? l10n.sendFromAny : fromAddress.name;

    return InkWell(
      onTap: () => showSendFromDialog(context, ref),
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.sendFromLabel, style: styles.textStyleAccount),
            Row(
              children: [
                Text(label, style: styles.textStyleSettingItemHeader),
                const SizedBox(width: 2),
                Icon(Icons.expand_more, size: 18, color: styles.theme.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showSendFromDialog(BuildContext context, WidgetRef ref) async {
  final selection = await showAppDialog<String>(
    context: context,
    builder: (_) => const SendFromDialog(),
  );
  if (selection == null) {
    return; // dismissed without choosing, leave the current selection as-is
  }
  if (selection == sendFromAnyResult) {
    ref.read(sendFromAddressProvider.notifier).state = null;
    return;
  }
  final addressNotifier = ref.read(addressNotifierProvider);
  final walletAddress = addressNotifier.getAddress(selection);
  if (walletAddress != null) {
    ref.read(sendFromAddressProvider.notifier).state = walletAddress;
  }
}

class SendFromDialog extends ConsumerWidget {
  const SendFromDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);
    final mainAddress = addressNotifier.defaultReceiveAddress;
    final active = ref.watch(activeAdditionalAccountsProvider);

    final style = styles.textStyleDialogOptions;

    return AppSimpleDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(l10n.sendFromLabel, style: styles.textStyleDialogHeader),
      ),
      children: [
        SimpleDialogOption(
          onPressed: () => appRouter.pop(
            context,
            withResult: sendFromAnyResult,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(l10n.sendFromAny, style: style),
          ),
        ),
        SimpleDialogOption(
          onPressed: () => appRouter.pop(
            context,
            withResult: mainAddress.encoded,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(mainAddress.name, style: style),
          ),
        ),
        for (final account in active)
          SimpleDialogOption(
            onPressed: () => appRouter.pop(
              context,
              withResult: account.address,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(account.label, style: style),
            ),
          ),
      ],
    );
  }
}
