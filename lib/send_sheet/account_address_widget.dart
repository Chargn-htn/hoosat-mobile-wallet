import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../wallet_address/account_display_name_provider.dart';
import '../wallet_address/wallet_address.dart';
import '../widgets/address_widgets.dart';

class AccountAddressWidget extends ConsumerWidget {
  final WalletAddress address;

  const AccountAddressWidget({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);
    final accounts = ref.watch(addressNotifierProvider);

    final displayName = resolveAccountDisplayName(
      ref: ref,
      encodedAddress: address.encoded,
      mainAddress: accounts.defaultReceiveAddress.encoded,
      mainLabel: l10n.mainAccountLabel,
      fallbackName: address.name,
    );

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(text: displayName, style: styles.textStyleAccount),
          ),
        ),
        // Address Text
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: AddressAdaptiveText(
            address: address.encoded,
            type: AddressTextType.PRIMARY60,
          ),
        ),
      ],
    );
  }
}
