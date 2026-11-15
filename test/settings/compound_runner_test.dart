import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';
import 'package:hoosat_mobile/settings_advanced/compound_runner.dart';
import 'package:hoosat_mobile/util/friendly_error.dart';

String key(Utxo u) => '${u.outpoint.transactionId}:${u.outpoint.index}';

/// A pretend node + wallet that enforces the real rules:
///  * a coin must be at least 1000 units old to be spent;
///  * at most [nodeLimitPerMinute] "compound-looking" (>= 21 inputs) sends per
///    address per minute, otherwise "rate limit exceeded";
///  * accepted merges only show up in the wallet's coin list after a refresh.
class FakeNode implements CompoundEnv {
  FakeNode(List<Utxo> coins, {this.nodeLimitPerMinute = 10})
      : _node = List.of(coins),
        _app = List.of(coins);

  final int nodeLimitPerMinute;
  List<Utxo> _node; // what the node really holds
  List<Utxo> _app; // what the wallet currently believes
  final _spentByUs = <String>{};
  DateTime _clock = DateTime(2026, 11, 13, 12);
  double rate = 4;
  int _score = 100000;
  int _next = 0;

  bool locked = false;
  int sends = 0;
  int rejections = 0;
  int failConnectionTimes = 0; // next N sends fail with a connection error
  String connectionErrorText = 'Request timed out after 60 seconds';
  // next N sends: the node never answers. "Before" = it never got the send;
  // "After" = it took the send but the answer was lost (the dangerous one)
  int timeoutsBeforeAccepting = 0;
  int timeoutsAfterAccepting = 0;
  int lockAfterSends = -1; // lock the wallet after this many sends (-1 = never)
  bool freezeRefresh = false; // refresh does nothing (for the "stuck" test)
  // After a send, the wallet's coin list is this many refreshes behind (the
  // node's list still shows the coins we just spent). This is what happens on
  // a real phone when a refresh is already running.
  int refreshLag = 0;
  // true = count coins we have just spent as if they still existed (how the
  // app behaved when it merged far too much)
  bool countSpent = false;
  int _lagLeft = 0;
  // real phones spend time signing: seconds per coin merged (0 = instant)
  double sendSecondsPerCoin = 0;
  Object? failWith; // every send throws this
  final _sendTimes = <String, List<DateTime>>{};
  Duration totalPaused = Duration.zero;

  @override
  List<Utxo> allCoins() => countSpent
      ? List.of(_app)
      : _app.where((u) => !_spentByUs.contains(key(u))).toList();
  @override
  bool coinListIsFresh() => !_app.any((u) => _spentByUs.contains(key(u)));
  @override
  List<Utxo> spendableCoins() => _app
      .where((u) =>
          u.utxoEntry.blockDaaScore + BigInt.from(1000) < BigInt.from(_score) &&
          !_spentByUs.contains(key(u)))
      .toList();
  Set<String> accounts = {};
  @override
  Set<String> accountAddresses() => accounts;
  @override
  BigInt score() => BigInt.from(_score);
  @override
  double daaPerSecond() => rate;
  @override
  bool get walletLocked => locked;
  @override
  DateTime now() => _clock;

  @override
  Future<void> pause(Duration d) async {
    _clock = _clock.add(d);
    totalPaused += d;
    _score += (d.inMilliseconds / 1000 * rate).round();
  }

  @override
  Future<void> refreshCoins() async {
    if (freezeRefresh) return;
    if (_lagLeft > 0) {
      _lagLeft--;
      return; // the list has not caught up yet
    }
    _app = List.of(_node);
    _spentByUs.clear();
  }

  @override
  Future<void> sendChunk(String address, List<Utxo> chunk) async {
    if (failWith != null) throw failWith!;
    if (failConnectionTimes > 0) {
      failConnectionTimes--;
      throw Exception(connectionErrorText);
    }
    if (timeoutsBeforeAccepting > 0) {
      timeoutsBeforeAccepting--;
      throw TimeoutException('Request timed out after 60 seconds');
    }
    if (locked) throw Exception('Wallet is locked');
    if (sendSecondsPerCoin > 0) {
      final ms = (chunk.length * sendSecondsPerCoin * 1000).round();
      _clock = _clock.add(Duration(milliseconds: ms));
      _score += (ms / 1000 * rate).round();
    }
    for (final u in chunk) {
      if (u.utxoEntry.blockDaaScore + BigInt.from(1000) >= BigInt.from(_score)) {
        throw Exception('every input must be at least 1000 DAA score units old');
      }
      if (!_node.any((n) => key(n) == key(u))) {
        throw Exception('input already spent');
      }
    }
    if (chunk.length >= 21) {
      final list = _sendTimes.putIfAbsent(address, () => []);
      list.removeWhere((t) => _clock.difference(t) >= const Duration(minutes: 1));
      if (list.length >= nodeLimitPerMinute) {
        rejections++;
        throw Exception('Compound transaction rate limit exceeded for addresses: [$address]');
      }
      list.add(_clock);
    }
    sends++;
    final total = chunk.fold(BigInt.zero, (a, u) => a + u.utxoEntry.amount);
    final spent = chunk.map(key).toSet();
    _node = [
      ..._node.where((n) => !spent.contains(key(n))),
      coin('M', 'merged${_next++}', amount: total, daa: _score),
    ];
    if (timeoutsAfterAccepting > 0) {
      timeoutsAfterAccepting--;
      // the node has it, but the wallet never heard back (so it does NOT mark
      // these coins as spent, exactly like the real app)
      throw TimeoutException('Request timed out after 60 seconds');
    }
    _spentByUs.addAll(spent);
    _lagLeft = refreshLag;
    if (lockAfterSends >= 0 && sends >= lockAfterSends) locked = true;
  }
}

Utxo coin(String addr, String tx, {BigInt? amount, int daa = 0}) => Utxo(
      address: addr,
      outpoint: Outpoint(transactionId: tx, index: 0),
      utxoEntry: UtxoEntry(
        amount: amount ?? BigInt.from(100000000),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.from(daa),
        isCoinbase: false,
      ),
    );

List<Utxo> many(int n, {int daa = 0}) =>
    [for (var i = 0; i < n; i++) coin('M', 'c$i', daa: daa)];

Future<List<CompoundProgress>> runAll(CompoundRunner r) => r.run().toList();

/// Blows up in the middle of a job (a bug, a disposed screen...).
class _ExplodingNode extends FakeNode {
  _ExplodingNode() : super(many(30));
  @override
  BigInt score() => throw StateError('boom 0xDEAD');
}

/// A node whose coin-list refresh gets no answer the first [refreshFails] times.
class _RefreshDownNode extends FakeNode {
  _RefreshDownNode(super.coins);
  int refreshFails = 0;
  @override
  Future<void> refreshCoins() async {
    if (refreshFails > 0) {
      refreshFails--;
      throw StateError('The node did not answer.');
    }
    return super.refreshCoins();
  }
}


void main() {
  group('CompoundPacer', () {
    test('lets 8 through in a minute, then waits, then lets more through', () {
      final p = CompoundPacer(maxPerMinute: 8);
      final t0 = DateTime(2026, 1, 1, 12);
      for (var i = 0; i < 8; i++) {
        expect(p.waitFor('a', t0.add(Duration(seconds: i))), Duration.zero);
        p.record('a', t0.add(Duration(seconds: i)));
      }
      final wait = p.waitFor('a', t0.add(const Duration(seconds: 9)));
      expect(wait, greaterThan(Duration.zero));
      expect(wait, lessThan(const Duration(minutes: 1, seconds: 2)));
      expect(p.waitFor('a', t0.add(const Duration(minutes: 2))), Duration.zero);
    });
    test('the wallet defaults to one merge every 10 seconds (6 a minute)', () {
      expect(kCompoundSendsPerMinute, 6);
      final p = CompoundPacer();
      expect(p.maxPerMinute, 6);
      final t0 = DateTime(2026, 1, 1, 12);
      for (var i = 0; i < 6; i++) {
        expect(p.waitFor('a', t0), Duration.zero, reason: 'send ${i + 1}');
        p.record('a', t0);
      }
      expect(p.waitFor('a', t0), greaterThan(Duration.zero),
          reason: 'the 7th within a minute must wait');
    });

    test('leaves room for the Node Manager sharing the address (6 + 3 < 10)',
        () {
      expect(kCompoundSendsPerMinute + 3, lessThan(10));
    });

    test('addresses are counted separately', () {
      final p = CompoundPacer(maxPerMinute: 2);
      final t0 = DateTime(2026, 1, 1, 12);
      p.record('a', t0);
      p.record('a', t0);
      expect(p.waitFor('a', t0), greaterThan(Duration.zero));
      expect(p.waitFor('b', t0), Duration.zero);
    });
  });

  group('time left and wording', () {
    test('messages never repeat "Round N" (the dialog shows it once)', () async {
      final n = FakeNode(many(400));
      final steps = await runAll(CompoundRunner(n));
      expect(steps.any((s) => s.message.contains('Round')), isFalse);
      expect(steps.any((s) => s.message.startsWith('Sent ')), isTrue);
    });

    test('a long job gives an estimate that falls as it goes', () async {
      final n = FakeNode(many(1500));
      final steps = await runAll(CompoundRunner(n));
      final withEta = steps.where((s) => s.etaSeconds != null && !s.finished).toList();
      expect(withEta, isNotEmpty);
      final first = withEta.first.etaSeconds!;
      final last = withEta.last.etaSeconds!;
      expect(first, greaterThan(60)); // many batches + waiting = minutes
      expect(last, lessThan(first));
      expect(withEta.first.etaText, matches(RegExp(r'^about \d+ min left$')));
      // nothing to say once it is over
      expect(steps.last.etaText, isNull);
    });

    test('the first estimate is realistic and it does not creep UP as it learns',
        () async {
      // a phone that needs 0.25 s per coin (about 20 s for 84 coins), like the real one
      // coins of different sizes, as in a real wallet (so "smallest first" means
      // something: the smallest are merged first, i.e. made first)
      final n = FakeNode([
        for (var i = 1; i <= 1008; i++)
          coin('M', 'c$i', amount: BigInt.from(i) * BigInt.from(100000000)),
      ])
        ..sendSecondsPerCoin = 0.25;
      final start = n.now();
      final steps = await runAll(CompoundRunner(n));
      final actual = n.now().difference(start).inSeconds;
      final etas = steps
          .where((s) => s.etaSeconds != null && !s.finished)
          .map((s) => s.etaSeconds!)
          .toList();
      expect(steps.last.phase, CompoundPhase.done);
      // first guess within a third of the real time
      expect(etas.first, inInclusiveRange(actual * 0.66, actual * 1.34));
      // while round 1 is being sent the estimate only goes down (it does not
      // start low and grow, as it did before): at most 15 s of wobble
      final sending = steps
          .where((s) =>
              s.round == 1 && s.phase == CompoundPhase.merging && s.etaSeconds != null)
          .map((s) => s.etaSeconds!)
          .toList();
      expect(sending.length, greaterThan(5));
      for (var i = 1; i < sending.length; i++) {
        expect(sending[i] - sending[i - 1], lessThan(15),
            reason: 'estimate went up from ${sending[i - 1]} to ${sending[i]}');
      }
    });

    test('short jobs say "less than a minute"', () {
      const p = CompoundProgress(
          phase: CompoundPhase.merging,
          round: 1,
          sent: 0,
          total: 1,
          coinsAtStart: 20,
          coinsNow: 20,
          targetCoins: 10,
          message: 'x',
          etaSeconds: 30);
      expect(p.etaText, 'less than a minute left');
    });

    test('the estimate counts the wait for new coins when another round is needed',
        () async {
      // 1000 coins: round 1 cannot finish (new coins must age first)
      final n = FakeNode(many(1000));
      final steps = await runAll(CompoundRunner(n));
      final first = steps.firstWhere((s) => s.phase == CompoundPhase.merging);
      expect(first.etaSeconds!, greaterThan(250)); // >= the ~4 min maturity wait
    });
  });

  group('a node that stops answering mid-merge', () {
    test('a send the node DID take but never answered is not sent twice', () async {
      final n = FakeNode(many(300))..timeoutsAfterAccepting = 1;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done,
          reason: steps.last.message);
      expect(n.allCoins().length, 10);
      expect(n.sends, 4); // 290 coins to remove = 4 transactions, each exactly once
    });

    test('a send the node never received is sent again after checking', () async {
      final n = FakeNode(many(300))..timeoutsBeforeAccepting = 1;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done, reason: steps.last.message);
      expect(n.allCoins().length, 10);
    });

    test('a node that never answers ends politely instead of hanging forever',
        () async {
      final n = FakeNode(many(300))..timeoutsBeforeAccepting = 999;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.failed);
      expect(steps.last.message, contains('Your coins are safe'));
      expect(n.sends, 0);
    });

    test('"already in the mempool" after a retry means it went through: re-check, not fail',
        () async {
      final n = FakeNode(many(300))
        ..failConnectionTimes = 1
        ..connectionErrorText = 'transaction abc is already in the mempool';
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done, reason: steps.last.message);
      expect(n.allCoins().length, 10);
    });

    test('a plain connection drop (not a timeout) is still just retried', () async {
      final n = FakeNode(many(300))
        ..failConnectionTimes = 2
        ..connectionErrorText = 'gRPC Error (code: 14, codeName: UNAVAILABLE)';
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done, reason: steps.last.message);
      expect(n.allCoins().length, 10);
    });
  });

  group('a coin list that is slow to catch up', () {
    test('does not merge the groups it just merged all over again', () async {
      // like the phone test: an account with 150 coins -> must END on 10
      final coins = [
        for (var i = 1; i <= 150; i++)
          coin('ACC', 'a$i', amount: BigInt.from(i) * BigInt.from(100000000)),
        for (var i = 0; i < 10; i++) coin('OTHER', 'o$i'),
      ];
      final n = FakeNode(coins)
        ..accounts = {'ACC', 'OTHER'}
        ..refreshLag = 3
        ..countSpent = true;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      final left = n.allCoins();
      expect(left.where((u) => u.address == 'OTHER').length, 10); // untouched
      // 150 -> 10 needs exactly 2 transactions (142 smallest); nothing more
      expect(n.sends, 2);
      expect(left.length, 20);
      // the 8 biggest original coins (143..150 HTN) are still there
      final big = left
          .where((u) => u.outpoint.transactionId.startsWith('a'))
          .map((u) => u.utxoEntry.amount.toInt() ~/ 100000000)
          .toSet();
      expect(big, {for (var i = 143; i <= 150; i++) i});
    });

    test('same, when the count already leaves spent coins out', () async {
      final coins = [
        for (var i = 1; i <= 150; i++)
          coin('ACC', 'a$i', amount: BigInt.from(i) * BigInt.from(100000000)),
      ];
      final n = FakeNode(coins)
        ..accounts = {'ACC'}
        ..refreshLag = 5;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.allCoins().length, 10);
      expect(n.sends, 2);
    });

    test('Main, too: 1005 coins end on exactly 10 with a laggy list', () async {
      final n = FakeNode(many(1005))..refreshLag = 4..countSpent = true;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.allCoins().length, 10);
      // 1005 -> 12 (12 transactions), then 12 -> 10 (1 transaction)
      expect(n.sends, 13);
    });
  });

  group('automatic compounding', () {
    test('2000 coins: merges down to 10, and never trips the node limit',
        () async {
      final n = FakeNode(many(2000));
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.rejections, 0); // the pacing kept it under the limit
      expect(n.allCoins().length, 10); // lands on the target, not below it
      expect(n.sends, greaterThanOrEqualTo(25)); // 24 batches of <=84, then the rest
      expect(steps.last.fraction, 1.0);
    });

    test('it waits for new coins to mature between rounds (no rejections)',
        () async {
      // 1000 coins -> 12 batches -> 12 new coins (more than 10), so a second
      // round is needed, but those 12 coins are brand new and cannot be spent yet.
      final n = FakeNode(many(1000));
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.rejections, 0);
      final firstWait =
          steps.indexWhere((s) => s.phase == CompoundPhase.waiting && s.round == 1);
      expect(firstWait, greaterThan(-1)); // it paused to let the new coins age
      expect(steps.any((s) => s.round == 2 && s.phase == CompoundPhase.merging),
          isTrue); // and then did round 2
      expect(n.allCoins().length, lessThanOrEqualTo(10));
    });

    test('a stricter node (3 per minute) only makes it wait, never fail',
        () async {
      final n = FakeNode(many(2000), nodeLimitPerMinute: 3);
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.rejections, greaterThan(0));
      expect(n.allCoins().length, lessThanOrEqualTo(10));
    });

    test('coins that are still young at the start: waits, then merges', () async {
      final n = FakeNode(many(60, daa: 99800)); // 200 units old at score 100000
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.rejections, 0);
      expect(n.allCoins().length, lessThanOrEqualTo(10));
    });

    test('already healthy: says so and sends nothing', () async {
      final n = FakeNode(many(8));
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(steps.last.message, contains('nothing to merge'));
      expect(n.sends, 0);
    });

    test('exactly 10 coins is left alone', () async {
      final n = FakeNode(many(10));
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.sends, 0);
      expect(n.allCoins().length, 10);
    });

    test('it stops at 10 and keeps the BIGGEST coins as they were', () async {
      // 30 coins worth 1, 2, 3 ... 30 HTN
      final coins = [
        for (var i = 1; i <= 30; i++)
          coin('M', 'c$i', amount: BigInt.from(i) * BigInt.from(100000000)),
      ];
      final n = FakeNode(coins);
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      final left = n.allCoins();
      expect(left.length, 10);
      // the 9 biggest (22..30) are untouched; one new coin holds the 21 smallest
      final untouched = left.where((u) => u.outpoint.transactionId.startsWith('c'));
      expect(untouched.length, 9);
      expect(untouched.map((u) => u.utxoEntry.amount.toInt() ~/ 100000000).toSet(),
          {for (var i = 22; i <= 30; i++) i});
      // no HTN lost or created: 465 in total
      final total = left.fold(BigInt.zero, (a, u) => a + u.utxoEntry.amount);
      expect(total, BigInt.from(465) * BigInt.from(100000000));
      expect(n.sends, 1);
    });

    test('an account with few coins is not touched while Main is merged',
        () async {
      final coins = [
        for (var i = 0; i < 40; i++) coin('M', 'm$i'),
        for (var i = 0; i < 6; i++) coin('ACC', 'a$i'),
      ];
      final n = FakeNode(coins)..accounts = {'ACC'};
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      final left = n.allCoins();
      // the fake puts every merged coin on 'M', so count what stayed on ACC
      expect(left.where((u) => u.address == 'ACC').length, 6);
      expect(left.length, 16); // 10 for Main + the 6 on the account
    });

    test('a dropped connection is retried, not fatal', () async {
      final n = FakeNode(many(100))..failConnectionTimes = 2;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done);
      expect(n.allCoins().length, lessThanOrEqualTo(10));
    });

    test('the wallet locking pauses it with a clear message; resuming finishes',
        () async {
      final n = FakeNode(many(400))..lockAfterSends = 2;
      final first = await runAll(CompoundRunner(n));
      expect(first.last.phase, CompoundPhase.paused);
      expect(first.last.message, contains('locked itself'));
      expect(n.sends, 2);
      // the user unlocks and presses Compound again: it carries on
      n.locked = false;
      n.lockAfterSends = -1;
      final second = await runAll(CompoundRunner(n));
      expect(second.last.phase, CompoundPhase.done);
      expect(n.allCoins().length, lessThanOrEqualTo(10));
    });

    test('Stop ends it safely', () async {
      final n = FakeNode(many(2000));
      final r = CompoundRunner(n);
      final steps = <CompoundProgress>[];
      await for (final s in r.run()) {
        steps.add(s);
        if (s.phase == CompoundPhase.merging && s.sent >= 2) r.stop();
      }
      expect(steps.last.phase, CompoundPhase.stopped);
      expect(n.sends, lessThan(25));
    });

    test('an unknown failure ends with a plain message, not raw text', () async {
      final n = FakeNode(many(100))..failWith = Exception('weird 0xDEAD');
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.failed);
      expect(steps.last.message, startsWith('Something went wrong'));
    });

    test('if nothing changes after merging it stops instead of looping forever',
        () async {
      final n = FakeNode(many(100))..freezeRefresh = true;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.failed);
      expect(steps.last.message, contains('try again in a few minutes'));
    });
  });

  group('the engine always ends in a clear state', () {
    test('an unexpected error ends the job as "failed", not as an unhandled exception',
        () async {
      final steps = await runAll(CompoundRunner(_ExplodingNode()));
      expect(steps.last.phase, CompoundPhase.failed);
      expect(steps.last.message.contains('0xDEAD'), isFalse);
    });

    test('cancelling the stream stops the job (nobody is watching)', () async {
      final n = FakeNode(many(2000));
      final r = CompoundRunner(n);
      late StreamSubscription<CompoundProgress> sub;
      // the screen goes away (the subscription is cancelled) after 2 merges
      sub = r.run().listen((s) {
        if (s.phase == CompoundPhase.merging && s.sent >= 2) sub.cancel();
      });
      await Future<void>.delayed(const Duration(milliseconds: 100));
      final after = n.sends;
      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(n.sends, after, reason: 'no more sends after cancelling');
      expect(n.sends, lessThan(25));
    });

    test('a coin-list refresh that fails twice is retried, not fatal', () async {
      final n = _RefreshDownNode(many(300))..refreshFails = 2;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done, reason: steps.last.message);
      expect(n.allCoins().length, 10);
    });

    test('a node that never answers the refresh ends with "stopped answering"',
        () async {
      final n = _RefreshDownNode(many(300))..refreshFails = 999;
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.failed);
      expect(steps.last.message, contains('stopped answering'));
    });

    test('"too new" that never clears ends instead of looping for 80 rounds',
        () async {
      final n = FakeNode(many(300))
        ..failWith =
            Exception('every input must be at least 1000 DAA score units old');
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.failed);
      expect(steps.last.message, contains('too new'));
      expect(steps.where((s) => s.phase == CompoundPhase.merging).length,
          lessThan(20));
    });

    test('a gRPC "deadline exceeded" is re-checked like a timeout, never blindly resent',
        () async {
      final n = FakeNode(many(300))
        ..timeoutsAfterAccepting = 1; // the node DID take it
      final steps = await runAll(CompoundRunner(n));
      expect(steps.last.phase, CompoundPhase.done, reason: steps.last.message);
      expect(n.sends, 4); // each merge exactly once
      expect(isTimeoutError('gRPC Error (code: 4, codeName: DEADLINE_EXCEEDED)'),
          isTrue);
    });
  });
}
