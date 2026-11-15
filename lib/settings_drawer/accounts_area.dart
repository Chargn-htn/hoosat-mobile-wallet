import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../wallet_address/address_details_sheet.dart';
import '../widgets/selected_wallet_button.dart';
import '../widgets/sheet_util.dart';

class AccountsArea extends ConsumerWidget {
  const AccountsArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    final account = ref.watch(receiveAddressProvider);
    final wallet = ref.watch(walletProvider);

    void showAccountDetails() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: AddressDetailsSheet(address: account),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 4, 22, 0),
      child: Row(
        children: [
          const SelectedWalletButton(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${wallet.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: theme.text,
                  ),
                ),
                const SizedBox(height: 2),
                InkWell(
                  onTap: showAccountDetails,
                  child: Text(
                    _short(account.encoded),
                    maxLines: 1,
                    style: TextStyle(fontSize: 12.5, color: theme.text60),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _short(String a) => a.length > 24
      ? '${a.substring(0, 12)}...${a.substring(a.length - 8)}'
      : a;
}
