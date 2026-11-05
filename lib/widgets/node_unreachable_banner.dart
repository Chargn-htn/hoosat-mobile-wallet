import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../core/core_providers.dart';
import '../l10n/l10n.dart';

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
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final unreachable = ref.watch(networkErrorProvider);

    void retry() {
      ref.read(hapticUtilProvider).error();
      ref.invalidate(hoosatClientProvider);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (unreachable)
          Material(
            color: theme.backgroundDark,
            child: InkWell(
              onTap: retry,
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
                        l10n.nodeUnreachable,
                        style: styles.textStyleParagraphThinPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.nodeUnreachableRetry,
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
