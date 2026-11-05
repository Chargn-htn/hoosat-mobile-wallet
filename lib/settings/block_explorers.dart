import 'package:freezed_annotation/freezed_annotation.dart';

import '../hoosat/hoosat.dart';

part 'block_explorers.freezed.dart';
part 'block_explorers.g.dart';

const kParamPattern = '{0}';

@freezed
class BlockExplorer with _$BlockExplorer {
  const BlockExplorer._();
  const factory BlockExplorer({
    required HoosatNetwork network,
    required String name,
    required String url,
    required String addressUrl,
    required String txUrl,
  }) = _BlockExplorer;

  String urlForAddress(String address) =>
      addressUrl.replaceFirst(kParamPattern, address);

  String urlForTx(String hash) => txUrl.replaceFirst(kParamPattern, hash);

  factory BlockExplorer.fromJson(Map<String, dynamic> json) =>
      _$BlockExplorerFromJson(json);
}

// explorer.hoosat.fi and explorer-testnet.hoosat.fi were Tonto's domains,
// dead/hijacked since he left the project. explorer-nz.hoosat.network is
// the current, real replacement (confirmed /addresses/:addr and /txs/:id
// routes match exactly, see htn-explorer's App.js). No real testnet
// explorer exists anywhere in our infra -- kHoosatExplorerTestnet is kept
// only as a typed default value (block_explorer_settings.dart needs one),
// never shown as a pickable option below, so no dead link is exposed.
const kHoosatExplorerMainnet = BlockExplorer(
  network: HoosatNetwork.mainnet,
  name: 'Hoosat Explorer',
  url: 'explorer-nz.hoosat.network',
  addressUrl: 'https://explorer-nz.hoosat.network/addresses/$kParamPattern',
  txUrl: 'https://explorer-nz.hoosat.network/txs/$kParamPattern',
);

const kHoosatExplorerEU = BlockExplorer(
  network: HoosatNetwork.mainnet,
  name: 'Hoosat Explorer (EU)',
  url: 'explorer-eu.hoosat.network',
  addressUrl: 'https://explorer-eu.hoosat.network/addresses/$kParamPattern',
  txUrl: 'https://explorer-eu.hoosat.network/txs/$kParamPattern',
);

const kHoosatExplorerTestnet = BlockExplorer(
  network: HoosatNetwork.testnet,
  name: 'Hoosat Explorer',
  url: 'explorer-nz.hoosat.network',
  addressUrl: 'https://explorer-nz.hoosat.network/addresses/$kParamPattern',
  txUrl: 'https://explorer-nz.hoosat.network/txs/$kParamPattern',
);

const kBlockExplorersOptions = <String, List<BlockExplorer>>{
  kHoosatNetworkIdMainnet: [
    kHoosatExplorerMainnet,
    kHoosatExplorerEU,
  ],
  // No real testnet explorer exists in our infra -- an empty list hides
  // the option entirely instead of exposing a dead link.
  kHoosatNetworkIdTestnet: [],
  kHoosatNetworkIdDevnet: [],
  kHoosatNetworkIdSimnet: [],
};
