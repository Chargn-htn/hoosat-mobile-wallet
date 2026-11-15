import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/wallet_accounts/wallet_accounts_providers.dart';
import '../widgets/sheet_widget.dart';

/// Lets the user pick one of their own accounts (Main + any additional,
/// active ones) as a Send destination, instead of copy-pasting or
/// scanning an address they already own.
class MyAccountsPickerSheet extends ConsumerWidget {
  const MyAccountsPickerSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);
    final mainAddress = addressNotifier.defaultReceiveAddress;
    final active = ref.watch(activeAdditionalAccountsProvider);

    final entries = <(String, String)>[
      (l10n.mainAccountLabel, mainAddress.encoded),
      ...active.map((a) => (a.label, a.address)),
    ];

    return SheetWidget(
      title: l10n.myAccounts,
      mainWidget: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: entries.length,
        separatorBuilder: (_, __) => Divider(height: 1, color: theme.text15),
        itemBuilder: (context, index) {
          final (label, address) = entries[index];
          final truncated = address.length > 20
              ? '${address.substring(0, 10)}…${address.substring(address.length - 6)}'
              : address;
          return InkWell(
            onTap: () => appRouter.pop(context, withResult: address),
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label, style: styles.textStyleSettingItemHeader),
                        Text(
                          truncated,
                          style: styles.textStyleSettingItemSubheader,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
