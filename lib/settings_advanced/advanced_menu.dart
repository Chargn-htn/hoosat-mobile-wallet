import 'package:flutter/material.dart';
import '../widgets/hs_kit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../settings_drawer/double_line_item_two.dart';
import '../transactions/tx_filter_settings.dart';
import '../sign_message/sign_message_sheet.dart';
import '../tx_report/tx_report_sheet.dart';
import '../util/ui_util.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/sheet_util.dart';
import 'accounts_screen.dart';
import 'address_discovery_dialog.dart';
import 'change_address_mode_settings.dart';
import 'compound_utxos_dialog.dart';
import 'move_to_main_dialog.dart';
import 'kpub_sheet.dart';

class AdvancedMenu extends ConsumerWidget {
  final VoidCallback onBackAction;
  const AdvancedMenu({
    Key? key,
    required this.onBackAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final wallet = ref.watch(walletProvider);

    Future<void> compoundUtxos() async {
      final (:cont, :rbf) = await UIUtil.checkForPendingTx(context, ref: ref);
      if (cont) {
        showAppDialog(
          context: context,
          builder: (_) => CompoundUtxosDialog(rbf: rbf),
        );
      }
    }

    Future<void> moveToMain() async {
      final (:cont, :rbf) = await UIUtil.checkForPendingTx(context, ref: ref);
      if (cont) {
        showAppDialog(
          context: context,
          builder: (_) => MoveToMainDialog(rbf: rbf),
        );
      }
    }

    void showAccounts() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const AccountsScreen(),
      );
    }

    Future<void> scanMoreAddresses() async {
      await showAppDialog(
        context: context,
        builder: (_) => const AddressDiscoveryDialog(),
      );
    }

    Future<void> showKpub() async {
      final authUtil = ref.read(authUtilProvider);
      final message = l10n.kpubAuth;
      final auth = await authUtil.authenticate(context, message, message);

      if (!auth) {
        return;
      }

      return Sheets.showAppHeightNineSheet(
        context: context,
        widget: const KpubSheet(),
        theme: theme,
      );
    }

    Future<void> signMessage() async {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const SignMessageSheet(),
      );
    }

    Future<void> transactionReport() async {
      Sheets.showAppHeightEightSheet(
        context: context,
        theme: theme,
        widget: const TxReportSheet(),
      );
    }

    return HsSubPage(
      title: l10n.advancedHeader,
      onBack: onBackAction,
      child: HsMenuList(children: [
                      HsSectionLabel(l10n.manage),
                      if (!wallet.isViewOnly) ...[
                        Divider(height: 2, color: theme.text15),
                        DoubleLineItemTwo(
                          heading: l10n.signMessage,
                          text: l10n.signMessageDescription,
                          icon: Icons.draw,
                          iconSize: 28,
                          onPressed: signMessage,
                        ),
                        Divider(height: 2, color: theme.text15),
                        DoubleLineItemTwo(
                          heading: l10n.compoundUtxos,
                          text: l10n.compoundUtxosDescription,
                          icon: Icons.refresh,
                          iconSize: 28,
                          onPressed: compoundUtxos,
                        ),
                        Divider(height: 2, color: theme.text15),
                        DoubleLineItemTwo(
                          heading: l10n.moveToMain,
                          text: l10n.moveToMainDescription,
                          icon: Icons.call_merge,
                          iconSize: 28,
                          onPressed: moveToMain,
                        ),
                      ],
                      Divider(height: 2, color: theme.text15),
                      DoubleLineItemTwo(
                        heading: l10n.manageAccounts,
                        text: l10n.manageAccountsDescription,
                        icon: Icons.people_outline,
                        iconSize: 28,
                        onPressed: showAccounts,
                      ),
                      Divider(height: 2, color: theme.text15),
                      const ChangeAddressModeSettings(),
                      Divider(height: 2, color: theme.text15),
                      DoubleLineItemTwo(
                        heading: l10n.addressDiscovery,
                        text: l10n.scanMoreAddresses,
                        icon: Icons.account_balance_wallet,
                        iconSize: 28,
                        onPressed: scanMoreAddresses,
                      ),
                      if (wallet.hasValidKpub) ...[
                        Divider(height: 2, color: theme.text15),
                        DoubleLineItemTwo(
                          heading: l10n.kpubTitle,
                          text: l10n.kpubAuth,
                          icon: Icons.vpn_key,
                          iconSize: 28,
                          onPressed: showKpub,
                        ),
                      ],
                      Divider(height: 2, color: theme.text15),
                      DoubleLineItemTwo(
                        heading: l10n.txReport,
                        text: l10n.txReportSubtitle,
                        icon: Icons.download,
                        iconSize: 28,
                        onPressed: transactionReport,
                      ),
                      Divider(height: 2, color: theme.text15),
                      const TxFilterSettings(),
                    ]),
    );
  }
}

// (Auto-compound toggle removed as per request)
