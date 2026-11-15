import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../wallet_address/wallet_addresses_sheet.dart';
import '../widgets/hs_kit.dart';
import '../widgets/sheet_util.dart';

class AccountSwitcher extends ConsumerWidget {
  const AccountSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    void showAccountsSheet() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const WalletAddressesSheet(),
      );
    }

    return HsCircleButton(
      icon: Icons.more_horiz,
      onPressed: showAccountsSheet,
    );
  }
}
