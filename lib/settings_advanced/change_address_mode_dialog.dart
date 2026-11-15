import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/address_settings.dart';
import '../widgets/app_simpledialog.dart';

Future<void> showChangeAddressModeDialog(
  BuildContext context,
  WidgetRef ref,
) async {
  final selection = await showAppDialog<ChangeAddressMode>(
    context: context,
    builder: (_) => const ChangeAddressModeDialog(),
  );
  if (selection != null) {
    final notifier = ref.read(addressSettingsProvider.notifier);
    notifier.setChangeAddressMode(selection);
  }
}

class ChangeAddressModeDialog extends ConsumerWidget {
  const ChangeAddressModeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final style = styles.textStyleDialogOptions;
    final current = ref.watch(changeAddressModeProvider);

    // A tick on the option that is active now, so the dialog itself shows
    // which mode the wallet is in.
    Widget option(String text, ChangeAddressMode mode) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(child: Text(text, style: style)),
              if (current == mode)
                Icon(Icons.check_circle,
                    size: 20, color: ref.watch(themeProvider).primary),
            ],
          ),
        );

    return AppSimpleDialog(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          l10n.changeAddressModeDialogTitle,
          style: styles.textStyleDialogHeader,
        ),
      ),
      children: [
        SimpleDialogOption(
          onPressed: () => appRouter.pop(
            context,
            withResult: ChangeAddressMode.keepPerAddress,
          ),
          child: option(
            l10n.changeAddressModeDialogOptionKeepPerAddress,
            ChangeAddressMode.keepPerAddress,
          ),
        ),
        SimpleDialogOption(
          onPressed: () => appRouter.pop(
            context,
            withResult: ChangeAddressMode.private,
          ),
          child: option(
            l10n.changeAddressModeDialogOptionPrivate,
            ChangeAddressMode.private,
          ),
        ),
      ],
    );
  }
}
