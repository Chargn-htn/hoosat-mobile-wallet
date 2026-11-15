import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/contacts.dart' as contactsHelper;
import '../widgets/buttons.dart';
import '../widgets/hs_kit.dart';
import '../widgets/sheet_util.dart';
import 'contact_add_sheet.dart';
import 'contact_list_widget.dart';

class ContactsWidget extends ConsumerWidget {
  final VoidCallback onBackAction;

  const ContactsWidget({
    Key? key,
    required this.onBackAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    Future<void> importContacts() =>
        contactsHelper.importContacts(ref, context);

    Future<void> exportContacts() =>
        contactsHelper.exportContacts(ref, context);

    void addContact() {
      Sheets.showAppHeightNineSheet(
        context: context,
        widget: const ContactAddSheet(),
        theme: theme,
      );
    }

    return HsSubPage(
      title: l10n.contactsHeader,
      onBack: onBackAction,
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        HsCircleButton(
          icon: AppIcons.import_icon,
          tooltip: l10n.import,
          onPressed: importContacts,
        ),
        const SizedBox(width: 10),
        HsCircleButton(
          icon: AppIcons.export_icon,
          tooltip: l10n.export,
          onPressed: exportContacts,
        ),
      ]),
      child: const ContactListWidget(),
      bottom: Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 20),
        child: PrimaryButton(
          title: l10n.addContact,
          onPressed: addContact,
        ),
      ),
    );
  }
}
