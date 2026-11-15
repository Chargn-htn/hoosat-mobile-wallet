import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../settings/wallet_accounts.dart';
import '../util/numberutil.dart';
import '../wallet_address/account_adoption.dart';
import '../util/ui_util.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/qr_code_widget.dart';
import '../widgets/hs_kit.dart';
import 'account_row.dart';
import '../widgets/sheet_header_button.dart';
import '../widgets/sheet_widget.dart';
import 'account_label_dialog.dart';

/// Lists the wallet's named accounts: Main (implicit, always shown, never
/// archivable) plus any additional addresses the user has added. Reachable
/// from the Advanced menu; the real home screen (step 13e) will surface
/// this more prominently once it's built.
class AccountsScreen extends ConsumerWidget {
  /// true when shown as the Accounts tab (page header), false as a sheet.
  final bool isTab;
  const AccountsScreen({super.key, this.isTab = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);
    final mainAddress = addressNotifier.defaultReceiveAddress;
    final active = ref.watch(activeAdditionalAccountsProvider);
    final archived = ref.watch(archivedAdditionalAccountsProvider);
    final kasSymbol = ref.watch(kasSymbolProvider);

    final allAddresses = [
      mainAddress.encoded,
      ...active.map((a) => a.address),
      ...archived.map((a) => a.address),
    ];
    final allAddressesKey = allAddresses.join(',');

    // Archived accounts auto-restore if money shows up on them later --
    // the underlying address can't really be deleted, so archiving only
    // ever hides it. Checked whenever fresh balances come in for this
    // screen, rather than via a dedicated background listener.
    ref.listen(balancesForAddressesProvider(allAddressesKey), (_, next) {
      next.whenData((balances) {
        final funded = balances
            .where((b) => b.balance.toInt() > 0)
            .map((b) => b.address)
            .toSet();
        final archivedAddresses = archived.map((a) => a.address).toSet();
        final fundedArchived = funded.intersection(archivedAddresses);
        if (fundedArchived.isNotEmpty) {
          ref.read(walletAccountsProvider.notifier).unarchiveFunded(funded);
        }
      });
    });

    // Same source as Home: saved balances. Main = total minus the accounts.
    String balanceFor(String address) {
      final Amount amount = address == mainAddress.encoded
          ? ref.watch(mainBalanceProvider)
          : ref.watch(balanceForAddressProvider(address));
      return '${NumberUtil.formatedAmount(amount)} $kasSymbol';
    }

    Future<void> addAccount() async {
      final label = await showAccountLabelDialog(context);
      if (label == null) return;

      try {
        final newAddress = addressNotifier.receiveAddress.encoded;
        await addressNotifier.addNewReceiveAddress();
        await ref.read(walletAccountsProvider.notifier).addAccount(
              address: newAddress,
              label: label,
            );
      } catch (e) {
        if (context.mounted) UIUtil.showSnackbar(e.toString(), context);
      }
    }

    Future<void> renameAccount(WalletAccountEntry account) async {
      final label =
          await showAccountLabelDialog(context, initialValue: account.label);
      if (label == null || label == account.label) return;

      try {
        await ref
            .read(walletAccountsProvider.notifier)
            .renameAccount(account.address, label);
      } catch (e) {
        if (context.mounted) UIUtil.showSnackbar(e.toString(), context);
      }
    }

    Future<void> archiveAccount(WalletAccountEntry account) async {
      await ref
          .read(walletAccountsProvider.notifier)
          .archiveAccount(account.address);
    }

    Future<void> restoreAccount(WalletAccountEntry account) async {
      await ref
          .read(walletAccountsProvider.notifier)
          .restoreAccount(account.address);
    }

    Future<void> copyAddress(String address) async {
      await Clipboard.setData(ClipboardData(text: address));
      if (context.mounted) {
        UIUtil.showSnackbar(l10n.addressCopied, context);
      }
    }

    Future<void> showAccountDetails(String label, String address,
        {String? balance}) async {
      await showAppDialog(
        context: context,
        builder: (_) => AppAlertDialog(
          title: Text(label, style: styles.textStyleDialogHeader),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.totalBalance, style: styles.textStyleSettingItemSubheader),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 16),
                child: Text(
                  balance ?? balanceFor(address),
                  style: styles.textStyleSettingItemHeader,
                ),
              ),
              Text(l10n.address, style: styles.textStyleSettingItemSubheader),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 16),
                child: SelectableText(
                  address,
                  style: styles.textStyleAddressText90,
                ),
              ),
              Center(
                child: QrCodeWidget(
                  data: address,
                  onTap: () => copyAddress(address),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              style: styles.dialogButtonStyle,
              onPressed: () => copyAddress(address),
              child: Text(
                l10n.copy.toUpperCase(),
                style: styles.textStyleDialogButtonText,
              ),
            ),
            TextButton(
              style: styles.dialogButtonStyle,
              onPressed: () => appRouter.pop(context),
              child: Text(
                l10n.close.toUpperCase(),
                style: styles.textStyleDialogButtonText,
              ),
            ),
          ],
        ),
      );
    }

    Widget accountRow({
      required String label,
      required String address,
      VoidCallback? onTap,
      Widget? trailing,
      String? balanceOverride,
    }) {
      return AccountRow(
        label: label,
        address: address,
        balance: balanceOverride ?? balanceFor(address),
        onTap: onTap,
        onCopy: () => copyAddress(address),
        copyTooltip: l10n.addressCopied,
        trailing: trailing,
      );
    }

    // Saved accounts this wallet cannot spend (they belong to another wallet).
    final foreignAddresses =
        ref.watch(accountAdoptionProvider).valueOrNull?.foreign ?? const [];
    final foreignAccounts = ref
        .watch(walletAccountsProvider)
        .accounts
        .where((a) => foreignAddresses.contains(a.address))
        .toList();
    final foreignLive = foreignAccounts.isEmpty
        ? null
        : ref.watch(balancesForAddressesProvider(
            foreignAccounts.map((a) => a.address).join(',')));
    String foreignBalance(String address) {
      final entries = foreignLive?.valueOrNull;
      if (entries == null) return '…';
      final e = entries.where((b) => b.address == address).firstOrNull;
      final raw = e == null ? BigInt.zero : BigInt.from(e.balance.toInt());
      return '${NumberUtil.formatedAmount(Amount.raw(raw))} $kasSymbol';
    }

    final addButton = HsCircleButton(
      icon: Icons.add,
      tooltip: l10n.manageAccounts,
      onPressed:
          active.length < maxActiveAdditionalAccounts ? addAccount : null,
    );
    final list = HsMenuList(children: [

          accountRow(
            label: l10n.mainAccountLabel,
            address: mainAddress.encoded,
          ),
          Divider(height: 1, color: theme.text15),
          for (final account in active) ...[
            accountRow(
              label: account.label,
              address: account.address,
              onTap: () => renameAccount(account),
              trailing: IconButton(
                icon: Icon(Icons.archive_outlined, color: theme.primary),
                tooltip: l10n.archiveAction,
                onPressed: () => archiveAccount(account),
              ),
            ),
            Divider(height: 1, color: theme.text15),
          ],
          if (active.isEmpty)
            HsNote(l10n.noAdditionalAccountsYet),
          if (foreignAccounts.isNotEmpty) ...[
            HsSectionLabel(l10n.accountsOtherWalletHeader),
            for (final account in foreignAccounts) ...[
              accountRow(
                label: account.label,
                address: account.address,
                onTap: () => showAccountDetails(account.label, account.address,
                    balance: foreignBalance(account.address)),
                balanceOverride: foreignBalance(account.address),
              ),
              Divider(height: 1, color: theme.text15),
            ],
            HsNote(l10n.accountsOtherWalletNote),
          ],
          if (archived.isNotEmpty) ...[
            HsSectionLabel(l10n.archivedAccountsHeader),
            for (final account in archived) ...[
              accountRow(
                label: account.label,
                address: account.address,
                trailing: IconButton(
                  icon: Icon(Icons.unarchive_outlined, color: theme.primary),
                  tooltip: l10n.restoreAction,
                  onPressed: () => restoreAccount(account),
                ),
              ),
              Divider(height: 1, color: theme.text15),
            ],
          ],
        
    ]);
    if (isTab) {
      return Column(
        children: [
          HsPageHeader(title: l10n.manageAccounts, trailing: addButton),
          Expanded(child: list),
        ],
      );
    }
    return SheetWidget(
      title: l10n.manageAccounts,
      rightWidget: SheetHeaderButton(
        icon: Icons.add,
        onPressed:
            active.length < maxActiveAdditionalAccounts ? addAccount : null,
      ),
      mainWidget: list,
    );
  }
}
