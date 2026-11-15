import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../send_sheet/balance_text_widget.dart';
import '../util/ui_util.dart';
import '../widgets/address_widgets.dart';
import '../widgets/sheet_util.dart';
import 'account_display_name_provider.dart';
import 'address_details_sheet.dart';
import 'wallet_address.dart';

class AddressListItem extends ConsumerWidget {
  final WalletAddress address;
  final void Function(WalletAddress address)? onSelection;

  const AddressListItem({
    super.key,
    required this.address,
    this.onSelection,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final accounts = ref.watch(addressNotifierProvider);

    final displayName = resolveAccountDisplayName(
      ref: ref,
      encodedAddress: address.encoded,
      mainAddress: accounts.defaultReceiveAddress.encoded,
      mainLabel: l10n.mainAccountLabel,
      fallbackName: address.name,
    );

    void showAddressDetails() {
      if (onSelection != null) {
        return onSelection?.call(address);
      }
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: ref.read(themeProvider),
        widget: AddressDetailsSheet(address: address),
      );
    }

    Future<void> copyAddress() async {
      await Clipboard.setData(ClipboardData(text: address.encoded));
      final message = address.type == AddressType.receive
          ? l10n.receiveAddressCopied
          : l10n.changeAddressCopied;
      UIUtil.showSnackbar(message, context);
    }

    final selected = accounts.isAddressSelected(address);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.backgroundDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? theme.primary45 : theme.text10,
        ),
      ),
      child: InkWell(
        onTap: showAddressDetails,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 6, 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primary15,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(
                  address.getShortName().toUpperCase(),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: theme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: theme.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: AddressThreeLineText(
                        address: address.encoded,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 6),
                    BalanceRowWidget(address: address),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.copy, size: 18, color: theme.text60),
                tooltip: l10n.copyAddress,
                onPressed: copyAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
