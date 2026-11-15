import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/transactions/live_feeds.dart';

void main() {
  test('pausing closes the feed to the node; resuming opens a fresh one', () async {
    var opened = 0;
    var cancelled = 0;

    // stands in for the node's block feed: counts opens and cancels
    Stream<int> openFeed() {
      opened++;
      late StreamController<int> c;
      c = StreamController<int>(onCancel: () => cancelled++);
      c.add(1);
      return c.stream;
    }

    final feed = StreamProvider.autoDispose<int>(
        (ref) => feedUnlessPaused(ref, openFeed));
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final seen = <AsyncValue<int>>[];
    container.listen(feed, (_, next) => seen.add(next), fireImmediately: true);
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(opened, 1);
    expect(cancelled, 0);

    // a merge starts: the feed to the node must be CLOSED, nothing new opened
    container.read(liveFeedsHoldersProvider.notifier).pauseFeeds();
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(cancelled, 1, reason: 'the old subscription must be cancelled');
    expect(opened, 1, reason: 'no new feed while paused');

    // still paused: stays closed
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(opened, 1);

    // the merge ends: a fresh feed opens
    container.read(liveFeedsHoldersProvider.notifier).resumeFeeds();
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(opened, 2);
  });

  test('not paused by default', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    expect(container.read(liveFeedsPausedProvider), isFalse);
  });

  test('two overlapping jobs: the first to finish does not switch the feeds back on',
      () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final holders = container.read(liveFeedsHoldersProvider.notifier);
    holders.pauseFeeds(); // a merge starts
    holders.pauseFeeds(); // a move-to-main starts while it runs
    expect(container.read(liveFeedsPausedProvider), isTrue);
    holders.resumeFeeds(); // the merge ends
    expect(container.read(liveFeedsPausedProvider), isTrue,
        reason: 'the other job is still running');
    holders.resumeFeeds();
    expect(container.read(liveFeedsPausedProvider), isFalse);
  });

  test('releasing more often than pausing never goes below zero', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final holders = container.read(liveFeedsHoldersProvider.notifier);
    holders.resumeFeeds();
    holders.resumeFeeds();
    holders.pauseFeeds();
    expect(container.read(liveFeedsPausedProvider), isTrue);
  });
}
