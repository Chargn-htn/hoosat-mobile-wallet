import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import 'main_tab_provider.dart';

/// Floating pill tab bar from the Mock4 design: Home/Accounts/Activity/
/// Settings, with an animated sliding highlight behind the selected tab.
class MainTabBar extends ConsumerWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final selected = ref.watch(mainTabProvider);
    final tabs = MainTab.values;
    final index = tabs.indexOf(selected);

    String labelFor(MainTab tab) => switch (tab) {
          MainTab.home => l10n.home,
          MainTab.accounts => l10n.manageAccounts,
          MainTab.activity => l10n.activity,
          MainTab.settings => l10n.settingsHeader,
        };

    IconData iconFor(MainTab tab) => switch (tab) {
          MainTab.home => Icons.home_outlined,
          MainTab.accounts => Icons.account_balance_wallet_outlined,
          MainTab.activity => Icons.history,
          MainTab.settings => Icons.settings_outlined,
        };

    return Padding(
      padding: EdgeInsets.fromLTRB(
        22,
        0,
        22,
        14 + MediaQuery.of(context).padding.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: theme.backgroundDark,
          border: Border.all(color: theme.text10),
          borderRadius: BorderRadius.circular(26),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final tabWidth = constraints.maxWidth / tabs.length;
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  left: tabWidth * index,
                  top: 0,
                  width: tabWidth,
                  height: 48,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: theme.primary15,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (final tab in tabs)
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () =>
                              ref.read(mainTabProvider.notifier).state = tab,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  iconFor(tab),
                                  size: 18,
                                  color: tab == selected
                                      ? theme.primary
                                      : theme.text60,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  labelFor(tab),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: tab == selected
                                        ? theme.primary
                                        : theme.text60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
