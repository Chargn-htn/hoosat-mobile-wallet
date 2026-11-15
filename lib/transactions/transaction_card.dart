import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../hoosat/hoosat.dart';
import '../l10n/l10n.dart';
import '../util/numberutil.dart';
import '../widgets/sheet_util.dart';
import 'transaction_details_sheet.dart';
import 'transaction_state_tag.dart';
import 'transaction_types.dart';
import 'tx_address_widget.dart';
import 'tx_note_widget.dart';

class TransactionCard extends ConsumerWidget {
  final TxItem item;

  const TransactionCard({super.key, required this.item});

  Tx get tx => item.tx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider.notifier);
    final note = ref.watch(txNoteProvider(tx.id));
    final kasSymbol = ref.watch(kasSymbolProvider);

    final output = tx.apiTx.outputs[item.outputIndex];

    final amountRaw = output.amount;
    final amount = Amount.raw(BigInt.from(amountRaw));

    final formatedValue = NumberUtil.formatedAmount(amount);

    final contacts = ref.watch(contactsProvider);
    final address = output.scriptPublicKeyAddress;
    final contact = contacts.getContactWithAddress(
      address,
      includeLabels: true,
    );
    final isContact = contact != null;
    final isThisWallet = addressNotifier.containsAddress(address);
    final isSendType = item.type == TxItemType.send;

    final txDate = DateTime.fromMillisecondsSinceEpoch(tx.apiTx.blockTime);

    final locale = Localizations.localeOf(context).languageCode;
    final formater = DateFormat('dd-MM-yyyy HH:mm', locale);
    final date = formater.format(txDate);

    void showTxDetails() {
      Sheets.showAppHeightNineSheet(
        context: context,
        widget: TransactionDetailsSheet(
          transactionId: tx.id,
          address: address,
          displayContactButton: !isContact,
          txItem: item,
        ),
        theme: theme,
        animationDurationMs: 175,
      );
    }

    final tileIcon = switch (item.type) {
      TxItemType.send => AppIcons.sent,
      TxItemType.receive => AppIcons.received,
      TxItemType.thisWallet => Icons.swap_vert,
      TxItemType.compound => Icons.call_merge,
    };
    final title = switch (item.type) {
      TxItemType.send => l10n.txTypeSent,
      TxItemType.receive => l10n.txTypeReceived,
      TxItemType.thisWallet => l10n.txTypeThisWallet,
      TxItemType.compound => l10n.txTypeMerged,
    };
    final sign = switch (item.type) {
      TxItemType.send => '\u2212',
      TxItemType.receive => '+',
      _ => '',
    };
    // A payment the explorer says was never accepted is not income: grey.
    final notAccepted = ref.watch(txNotAcceptedProvider(item.tx.id));
    final amountColor = notAccepted
        ? theme.text60
        : item.type == TxItemType.receive
            ? theme.primary
            : theme.text;
    final who = isContact
        ? contact.name
        : (isThisWallet && isSendType ? l10n.thisWallet : null);

    // Keep the row's layout steady whatever the phone's font-size setting is.
    final mq = MediaQuery.of(context);
    return MediaQuery(
      data: mq.copyWith(
        textScaler: mq.textScaler.clamp(minScaleFactor: 0.9, maxScaleFactor: 1.1),
      ),
      child: Container(
      margin: const EdgeInsetsDirectional.fromSTEB(22, 5, 22, 5),
      decoration: BoxDecoration(
        color: theme.backgroundDark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.text10),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: showTxDetails,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.primary15,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(tileIcon, size: 20, color: theme.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: theme.text,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '$sign$formatedValue $kasSymbol',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: amountColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.pending ? l10n.txPending : date,
                      style: TextStyle(fontSize: 12, color: theme.text60),
                    ),
                    const SizedBox(height: 8),
                    Consumer(builder: (context, ref, _) {
                      final txState =
                          ref.watch(txConfirmationStatusProvider(item));
                      return Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TransactionStateTag(
                          state: txState,
                          txItem: item,
                        ),
                      );
                    }),
                    if (who != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        who,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: theme.text,
                        ),
                      ),
                    ],
                    const SizedBox(height: 4),
                    TxAddressWidget(address: address),
                    if (note != null) ...[
                      const SizedBox(height: 4),
                      TxNoteWidget(note: note.note),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
