import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../send_sheet/account_address_widget.dart';
import '../util/ui_util.dart';
import '../util/user_data_util.dart';
import '../wallet_address/address_selection_sheet.dart';
import '../wallet_address/wallet_address.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/sheet_util.dart';
import '../widgets/sheet_widget.dart';

const kMaxMessageLength = 2000;

class SignMessageSheet extends HookConsumerWidget {
  const SignMessageSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);
    final signAddress = ref.watch(selectedAddressProvider);

    final focusNode = useFocusNode();
    final controller = useTextEditingController();
    final signature = useState<({String signature, String hash})?>(null);

    void setMessage(String message) {
      if (message.length > kMaxMessageLength) {
        UIUtil.showSnackbar(l10n.signMessageTooLong, context);
        return;
      }
      controller.text = message;
      controller.selection = TextSelection.collapsed(offset: message.length);
    }

    Future<void> scanQrCode() async {
      final result = await UserDataUtil.scanQrCode(context);
      final message = result?.code;
      if (message == null || !context.mounted) {
        return;
      }
      setMessage(message);
    }

    Future<void> pasteFromClipboard() async {
      final data = await Clipboard.getData(Clipboard.kTextPlain);
      final message = data?.text;
      if (!context.mounted) {
        return;
      }
      if (message == null || message.isEmpty) {
        UIUtil.showSnackbar(l10n.clipboardEmpty, context);
        return;
      }
      setMessage(message);
    }

    Future<void> selectAddress() async {
      final theme = ref.read(themeProvider);
      await Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const AddressSelectionSheet(
          addressType: AddressType.receive,
          anyType: true,
        ),
      );
    }

    Future<void> signMessage() async {
      final authUtil = ref.read(authUtilProvider);
      final auth = await authUtil.authenticate(
        context,
        l10n.signMessage,
        l10n.signMessage,
      );
      if (!auth || !context.mounted) {
        return;
      }

      try {
        final walletService = ref.read(walletServiceProvider);
        signature.value = await walletService.signPersonalMessage(
          controller.text,
          address: signAddress.address,
        );
      } catch (e) {
        if (context.mounted) {
          UIUtil.showSnackbar(l10n.sendError, context);
        }
      }
    }

    Future<void> copySignature() async {
      await Clipboard.setData(
        ClipboardData(text: signature.value?.signature ?? ''),
      );
      if (context.mounted) {
        UIUtil.showSnackbar(l10n.signMessageSignatureCopied, context);
      }
    }

    final details = signature.value;
    final signed = details != null;
    final bottomInset = max<double>(
      MediaQuery.viewInsetsOf(context).bottom - 120,
      0,
    );

    return SheetWidget(
      title: signed ? l10n.signMessageSigned : l10n.signMessage,
      mainWidget: signed
          ? ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              children: [
                AccountAddressWidget(address: signAddress),
                const SizedBox(height: 24),
                SelectableText(details.signature, style: styles.textStyleParagraph),
                const SizedBox(height: 16),
                SelectableText(details.hash, style: styles.textStyleAddressText60),
              ],
            )
          : ListView(
              children: [
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: selectAddress,
                  child: AccountAddressWidget(address: signAddress),
                ),
                const SizedBox(height: 24),
                AppTextField(
                  leftMargin: 40,
                  rightMargin: 40,
                  focusNode: focusNode,
                  controller: controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(kMaxMessageLength),
                  ],
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  autocorrect: false,
                  hintText: l10n.signMessageHint,
                  prefixButton: TextFieldButton(
                    icon: AppIcons.scan,
                    onPressed: scanQrCode,
                  ),
                  suffixButton: TextFieldButton(
                    icon: AppIcons.paste,
                    onPressed: pasteFromClipboard,
                  ),
                  style: styles.textStyleParagraph,
                ),
                SizedBox(height: bottomInset),
              ],
            ),
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            PrimaryButton(
              title: signed ? l10n.signMessageCopySignature : l10n.signMessage,
              onPressed: signed ? copySignature : signMessage,
            ),
            const SizedBox(height: 16),
            PrimaryOutlineButton(
              title: l10n.cancel,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
