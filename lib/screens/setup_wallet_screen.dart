import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../intro/intro_providers.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../wallet/wallet_types.dart';
import '../wallet_address/address_discovery.dart';
import '../wallet_address/discovery_incomplete.dart';
import '../wallet_address/wallet_address.dart';
import 'setup_failed_page.dart';

// Imports stop once 100 addresses in a row have no funds (capped at 2000).
const _importBalanceScanMaxIndex = 2000;
const _importBalanceScanBatchSize = 20;
const _importGapLimit = 300;

class SetupWalletScreen extends HookConsumerWidget {
  const SetupWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final setupFailed = useState(false);
    final setupError = useRef<Object?>(null);

    final message = useState(l10n.walletSetupMessage);
    final details = useState('');
    // The funds search can be skipped (offered after a while); the wallet then
    // opens with a banner offering to scan again later.
    final skipRequested = useRef(false);
    final showSkip = useState(false);

    Future<void> setupWallet() async {
      try {
        setupFailed.value = false;
        final introData = ref.read(introDataProvider);
        ref.read(introDataProvider.notifier).clear();

        final seed = await introData.seed;

        final WalletData walletData;
        if (introData.kpub case final kpub?) {
          final walletKind = WalletKind.localHdSchnorr(viewOnly: true);
          walletData = WalletData.kpub(
            name: introData.name ?? l10n.defaultWalletName,
            kind: walletKind,
            kpub: kpub,
          );
        } else {
          if (seed == null) {
            throw Exception('Missing seed');
          }
          WalletKind walletKind;
          if (introData.isLegacyWallet) {
            final wallet = HdWallet.forSeedHex(seed, type: HdWalletType.legacy);
            final pubKey = wallet.derivePublicKey(typeIndex: 0, index: 0);
            walletKind = WalletKind.localHdLegacy(mainPubKey: pubKey.hex);
          } else {
            walletKind = WalletKind.localHdSchnorr();
          }

          walletData = WalletData.seed(
            name: introData.name ?? l10n.defaultWalletName,
            kind: walletKind,
            seed: seed,
            usesBip39Passphrase: introData.bip39Passphrase.isNotEmpty,
            mnemonic: introData.mnemonic,
            password: introData.password,
          );
        }

        // setup wallet
        final network = ref.read(networkProvider);
        final networkId = ref.read(networkIdProvider);
        final notifier = ref.read(walletBundleProvider.notifier);
        final wallet = await notifier.setupWallet(walletData);
        await notifier.selectWallet(wallet, networkId);

        final auth = ref.read(walletAuthNotifierProvider);
        if (auth == null) throw Exception('No active wallet');
        await auth.checkEncryptedState();
        await auth.unlock(password: introData.password);

        // address discovery
        final client = ref.read(hoosatClientProvider);
        final api = ref.read(HoosatApiServiceProvider);
        final addressGenerator = auth.addressGenerator(network);

        var checkedLine = '';
        var stageLine = '';
        void refreshDetails() => details.value =
            stageLine.isEmpty ? checkedLine : '$checkedLine\n($stageLine)';

        final addressDiscovery = AddressDiscovery(
          client: client,
          api: api,
          addressGenerator: addressGenerator,
          addressNameCallback: (type, index) {
            return type == AddressType.receive
                ? l10n.receiveIndexParam('$index')
                : l10n.changeIndexParam('$index');
          },
          onStage: (stage) {
            stageLine = stage;
            refreshDetails();
          },
        );

        WalletDiscoveryResult discovery;

        if (!introData.generated) {
          message.value = l10n.walletSetupAddressDiscovery;
          // Imported wallets (any network) search the node for funded
          // addresses. The old tx-by-tx scanner needed an explorer, which
          // testnet does not have, and is far slower.
          try {
            final checkedByType = <AddressType, int>{};
            discovery = await addressDiscovery.balanceDiscovery(
              startReceiveIndex: 0,
              startChangeIndex: 0,
              maxIndex: _importBalanceScanMaxIndex,
              batchSize: _importBalanceScanBatchSize,
              gapLimit: _importGapLimit,
              onProgress: (type, index) {
                checkedByType[type] = index;
                final checked =
                    checkedByType.values.fold<int>(0, (a, b) => a + b);
                checkedLine = 'Searching for your funds... '
                    '$checked addresses checked';
                refreshDetails();
                return !skipRequested.value;
              },
            );
          } on DiscoveryCancelled catch (e) {
            // Keep whatever was found before stopping; flag the rest as
            // "not searched yet" so Home offers to finish the scan later.
            discovery =
                e.walletPartial ?? addressDiscovery.newWalletDiscoveryResult;
            await setDiscoveryIncomplete(ref, wallet.wid, true);
          } on DiscoveryFailed catch (e) {
            discovery =
                e.walletPartial ?? addressDiscovery.newWalletDiscoveryResult;
            await setDiscoveryIncomplete(ref, wallet.wid, true);
          }

          if (discovery.receive.addresses.isEmpty) {
            discovery = (
              receive: DiscoveryResult(
                addresses: {0: addressDiscovery.mainAddress},
                txIds: {},
                scanIndexes: discovery.receive.scanIndexes,
              ),
              change: discovery.change,
            );
          }
        } else {
          discovery = addressDiscovery.newWalletDiscoveryResult;
        }

        final walletRepository = ref.read(walletRepositoryProvider);
        await walletRepository.openWalletBoxes(wallet, networkId: networkId);

        final addressBox = ref.read(addressBoxProvider(wallet));

        await addressBox.setAll(Map.fromEntries(
          discovery.addresses.map(
            (address) => MapEntry(address.key, address),
          ),
        ));

        final txCache = ref.read(txCacheServiceProvider(wallet));
        await txCache.addWalletTxIds(discovery.txIds);

        await walletRepository.closeWalletBoxes(wallet, networkId: networkId);

        message.value = l10n.fetchingTransactions;
        details.value = '';

        appRouter.reload(context);
      } catch (e, st) {
        final log = ref.read(loggerProvider);
        log.e('Failed to create wallet', error: e, stackTrace: st);

        setupFailed.value = true;
        setupError.value = e;
      }
    }

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 200), setupWallet);
      final timer = Timer(const Duration(seconds: 15), () {
        showSkip.value = true;
      });
      return timer.cancel;
    }, const []);

    if (setupFailed.value) {
      return SetupFailedPage(
        error: setupError.value,
        onRestart: () => appRouter.reload(context),
      );
    }

    return Scaffold(
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.035,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.4,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset('assets/hoosat.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        message.value,
                        style: styles.textStyleSettingItemHeaderLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        details.value,
                        style: styles.textStyleSettingItemHeader60,
                      ),
                      if (showSkip.value && details.value.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            'Taking a while? You can skip this and scan '
                            'again later from Settings.',
                            textAlign: TextAlign.center,
                            style: styles.textStyleSettingItemHeader60,
                          ),
                        ),
                        TextButton(
                          onPressed: () => skipRequested.value = true,
                          child: Text(
                            'Skip for now',
                            style: styles.textStyleSettingItemHeaderLarge,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 16 + 2 * 55,
            )
          ],
        ),
      ),
    );
  }
}
