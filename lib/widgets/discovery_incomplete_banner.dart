import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../settings_advanced/address_discovery_dialog.dart';
import '../wallet_address/discovery_incomplete.dart';
import 'app_simpledialog.dart';

/// Shown above [child] when the funds search for this wallet did not finish,
/// with a tap to run it again. Cleared when a scan completes.
class DiscoveryIncompleteBanner extends ConsumerWidget {
  final Widget child;

  const DiscoveryIncompleteBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final incomplete = ref.watch(discoveryIncompleteProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (incomplete)
          Material(
            color: theme.backgroundDark,
            child: InkWell(
              onTap: () => showAppDialog(
                context: context,
                builder: (_) => const AddressDiscoveryDialog(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Icon(AppIcons.warning, color: theme.primary, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'The search for your funds did not finish. Some '
                        'balances may be missing.',
                        style: styles.textStyleParagraphThinPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Scan now',
                      style: styles.textStyleParagraphThinPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}
