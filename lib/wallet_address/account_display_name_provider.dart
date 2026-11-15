import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/wallet_accounts/wallet_accounts_providers.dart';

/// Returns the user's custom account label (set from the Accounts screen)
/// for [encodedAddress], or null if that address isn't a named account
/// (either it's the Main address -- check separately -- or just an
/// unnamed "Receive N" / "Change N" address).
///
/// Used everywhere an address's name is shown -- the From/Receive address
/// picker, the Receive screen header, and address details -- so a given
/// address is never called two different things in different parts of the
/// app (that mismatch previously caused a real accidental transfer: a user
/// picked "Receive 2" as a Send source without realizing it was the same
/// address as their named "test20" account).
final accountLabelProvider = Provider.family<String?, String>(
  (ref, encodedAddress) {
    final active = ref.watch(activeAdditionalAccountsProvider);
    final archived = ref.watch(archivedAdditionalAccountsProvider);
    final matching = [...active, ...archived]
        .where((a) => a.address == encodedAddress)
        .firstOrNull;
    return matching?.label;
  },
);

/// Full display-name resolution: the caller supplies [mainLabel] (from
/// l10n, since providers can't reach BuildContext) and [fallbackName] (the
/// generic auto-generated name to use if this isn't Main and isn't a
/// named account).
String resolveAccountDisplayName({
  required WidgetRef ref,
  required String encodedAddress,
  required String mainAddress,
  required String mainLabel,
  required String fallbackName,
}) {
  final isMain = encodedAddress == mainAddress;
  // The same single rule as everywhere else (displayLabelFor), so the two can
  // never disagree about what an address is called.
  return displayLabelFor(
        accountLabel:
            isMain ? null : ref.watch(accountLabelProvider(encodedAddress)),
        isMain: isMain,
        mainLabel: mainLabel,
        genericName: fallbackName,
      ) ??
      fallbackName;
}


/// The one rule for what an address is called wherever it is shown (Send
/// screen, confirm screen, sent screen, ...): a saved contact's name, else the
/// name the user gave the account, else "Main", and only then the generic
/// automatic name (Receive N).
String? displayLabelFor({
  String? contactName,
  String? accountLabel,
  required bool isMain,
  required String mainLabel,
  String? genericName,
}) {
  if (contactName != null) return contactName;
  if (accountLabel != null) return accountLabel;
  if (isMain) return mainLabel;
  return genericName;
}
