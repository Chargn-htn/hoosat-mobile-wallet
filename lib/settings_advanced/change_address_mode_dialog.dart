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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              l10n.changeAddressModeDialogOptionKeepPerAddress,
              style: style,
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () => appRouter.pop(
            context,
            withResult: ChangeAddressMode.private,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              l10n.changeAddressModeDialogOptionPrivate,
              style: style,
            ),
          ),
        ),
      ],
    );
  }
}
