import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import 'transaction_types.dart';
import 'tx_status.dart';

class TransactionStateTag extends ConsumerWidget {
  final TxState state;
  final TxItem txItem;

  const TransactionStateTag({
    Key? key,
    required this.state,
    required this.txItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 4, 10, 4),
      decoration: BoxDecoration(
        color: theme.text05,
        borderRadius: BorderRadius.circular(999),
      ),
      child: state.when(
        unknown: () => Text(
          l10n.unknown,
          style: styles.tagText,
        ),
        pending: () => Text(
          l10n.txInMempool,
          style: styles.tagText,
        ),
        unconfirmed: () => Text(
          // Our data is stale after a long time; say that, not "waiting". If
          // the explorer confirmed it was never accepted, say exactly that.
          isStaleRecord(txItem.tx.apiTx.blockTime)
              ? (ref.watch(txNotAcceptedProvider(txItem.tx.id))
                  ? l10n.txTagNotAccepted
                  : l10n.txTagStatusUnknown)
              : l10n.txTagWaiting,
          style: styles.tagText,
        ),
        confirming: (confirmations) {
          final target = ref.watch(txConfirmTargetProvider(txItem));
          // Coins arriving in this wallet: ONE count up to the 1000 the
          // network needs before they can be spent.
          if (target > BigInt.from(100)) {
            return Text(
              l10n.txTagConfirmingOf(confirmations.toString(), target.toString()),
              style: styles.tagText,
            );
          }
          if (confirmations < BigInt.two) {
            return Text(
              l10n.accepted,
              style: styles.tagText,
            );
          }
          return Text(
            l10n.confirmations(confirmations.toString()),
            style: styles.tagText,
          );
        },
        confirmed: () => Text(
          l10n.confirmed,
          style: styles.tagText,
        ),
      ),
    );
  }
}
