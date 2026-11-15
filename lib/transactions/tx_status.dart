import '../hoosat/hoosat_api/types.dart';
import 'transaction_types.dart';

/// ONE forward-only timeline for a transaction's label:
///   pending (waiting list)  ->  unconfirmed (in a block, not accepted yet)
///   ->  confirming N        ->  confirmed
///
/// [confirmations] come from the node's own "accepted" message when we have
/// it. If we missed that message, the wallet's coin list is a second witness:
/// the node only lists coins from accepted transactions, so a coin's age
/// ([coinAge]) is the same count.
///
/// [target] is how many confirmations count as done: 1000 for a transaction
/// that pays this wallet (those coins cannot be spent before that), 100 for
/// one that only pays someone else.
///
/// [coinStillMaturing]: the coin list still says the coin is under the
/// network's 1000-unit spend age -- so we never say "confirmed" early.
TxState decideTxState({
  required bool accepted,
  int? acceptingBlockBlueScore,
  required BigInt blueScore,
  BigInt? coinAge,
  required BigInt target,
  required bool coinStillMaturing,
}) {
  BigInt? confirmations;
  if (accepted && acceptingBlockBlueScore != null) {
    confirmations = blueScore - BigInt.from(acceptingBlockBlueScore);
  } else if (coinAge != null) {
    confirmations = coinAge;
  }
  if (confirmations == null) return const TxState.unconfirmed();
  if (confirmations < BigInt.zero) confirmations = BigInt.zero;

  if (confirmations >= target) {
    if (coinStillMaturing) return TxState.confirming(target - BigInt.one);
    return const TxState.confirmed();
  }
  return TxState.confirming(confirmations);
}

/// Our records come from several sources (the node's live messages, and an
/// explorer website that is slow to catch up). A slower, older picture must
/// NEVER wipe out the acceptance we already learned -- otherwise the label
/// jumps backwards. Keeps the acceptance details of [old] when [fresh] has none.
ApiTransaction keepAcceptance(ApiTransaction fresh, ApiTransaction? old) {
  final freshKnows = fresh.isAccepted && fresh.acceptingBlockBlueScore != null;
  final oldKnows =
      old != null && old.isAccepted && old.acceptingBlockBlueScore != null;
  if (freshKnows || !oldKnows) return fresh;
  return fresh.copyWith(
    isAccepted: true,
    acceptingBlockHash: old.acceptingBlockHash,
    acceptingBlockBlueScore: old.acceptingBlockBlueScore,
  );
}

/// A record that has been "unaccepted" for this long is not "waiting" any more:
/// our data is simply stale. Say so honestly instead of claiming failure.
const kStaleRecordAfter = Duration(minutes: 30);

bool isStaleRecord(int blockTime, {DateTime? now}) {
  if (blockTime <= 0) return false;
  final ms = blockTime > 100000000000 ? blockTime : blockTime * 1000;
  final age = (now ?? DateTime.now())
      .difference(DateTime.fromMillisecondsSinceEpoch(ms));
  return age > kStaleRecordAfter;
}

/// Ids of records that are still "not accepted" long after they were made and
/// that we have not asked the explorer about yet. Almost always one of two
/// things: we missed the node's "accepted" message, or this is the reward
/// (coinbase) transaction of a block that is in the DAG but not on the main
/// chain. Only the main-chain block's reward transaction counts, so the others
/// are never accepted and are harmless: the same reward is paid once, in the
/// accepted one. Only the explorer can tell which.
List<String> staleUnacceptedIds(
  Iterable<ApiTransaction> txs, {
  required Set<String> alreadyAsked,
  DateTime? now,
  int limit = 20,
}) =>
    [
      for (final t in txs)
        if (!t.isAccepted &&
            isStaleRecord(t.blockTime, now: now) &&
            !alreadyAsked.contains(t.transactionId))
          t.transactionId,
    ].take(limit).toList();

/// What the explorer said about those records: [accepted] ones (update our
/// records with them) and [notAccepted] ones (they never were, and now will not
/// be: shown honestly as "not accepted" and not counted as income). An answer
/// that says accepted but gives no accepting block is left alone.
({List<ApiTransaction> accepted, Set<String> notAccepted}) sortByAcceptance(
    Iterable<ApiTransaction> fresh) {
  final accepted = <ApiTransaction>[];
  final notAccepted = <String>{};
  for (final f in fresh) {
    if (f.isAccepted) {
      if (f.acceptingBlockBlueScore != null) accepted.add(f);
    } else {
      notAccepted.add(f.transactionId);
    }
  }
  return (accepted: accepted, notAccepted: notAccepted);
}
