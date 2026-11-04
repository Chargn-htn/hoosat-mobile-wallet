import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../settings/wallet_accounts.dart';
import '../util/numberutil.dart';
import '../util/ui_util.dart';
import '../widgets/sheet_header_button.dart';
import '../widgets/sheet_widget.dart';
import 'account_label_dialog.dart';

/// Lists the wallet's named accounts: Main (implicit, always shown, never
/// archivable) plus any additional addresses the user has added. Reachable
/// from the Advanced menu; the real home screen (step 13e) will surface
/// this more prominently once it's built.
class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

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
    final balancesAsync =
        ref.watch(balancesForAddressesProvider(allAddresses));

    // Archived accounts auto-restore if money shows up on them later --
    // the underlying address can't really be deleted, so archiving only
    // ever hides it. Checked whenever fresh balances come in for this
    // screen, rather than via a dedicated background listener.
    ref.listen(balancesForAddressesProvider(allAddresses), (_, next) {
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

    String balanceFor(String address) {
      final balances = balancesAsync.valueOrNull;
      if (balances == null) return '';
      final entry = balances.where((b) => b.address == address).firstOrNull;
      if (entry == null) return '';
      final amount = Amount.raw(BigInt.from(entry.balance.toInt()));
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

    Widget accountRow({
      required String label,
      required String address,
      VoidCallback? onTap,
      Widget? trailing,
    }) {
      final truncated = address.length > 20
          ? '${address.substring(0, 10)}…${address.substring(address.length - 6)}'
          : address;
      return InkWell(
        onTap: onTap,
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
              Text(
                balanceFor(address),
                style: styles.textStyleSettingItemHeader,
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                trailing,
              ],
            ],
          ),
        ),
      );
    }

    return SheetWidget(
      title: l10n.manageAccounts,
      rightWidget: SheetHeaderButton(
        icon: Icons.add,
        onPressed: active.length < maxActiveAdditionalAccounts
            ? addAccount
            : null,
      ),
      mainWidget: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                l10n.noAdditionalAccountsYet,
                textAlign: TextAlign.center,
                style: styles.textStyleSettingItemSubheader,
              ),
            ),
          if (archived.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Text(
                l10n.archivedAccountsHeader,
                style: styles.textStyleSettingItemSubheader,
              ),
            ),
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
        ],
      ),
    );
  }
}
