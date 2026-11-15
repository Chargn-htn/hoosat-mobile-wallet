import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../wallet_address/account_display_name_provider.dart';
import 'address_widgets.dart';

class AddressCard extends ConsumerWidget {
  final Address address;
  final bool showLabel;
  final AddressTextType type;

  const AddressCard({
    Key? key,
    required this.address,
    this.showLabel = true,
    this.type = AddressTextType.PRIMARY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    // The same name for an address everywhere it is shown: a saved contact's
    // name, else the account name the user gave it, else "Main", and only then
    // the generic automatic name (Receive N). This used to jump to the generic
    // name on the confirm screen, after the Send screen had shown the account's
    // own name.
    final contacts = ref.watch(contactsProvider);
    final accountLabel = ref.watch(accountLabelProvider(address.encoded));
    final mainAddress = ref.watch(mainAddressProvider);
    final mainLabel = l10nOf(context).mainAccountLabel;

    String? label;
    if (showLabel) {
      label = displayLabelFor(
        contactName: contacts
            .getContactWithAddress(address.encoded, includeLabels: true)
            ?.name,
        accountLabel: accountLabel,
        isMain: address.encoded == mainAddress,
        mainLabel: mainLabel,
        genericName:
            ref.read(addressNotifierProvider).nameForAddress(address.encoded),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.backgroundDarkest,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: theme.text10),
      ),
      child: AddressThreeLineText(
        address: address.encoded,
        label: label,
        type: type,
      ),
    );
  }
}
