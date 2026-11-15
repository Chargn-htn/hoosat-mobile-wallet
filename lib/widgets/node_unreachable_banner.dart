import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../node_status/connection_status.dart';

/// Shows a persistent, explained banner above [child] whenever
/// [networkErrorProvider] is true -- the only other place that state was
/// surfaced before this was a silent gear-to-warning icon swap, which gave
/// no indication of what was wrong or how to fix it.
class NodeUnreachableBanner extends ConsumerWidget {
  final Widget child;

  const NodeUnreachableBanner({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final status = ref.watch(connectionStatusProvider);
    final unreachable = status != ConnectionStatus.live;

    void retry() {
      ref.read(hapticUtilProvider).error();
      ref.read(connectionStatusProvider.notifier).retryNow();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (unreachable)
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 4),
            child: Material(
              color: theme.backgroundDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: theme.text15),
              ),
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onTap: retry,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                  child: Row(
                    children: [
                      Icon(AppIcons.warning, color: theme.primary, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          status == ConnectionStatus.reconnecting
                              ? 'Live updates stopped. Reconnecting...'
                              : l10n.nodeUnreachable,
                          style: TextStyle(
                            fontSize: 13.5,
                            height: 1.35,
                            fontWeight: FontWeight.w600,
                            color: theme.text,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: theme.primary15,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          l10n.nodeUnreachableRetry,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: theme.primary,
                          ),
                        ),
                      ),
                      // keep clear of the TESTNET corner ribbon
                      if (ref.watch(networkIdProvider) != 'mainnet')
                        const SizedBox(width: 34),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}
