import 'package:flutter_riverpod/flutter_riverpod.dart';

/// True while at least one long job (merging thousands of coins, moving funds)
/// runs.
///
/// The wallet normally listens to EVERY block on the network (about five a
/// second on mainnet) and every accepted-transaction list, and checks each
/// transaction against the wallet. A phone that is also busy merging cannot
/// keep up: the node's queue for it fills (5000 messages), the node cuts it
/// off as a "slow RPC client", and the merge freezes while the app
/// reconnects. A merge does not need those feeds, so they are switched off
/// for its duration and back on afterwards.
///
/// A COUNT of the jobs that want the feeds off, not a flag: when two long jobs
/// overlap, the first to finish must not switch the feeds back on while the
/// other is still running. Every [LiveFeedsHolders.pauseFeeds] needs one
/// [LiveFeedsHolders.resumeFeeds] (put it in a `finally`).
final liveFeedsHoldersProvider = StateProvider<int>((ref) => 0);

final liveFeedsPausedProvider =
    Provider<bool>((ref) => ref.watch(liveFeedsHoldersProvider) > 0);

extension LiveFeedsHolders on StateController<int> {
  void pauseFeeds() => state = state + 1;
  void resumeFeeds() => state = state > 0 ? state - 1 : 0;
}

/// Opens [open] unless the feeds are paused, in which case it returns an
/// empty stream. When the pause starts or ends the calling provider rebuilds,
/// which cancels the old subscription (closing the stream to the node) or
/// opens a fresh one.
Stream<T> feedUnlessPaused<T>(Ref ref, Stream<T> Function() open) {
  if (ref.watch(liveFeedsPausedProvider)) return Stream<T>.empty();
  return open();
}
