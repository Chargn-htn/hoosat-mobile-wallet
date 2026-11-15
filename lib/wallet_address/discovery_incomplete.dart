import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core_providers.dart';
import '../wallet/wallet_providers.dart';

/// Per wallet AND network: a wallet used on mainnet and on testnet must not
/// show (or clear) the other network's notice.
String _key(String wid, String networkId) =>
    'discovery_incomplete.$wid.$networkId';

/// True when the funds search for the selected wallet did not finish (skipped,
/// cancelled, or the node stopped answering), so some balances may be missing
/// until the user scans again. Persisted per wallet and network.
final discoveryIncompleteProvider = StateProvider<bool>((ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  final wallet = ref.watch(selectedWalletProvider);
  if (wallet == null) return false;
  final networkId = ref.watch(networkIdProvider);
  return prefs.getBool(_key(wallet.wid, networkId)) ?? false;
});

Future<void> setDiscoveryIncomplete(
  WidgetRef ref,
  String wid,
  bool incomplete,
) async {
  final prefs = ref.read(sharedPrefsProvider);
  final key = _key(wid, ref.read(networkIdProvider));
  if (incomplete) {
    await prefs.setBool(key, true);
  } else {
    await prefs.remove(key);
  }
  ref.invalidate(discoveryIncompleteProvider);
}
