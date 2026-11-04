import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../settings_advanced/accounts_screen.dart';
import '../settings_drawer/settings_drawer.dart';
import '../transactions/transactions_widget.dart';
import '../wallet_home/wallet_home.dart';
import 'main_tab_bar.dart';
import 'main_tab_provider.dart';

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
      MainTab.home => const WalletHome(),
      MainTab.accounts => const AccountsScreen(),
      MainTab.activity => const _ActivityTab(),
      MainTab.settings => const SettingsSheet(),
    };

    return Column(
      children: [
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
    return const SingleChildScrollView(child: TransactionsWidget());
  }
}
