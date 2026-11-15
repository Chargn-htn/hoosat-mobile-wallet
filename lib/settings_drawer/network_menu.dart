import 'package:flutter/material.dart';
import '../widgets/hs_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../node_settings/node_setting.dart';
import '../node_settings/nodes_sheet.dart';
import '../settings/block_explorer_setting.dart';
import '../settings/block_explorers.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/sheet_util.dart';
import 'double_line_item.dart';

class NetworkMenu extends ConsumerWidget {
  final VoidCallback onBackAction;
  const NetworkMenu({
    Key? key,
    required this.onBackAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final viteNodeConfig = ref.watch(hoosatNodeConfigProvider);

    return HsSubPage(
      title: l10n.networkHeader,
      onBack: onBackAction,
      child: HsMenuList(children: [
                      HsSectionLabel(l10n.preferences),
                      Divider(height: 2, color: theme.text15),
                      DoubleLineItem(
                        heading: l10n.nodeAddress,
                        defaultMethod: NodeSetting(viteNodeConfig.config),
                        icon: Icons.settings_ethernet,
                        onPressed: () {
                          _changeViteNode(context, ref);
                        },
                      ),
                      Divider(height: 2, color: theme.text15),
                      Consumer(builder: (context, ref, _) {
                        final blockExplorer = ref.watch(blockExplorerProvider);
                        return DoubleLineItem(
                          heading: l10n.blockExplorer,
                          defaultMethod: BlockExplorerSetting(blockExplorer),
                          icon: AppIcons.search,
                          onPressed: () {
                            _explorerDialog(context, ref);
                          },
                        );
                      }),
                    ]),
    );
  }

  void _changeViteNode(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeProvider);
    Sheets.showAppHeightNineSheet(
      context: context,
      theme: theme,
      widget: const ViteNodesSheet(),
    );
  }

  Future<void> _explorerDialog(BuildContext context, WidgetRef ref) async {
    BlockExplorer? selection = await showAppDialog<BlockExplorer>(
        context: context,
        builder: (context) {
          return AppSimpleDialog(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                l10nOf(context).blockExplorer,
                style: ref.read(stylesProvider).textStyleDialogHeader,
              ),
            ),
            children: _buildExplorerOptions(context, ref),
          );
        });
    if (selection != null) {
      final notifier = ref.read(blockExplorerSettingsProvider.notifier);
      final networkId = ref.read(networkIdProvider);

      notifier.updateBlockExplorer(selection, networkId: networkId);
    }
  }

  List<Widget> _buildExplorerOptions(BuildContext context, WidgetRef ref) {
    final networkId = ref.read(networkIdProvider);
    final options = kBlockExplorersOptions[networkId] ?? [];
    return options.map((value) {
      final styles = ref.read(stylesProvider);
      return SimpleDialogOption(
        onPressed: () => appRouter.pop(context, withResult: value),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value.name, style: styles.textStyleDialogOptions),
              Text(value.url, style: styles.addressText),
            ],
          ),
        ),
      );
    }).toList();
  }
}
