import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../receive/receive_sheet.dart';
import '../send_sheet/send_sheet.dart';
import '../settings/available_themes.dart';
import '../settings/wallet_accounts.dart';
import '../settings_advanced/compound_utxos_dialog.dart';
import '../util/numberutil.dart';
import '../transactions/transactions_widget.dart';
import '../util/ui_util.dart';
import '../util/user_data_util.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/hs_icon.dart';
import '../widgets/sheet_util.dart';
import 'main_tab_provider.dart';
import 'wallet_logo.dart';
import '../node_status/node_status_dot.dart';

// Rotating greeting messages (2026-11 redesign), picked at random on open and
// whenever the logo is tapped.
const _greetingMessages = [
  'Your wallet is looking good',
  'Every sat adds up',
  'Stacking nicely today',
  'Welcome back',
  'Good things come to those who HODL',
  'Your HTN is working for you',
  'Nice to see you again',
  "Keep going, you're doing great",
  'Small moves, big compounding',
  'The DAG never sleeps',
  "You're earlier than most",
  'Patience pays in crypto',
  'Your future self says thanks',
  'Mining never stops for you',
  'Another day, another block',
  'Feels good to check in',
  'Your balance is quietly growing',
  'Welcome to your wallet',
  'Onward and upward',
  'You showed up today',
  'Building something real',
  'Steady hands win',
  'Your portfolio says hi',
  'Proud of your progress',
  'Keep stacking those sats',
  'Good decisions compound',
  "You're part of something early",
  'Here for the long haul',
];

class HomeTabContent extends HookConsumerWidget {
  const HomeTabContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final wallet = ref.watch(walletProvider);
    final addressNotifier = ref.watch(addressNotifierProvider);
    final mainAddress = addressNotifier.defaultReceiveAddress;
    final activeAccounts = ref.watch(activeAdditionalAccountsProvider);
    final kasSymbol = ref.watch(kasSymbolProvider);
    final totalBalance = ref.watch(formatedTotalBalanceProvider);
    final totalFiat = ref.watch(formatedTotalFiatProvider);
    // Every number on this screen comes from the same saved balances, so
    // they always add up: Total = Main + the accounts below it.
    final mainBalance = NumberUtil.formatedAmount(ref.watch(mainBalanceProvider));
    String cardBalance(String address) => ref.watch(formatedBalanceForAddressProvider(address));

    final maturing = ref.watch(maturingAmountProvider);
    final spendableText =
        NumberUtil.formatedAmount(ref.watch(spendableNowProvider));
    final maturingText = NumberUtil.formatedAmount(maturing);
    final readyIn = ref.watch(nextCoinsReadyProvider);

    final random = useMemoized(() => Random());
    final message = useState(
      _greetingMessages[random.nextInt(_greetingMessages.length)],
    );
    final spinController = useAnimationController(
      duration: const Duration(milliseconds: 700),
    );

    void tapLogo() {
      if (spinController.isAnimating) return;
      String next;
      do {
        next = _greetingMessages[random.nextInt(_greetingMessages.length)];
      } while (_greetingMessages.length > 1 && next == message.value);
      message.value = next;
      spinController.forward(from: 0);
    }

    void toggleTheme() {
      final current = ref.read(themeSettingProvider);
      final next = current.theme == ThemeOptions.KASPIUM_DARK
          ? ThemeOptions.KASPIUM_LIGHT
          : ThemeOptions.KASPIUM_DARK;
      ref.read(themeSettingProvider.notifier).updateTheme(ThemeSetting(next));
    }

    Future<void> onReceive() async {
      Sheets.showAppHeightNineSheet(
        context: context,
        widget: const ReceiveSheet(),
        theme: theme,
      );
    }

    Future<void> onSend() async {
      final (:cont, :rbf) = await UIUtil.checkForPendingTx(context, ref: ref);
      if (cont) {
        Sheets.showAppHeightNineSheet(
          context: context,
          widget: SendSheet(rbf: rbf),
          theme: theme,
        );
      }
    }

    Future<void> onScan() async {
      final barcode = await UserDataUtil.scanQrCode(context);
      final qrData = barcode?.code;
      if (qrData == null) return;

      final prefix = ref.read(addressPrefixProvider);
      final uri = HoosatUri.tryParse(qrData, prefix: prefix);
      if (uri == null) {
        if (context.mounted) {
          UIUtil.showSnackbar(l10n.qrInvalidAddress, context);
        }
        return;
      }
      if (context.mounted) {
        await UIUtil.showSendFlow(context, ref: ref, uri: uri);
      }
    }

    Future<void> onCompound() async {
      final (:cont, :rbf) = await UIUtil.checkForPendingTx(context, ref: ref);
      if (cont) {
        showAppDialog(
          context: context,
          builder: (_) => CompoundUtxosDialog(rbf: rbf),
        );
      }
    }

    void goToTab(MainTab tab) => ref.read(mainTabProvider.notifier).state = tab;

    Widget quickAction({
      required HsIcon icon,
      required String label,
      required VoidCallback onPressed,
    }) {
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onPressed,
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.backgroundDark,
                  border: Border.all(color: theme.text10),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: HsIconWidget(icon: icon, color: theme.text),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: theme.text60,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget accountRow(String label, String address, String balance) {
      final truncated = address.length > 20
          ? '${address.substring(0, 10)}…${address.substring(address.length - 6)}'
          : address;
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: theme.backgroundDark,
          border: Border.all(color: theme.text10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: theme.backgroundDark,
                border: Border.all(color: theme.text10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                Icons.account_balance_wallet_outlined,
                size: 17,
                color: theme.text,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          label,
                          style: styles.textStyleSettingItemHeader,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: theme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Text(truncated, style: styles.textStyleSettingItemSubheader),
                ],
              ),
            ),
            Text(balance, style: styles.textStyleSettingItemHeader),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 10, 22, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      WalletLogo(
                        onTap: tapLogo,
                        spinController: spinController,
                        accent: theme.primary,
                        child: Image.asset(
                          'assets/hoosat_transparent_180.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.homeGreeting(wallet.name),
                              style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w800,
                                color: theme.text,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              message.value,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: theme.text60,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const NodeStatusDot(),
                    Tooltip(
                      message: l10n.toggleTheme,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: toggleTheme,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: theme.backgroundDark,
                            border: Border.all(color: theme.text10),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: theme.isLightTheme ? 1 : 0,
                                child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 400),
                                  turns: theme.isLightTheme ? 0 : -0.25,
                                  child: HsIconWidget(
                                    icon: HsIcon.sun,
                                    color: theme.text,
                                    size: 16,
                                  ),
                                ),
                              ),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: theme.isLightTheme ? 0 : 1,
                                child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 400),
                                  turns: theme.isLightTheme ? 0.25 : 0,
                                  child: HsIconWidget(
                                    icon: HsIcon.moon,
                                    color: theme.text,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Tooltip(
                      message: l10n.settingsHeader,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () => goToTab(MainTab.settings),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: theme.backgroundDark,
                            border: Border.all(color: theme.text10),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: HsIconWidget(
                              icon: HsIcon.settings,
                              color: theme.text,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Balance hero
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.totalBalance,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: theme.text60,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      totalBalance,
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: theme.text,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      kasSymbol,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: theme.text60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                if (totalFiat.isNotEmpty)
                Text(
                  '≈ $totalFiat',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: theme.text60,
                  ),
                ),
                if (maturing.raw > BigInt.zero) ...[
                  const SizedBox(height: 6),
                  Text(
                    l10n.homeSpendableNow(spendableText, maturingText, kasSymbol),
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: theme.primary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    readyIn == null
                        ? l10n.homeArrivingSoon
                        : l10n.homeArrivingReadyIn(readyIn),
                    style: TextStyle(fontSize: 11.5, color: theme.text60),
                  ),
                ],
              ],
            ),
          ),

          // Quick actions
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
            child: Row(
              children: [
                quickAction(
                  icon: HsIcon.send,
                  label: l10n.send,
                  onPressed: onSend,
                ),
                const SizedBox(width: 9),
                quickAction(
                  icon: HsIcon.receive,
                  label: l10n.receive,
                  onPressed: onReceive,
                ),
                const SizedBox(width: 9),
                quickAction(
                  icon: HsIcon.scan,
                  label: l10n.scanQrCode,
                  onPressed: onScan,
                ),
                const SizedBox(width: 9),
                quickAction(
                  icon: HsIcon.compound,
                  label: l10n.compoundUtxos,
                  onPressed: onCompound,
                ),
              ],
            ),
          ),

          // Accounts preview
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 26, 22, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.manageAccounts,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: theme.text,
                  ),
                ),
                InkWell(
                  onTap: () => goToTab(MainTab.accounts),
                  child: Text(
                    l10n.seeAll,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: theme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
            child: Column(
              children: [
                accountRow(
                  l10n.mainAccountLabel,
                  mainAddress.encoded,
                  '$mainBalance $kasSymbol',
                ),
                for (final account in activeAccounts.take(2))
                  accountRow(
                    account.label,
                    account.address,
                    '${cardBalance(account.address)} $kasSymbol',
                  ),
                // The card lists Main and two accounts; say so when there are
                // more, so the numbers shown are not mistaken for the whole.
                if (activeAccounts.length > 2)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      '+ ${activeAccounts.length - 2} more in Accounts',
                      style: TextStyle(fontSize: 12, color: theme.text60),
                    ),
                  ),
              ],
            ),
          ),

          // Recent activity preview -- reuses the real transaction list
          // widget itself (not a simplified reimplementation), just
          // height-constrained, so the categorization logic (compound
          // detection etc.) stays exactly correct.
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 14, 22, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.activity,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: theme.text,
                  ),
                ),
                InkWell(
                  onTap: () => goToTab(MainTab.activity),
                  child: Text(
                    l10n.seeAll,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: theme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 260,
            child: const TransactionsWidget(),
          ),
        ],
      ),
    );
  }
}
