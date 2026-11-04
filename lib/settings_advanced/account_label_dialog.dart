import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/wallet_accounts.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/app_text_field.dart';

/// Shows a dialog asking for an account label, returns the trimmed label
/// the user entered or null if they cancelled. [initialValue] pre-fills
/// the field for a rename; leave it empty for "add a new account."
Future<String?> showAccountLabelDialog(
  BuildContext context, {
  String initialValue = '',
}) {
  return showAppDialog<String>(
    context: context,
    builder: (_) => AccountLabelDialog(initialValue: initialValue),
  );
}

class AccountLabelDialog extends HookConsumerWidget {
  final String initialValue;

  const AccountLabelDialog({super.key, this.initialValue = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final isRename = initialValue.isNotEmpty;
    final controller = useTextEditingController(text: initialValue);
    final focusNode = useFocusNode();

    void submit() {
      final value = controller.text.trim();
      if (value.isEmpty) return;
      appRouter.pop(context, withResult: value);
    }

    return AppAlertDialog(
      title: Text(
        isRename ? l10n.renameAccount : l10n.addAccount,
        style: styles.textStyleDialogHeader,
      ),
      content: AppTextField(
        controller: controller,
        focusNode: focusNode,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        hintText: l10n.accountLabelHint,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxAccountLabelLength),
        ],
        style: styles.textStyleAppTextField,
        onSubmitted: (_) => submit(),
      ),
      actions: [
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: () => appRouter.pop(context),
          child: Text(
            l10n.closeUppercased,
            style: styles.textStyleDialogOptions,
          ),
        ),
        TextButton(
          style: styles.dialogButtonStyle,
          onPressed: submit,
          child: Text(
            isRename ? l10n.saveUppercased : l10n.addUppercased,
            style: styles.textStyleDialogOptions,
          ),
        ),
      ],
      contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    );
  }
}
