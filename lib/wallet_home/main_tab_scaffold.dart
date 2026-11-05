import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../settings_advanced/accounts_screen.dart';
import '../settings_drawer/settings_drawer.dart';
import '../transactions/transactions_widget.dart';
import 'home_tab_content.dart';
import 'main_tab_bar.dart';
import 'main_tab_provider.dart';
import 'wallet_background_tasks.dart';

/// Root content for the main screen: whichever of the 4 tabs (Mock4
/// design) is selected, plus the floating pill tab bar underneath.
///
/// Accounts, Activity, and Settings all reuse screens/widgets that
/// already exist (built as a sheet/drawer originally) rather than
/// duplicating them -- only Home gets genuinely new Mock4 content.
class MainTabScaffold extends ConsumerWidget {
  const MainTabScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final tab = ref.watch(mainTabProvider);

    final content = switch (tab) {
      MainTab.home => const HomeTabContent(),
      MainTab.accounts => const AccountsScreen(),
      MainTab.activity => const _ActivityTab(),
      MainTab.settings => const SettingsSheet(),
    };

    return Column(
      children: [
        // Invisible; runs regardless of which tab is showing.
        const WalletBackgroundTasks(),
        Expanded(
          child: Container(color: theme.background, child: content),
        ),
        const MainTabBar(),
      ],
    );
  }
}

class _ActivityTab extends StatelessWidget {
  const _ActivityTab();

  @override
  Widget build(BuildContext context) {
    // TransactionsWidget already manages its own scrolling internally
    // (AutomaticAnimatedList/LazyLoadScrollView); wrapping it in another
    // SingleChildScrollView gives its inner ListViews unbounded height,
    // which overflows whenever the empty state (TransactionEmptyList,
    // itself a ListView) renders -- only visible once an Activity-tab
    // fetch can actually complete without throwing first, see
    // htn_phone_wallet_roadmap.md.
    return const TransactionsWidget();
  }
}
