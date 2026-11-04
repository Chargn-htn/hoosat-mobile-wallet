import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import '../settings/address_settings.dart';
import '../settings_drawer/double_line_item_two.dart';
import 'change_address_mode_dialog.dart';

class ChangeAddressModeSettings extends ConsumerWidget {
  const ChangeAddressModeSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    final mode = ref.watch(changeAddressModeProvider);

    final description = switch (mode) {
      ChangeAddressMode.keepPerAddress =>
        l10n.changeAddressModeDescriptionKeepPerAddress,
      ChangeAddressMode.private => l10n.changeAddressModeDescriptionPrivate,
    };

    return DoubleLineItemTwo(
      heading: l10n.changeAddressModeTitle,
      text: description,
      icon: Icons.account_balance_wallet_outlined,
      iconSize: 28,
      onPressed: () => showChangeAddressModeDialog(context, ref),
    );
  }
}
