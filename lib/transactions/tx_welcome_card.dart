import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/l10n.dart';
import '../widgets/hs_kit.dart';

/// Shown in Home and Activity while the wallet has no transactions yet.
class TxWelcomeCard extends ConsumerWidget {
  const TxWelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);
    return HsEmptyState(
      icon: Icons.history,
      title: l10n.noActivityTitle,
      message: l10n.noActivityMessage,
    );
  }
}
