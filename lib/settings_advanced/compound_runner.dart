import 'dart:async';

import '../hoosat/hoosat.dart';
import '../hoosat/transaction/compound_grouping.dart';
import '../hoosat/transaction/types.dart';
import '../util/friendly_error.dart';
import '../utxos/utxos_providers.dart';
import 'compound_advice.dart';

/// Everything the runner needs from the outside world. The real wallet and a
/// test's pretend node both implement this, so the rules below can be tested
/// without waiting minutes.
abstract class CompoundEnv {
  List<Utxo> allCoins();
  List<Utxo> spendableCoins();
  Set<String> accountAddresses();
  BigInt score();
  double daaPerSecond();
  bool get walletLocked;

  /// Builds, signs and submits ONE compound transaction. Throws on failure.
  Future<void> sendChunk(String address, List<Utxo> chunk);

  /// Asks the node for the current coin list (ignoring the usual lockout).
  Future<void> refreshCoins();

  /// False while the wallet's coin list still shows coins this job has already
  /// spent, i.e. it has not caught up with the node yet.
  bool coinListIsFresh();

  DateTime now();
  Future<void> pause(Duration d);
}

enum CompoundPhase { merging, waiting, done, paused, stopped, failed }

class CompoundProgress {
  final CompoundPhase phase;
  final int round;
  final int sent;
  final int total;
  final int coinsAtStart;
  final int coinsNow;
  final int targetCoins;
  final int waitSeconds;
  final String message;

  /// Best guess of how long everything still has to take, or null if unknown.
  final int? etaSeconds;

  const CompoundProgress({
    required this.phase,
    required this.round,
    required this.sent,
    required this.total,
    required this.coinsAtStart,
    required this.coinsNow,
    required this.targetCoins,
    this.waitSeconds = 0,
    required this.message,
    this.etaSeconds,
  });

  /// "about 3 min left" -- null when there is no useful estimate.
  String? get etaText {
    final s = etaSeconds;
    if (s == null || finished || s <= 0) return null;
    if (s <= 45) return 'less than a minute left';
    return 'about ${(s / 60).ceil()} min left';
  }

  bool get finished =>
      phase == CompoundPhase.done ||
      phase == CompoundPhase.paused ||
      phase == CompoundPhase.stopped ||
      phase == CompoundPhase.failed;

  /// 0..1: how much of the merging is done, by coins merged away.
  double get fraction {
    final todo = coinsAtStart - targetCoins;
    if (todo <= 0) return 1;
    return ((coinsAtStart - coinsNow) / todo).clamp(0.0, 1.0);
  }
}

/// How many merges per minute the wallet sends for one address: 6 (the pacer
/// allows a short burst of up to 6 inside any minute, then waits).
///
/// The node allows 10 compound transactions per address per minute, and that
/// budget is SHARED by everything compounding the address (this wallet, a
/// second phone, the Node Manager's auto-compound at one per 20 s = 3 a
/// minute). 6 + 3 = 9 stays under 10; the 8 we used before did not. The
/// command-line wallet refuses anything faster than one per 6 s and defaults
/// to one per 60 s. This changes the wallet's own pace only, never the node's
/// limit.
const kCompoundSendsPerMinute = 6;

/// Keeps the node's compound rate limit (10 per address per minute) from ever
/// being reached, by spacing the sends out.
class CompoundPacer {
  final int maxPerMinute;
  final _times = <String, List<DateTime>>{};
  CompoundPacer({this.maxPerMinute = kCompoundSendsPerMinute});

  /// An independent copy, for "what if I sent these next" estimates.
  CompoundPacer copy() {
    final c = CompoundPacer(maxPerMinute: maxPerMinute);
    _times.forEach((k, v) => c._times[k] = List.of(v));
    return c;
  }

  /// How long to wait before the next send for [address]; zero if none.
  Duration waitFor(String address, DateTime now) {
    final list = _times[address] ?? const [];
    final recent =
        list.where((t) => now.difference(t) < const Duration(minutes: 1)).toList();
    if (recent.length < maxPerMinute) return Duration.zero;
    recent.sort();
    final oldest = recent[recent.length - maxPerMinute];
    return oldest.add(const Duration(minutes: 1, seconds: 1)).difference(now);
  }

  void record(String address, DateTime now) {
    final list = _times.putIfAbsent(address, () => []);
    list.add(now);
    list.removeWhere((t) => now.difference(t) >= const Duration(minutes: 2));
  }
}

enum _Outcome { ok, locked, tooNew, unknown, failed, stopped }

/// Merges coins in as many rounds as it takes: paced under the node's limit,
/// waiting for each round's new coins to become spendable, retrying a dropped
/// connection, and pausing (not crashing) if the wallet locks. Pressing
/// Compound again simply carries on -- it works from the live coin list.
class CompoundRunner {
  final CompoundEnv env;
  final int keepCoins;
  final CompoundPacer pacer;
  final Duration rateLimitWait;
  final Duration settleWait;
  final Duration maturityMargin;
  final int maxRounds;

  CompoundRunner(
    this.env, {
    this.keepCoins = kCoinsToKeep,
    CompoundPacer? pacer,
    this.rateLimitWait = const Duration(seconds: 30),
    this.settleWait = const Duration(seconds: 12),
    this.maturityMargin = const Duration(seconds: 8),
    this.maxRounds = 80,
  }) : pacer = pacer ?? CompoundPacer();

  bool _stopped = false;
  Object? lastError;
  bool _refreshFailed = false; // the last coin-list refresh got no answer
  int _tooNewInARow = 0;
  int _unknownInARow = 0; // sends in a row whose outcome we could not learn

  /// Refreshes the coin list and does not return until it has caught up with
  /// what was just sent (or a reasonable time has passed). Planning from a
  /// list that still shows spent coins made earlier builds merge far too much.
  ///
  /// Returns false if the list still had not caught up after about a minute.
  Future<bool> _refreshFresh() async {
    _refreshFailed = false;
    for (var tries = 0; tries < 12; tries++) {
      try {
        await env.refreshCoins();
        _refreshFailed = false;
      } catch (e) {
        // The node did not answer: wait and try again instead of ending the
        // job on one blip.
        lastError = e;
        _refreshFailed = true;
        if (_stopped) return true;
        await env.pause(const Duration(seconds: 5));
        continue;
      }
      if (env.coinListIsFresh()) return true;
      if (_stopped) return true;
      await env.pause(const Duration(seconds: 5));
    }
    return false;
  }

  static const _nodeStoppedAnswering =
      'The node stopped answering. Your coins are safe. Check your '
      'connection, then press Continue.';

  static const _notCaughtUp =
      'The wallet is still waiting for the node to show the merged coins. '
      'Your coins are safe. Please try again in a few minutes.';

  void stop() => _stopped = true;

  Stream<CompoundProgress> run() {
    // Cancelling the stream stops the job: nobody is watching any more.
    final controller = StreamController<CompoundProgress>(onCancel: stop);
    _run(controller).catchError((Object e) {
      // Never let an error escape as an unhandled exception: the person must
      // always see how the job ended.
      lastError = e;
      if (!controller.isClosed) {
        controller.add(_p(CompoundPhase.failed, friendlyError(e)));
      }
    }).whenComplete(controller.close);
    return controller.stream;
  }

  late int _coinsAtStart;
  late int _targetCoins;
  int _coinsNow = 0;
  int _round = 0;

  // ---- time-left estimate --------------------------------------------------
  DateTime? _etaAt; // when we expect to be finished

  // How long building + signing + sending takes depends on the phone and is
  // mostly per coin merged (every input is signed). A real phone took ~20 s
  // for 84 coins, so start from a cautious guess and learn from real sends --
  // otherwise the estimate starts too low and then grows, which looks broken.
  static const _guessSecondsPerCoin = 0.25;
  double _measuredSeconds = 0;
  int _measuredCoins = 0;

  double get _secondsPerCoin {
    if (_measuredCoins < 20) return _guessSecondsPerCoin;
    final v = _measuredSeconds / _measuredCoins;
    return v < 0.01 ? 0.01 : v;
  }

  int _secondsFor(int coins) {
    final s = (coins * _secondsPerCoin).ceil();
    return s < 1 ? 1 : s;
  }

  void _setEta(int seconds) => _etaAt = env.now().add(Duration(seconds: seconds));

  int? _etaLeft() {
    final at = _etaAt;
    if (at == null) return null;
    final s = at.difference(env.now()).inSeconds;
    return s < 0 ? 0 : s;
  }

  /// How long sending [batches] will take, counting the pacing pauses.
  int _estimateSends(List<(String, List<Utxo>)> batches) {
    final sim = pacer.copy();
    var t = env.now();
    var secs = 0;
    for (final (address, coins) in batches) {
      final w = sim.waitFor(address, t);
      if (w > Duration.zero) {
        t = t.add(w);
        secs += w.inSeconds + 1;
      }
      final d = _secondsFor(coins.length);
      t = t.add(Duration(seconds: d));
      secs += d;
      sim.record(address, t);
    }
    return secs;
  }

  int _maturitySeconds() {
    final rate = env.daaPerSecond() <= 0 ? kDefaultDaaPerSecond : env.daaPerSecond();
    return (kMinUtxoMaturityDaaScore / rate).ceil() + maturityMargin.inSeconds;
  }

  /// Time for everything AFTER the current round's sends: letting the node
  /// settle, and -- if some groups will still be above the target because
  /// their coins are too new to merge yet -- waiting for those coins to age
  /// and merging them in one more round.
  int _futureSeconds(List<(String, List<Utxo>)> thisRound) {
    final removed = thisRound.fold<int>(0, (n, c) => n + c.$2.length - 1);
    final left =
        totalExcessCoins(env.allCoins(), env.accountAddresses(), keepCoins) -
            removed;
    var secs = settleWait.inSeconds;
    if (left > 0) {
      final batches = (left / (kMaxInputsPerTransaction - 1)).ceil();
      // The next round merges the SMALLEST coins, which are the ones this
      // round produced FIRST -- they keep ageing while the later batches are
      // still being sent. So a long round leaves little or nothing to wait
      // for, and only a short round has to wait most of the ~4 minutes.
      final ageing = (_estimateSends(thisRound) * 0.9).round();
      final wait = _maturitySeconds() - ageing;
      // the next round merges about (left + one per batch) coins
      secs += (wait < 0 ? 0 : wait) +
          _secondsFor(left + batches) +
          settleWait.inSeconds;
    }
    return secs;
  }

  CompoundProgress _p(
    CompoundPhase phase,
    String message, {
    int sent = 0,
    int total = 0,
    int waitSeconds = 0,
  }) =>
      CompoundProgress(
        phase: phase,
        round: _round,
        sent: sent,
        total: total,
        coinsAtStart: _coinsAtStart,
        coinsNow: _coinsNow,
        targetCoins: _targetCoins,
        waitSeconds: waitSeconds,
        message: message,
        etaSeconds: _etaLeft(),
      );

  Future<void> _run(StreamController<CompoundProgress> out) async {
    _coinsAtStart = env.allCoins().length;
    _coinsNow = _coinsAtStart;
    // Every group above the target is merged down to it, so the whole wallet
    // ends up that many coins lighter.
    _targetCoins = _coinsAtStart -
        totalExcessCoins(env.allCoins(), env.accountAddresses(), keepCoins);
    var stuck = 0;
    var staleWaits = 0;

    while (true) {
      if (_stopped) {
        out.add(_p(CompoundPhase.stopped, 'Stopped. Your coins are safe.'));
        return;
      }
      if (_round >= maxRounds) {
        out.add(_p(CompoundPhase.failed, 'Stopped after many rounds. Try again later.'));
        return;
      }
      if (env.walletLocked) {
        out.add(_p(CompoundPhase.paused,
            friendlyError(Exception('Wallet is locked'))));
        return;
      }

      final advice = adviseCompound(
        allCoins: env.allCoins(),
        spendable: env.spendableCoins(),
        accountAddresses: env.accountAddresses(),
        score: env.score(),
        daaPerSecond: env.daaPerSecond(),
        keepCoins: keepCoins,
      );
      _coinsNow = env.allCoins().length;

      if (advice.situation == CompoundSituation.ready) {
        staleWaits = 0;
        final chunks = planCompound(
          allCoins: env.allCoins(),
          spendable: env.spendableCoins(),
          accountAddresses: env.accountAddresses(),
          keep: keepCoins,
        );
        _round++;
        final before = _coinsNow;
        var sent = 0;
        var saved = 0;
        final future = _futureSeconds(chunks);
        _setEta(_estimateSends(chunks) + future);
        out.add(_p(CompoundPhase.merging,
            'Sent 0 of ${chunks.length} merges',
            sent: 0, total: chunks.length));

        var settleNow = false;
        for (var i = 0; i < chunks.length; i++) {
          final (address, chunk) = chunks[i];
          final startedAt = env.now();
          final outcome = await _sendWithRetry(address, chunk, out, sent,
              chunks.length);
          if (outcome == _Outcome.ok) {
            _unknownInARow = 0;
            _tooNewInARow = 0;
            sent++;
            saved += chunk.length - 1;
            _coinsNow = before - saved;
            _measuredSeconds +=
                env.now().difference(startedAt).inMilliseconds / 1000;
            _measuredCoins += chunk.length;
            _setEta(_estimateSends(chunks.sublist(i + 1)) + future);
            out.add(_p(CompoundPhase.merging,
                'Sent $sent of ${chunks.length} merges',
                sent: sent, total: chunks.length));
          } else if (outcome == _Outcome.locked) {
            out.add(_p(CompoundPhase.paused,
                friendlyError(Exception('Wallet is locked'))));
            return;
          } else if (outcome == _Outcome.stopped) {
            out.add(_p(CompoundPhase.stopped, 'Stopped. Your coins are safe.'));
            return;
          } else if (outcome == _Outcome.tooNew) {
            // Waiting normally fixes this, but not forever.
            if (++_tooNewInARow > 6) {
              out.add(_p(CompoundPhase.failed,
                  friendlyError(lastError ?? 'every input must be older'),
                  sent: sent, total: chunks.length));
              return;
            }
            settleNow = true;
            break;
          } else if (outcome == _Outcome.unknown) {
            // No answer (or "already got it"): the node may have taken that
            // send. Never send the same coins blindly again -- look at the
            // real coin list and plan again from it.
            if (++_unknownInARow >= 3) {
              out.add(_p(CompoundPhase.failed, _nodeStoppedAnswering,
                  sent: sent, total: chunks.length));
              return;
            }
            out.add(_p(CompoundPhase.waiting,
                'No answer from the node. Checking what went through…',
                sent: sent, total: chunks.length, waitSeconds: 12));
            settleNow = true;
            break;
          } else {
            out.add(_p(CompoundPhase.failed, friendlyError(lastError ?? 'error'),
                sent: sent, total: chunks.length));
            return;
          }
        }

        // Let the node accept this round, then look at the coins again.
        await env.pause(settleWait);
        if (!await _refreshFresh()) {
          out.add(_p(CompoundPhase.failed,
              _refreshFailed ? _nodeStoppedAnswering : _notCaughtUp));
          return;
        }
        final after = env.allCoins().length;
        _coinsNow = after;
        if (after >= before && !settleNow) {
          if (++stuck >= 2) {
            out.add(_p(CompoundPhase.failed,
                'Nothing changed after merging. Please try again in a few minutes.'));
            return;
          }
        } else {
          stuck = 0;
        }
        continue;
      }

      if (advice.situation == CompoundSituation.maturing) {
        if (++staleWaits > 12) {
          out.add(_p(CompoundPhase.failed,
              'The coins are taking longer than expected. Please try again in a few minutes.'));
          return;
        }
        final spendableKeys = {
          for (final u in env.spendableCoins())
            '${u.outpoint.transactionId}:${u.outpoint.index}',
        };
        final notYet = env
            .allCoins()
            .where((u) => !spendableKeys
                .contains('${u.outpoint.transactionId}:${u.outpoint.index}'))
            .toList();
        final left = soonestMaturityUnits(notYet, env.score());
        final rate = env.daaPerSecond() <= 0 ? kDefaultDaaPerSecond : env.daaPerSecond();
        final seconds = (left == null ? 20 : (left / rate).ceil()) +
            maturityMargin.inSeconds;
        var remaining = seconds;
        final nextRound = _estimateSends(planCompound(
              allCoins: env.allCoins(),
              spendable: env.allCoins(),
              accountAddresses: env.accountAddresses(),
              keep: keepCoins,
            )) +
            settleWait.inSeconds;
        while (remaining > 0) {
          if (_stopped) {
            out.add(_p(CompoundPhase.stopped, 'Stopped. Your coins are safe.'));
            return;
          }
          _setEta(remaining + nextRound);
          out.add(_p(CompoundPhase.waiting,
              'Waiting for the newest coins to age enough to be merged…',
              waitSeconds: remaining));
          final step = remaining > 5 ? 5 : remaining;
          await env.pause(Duration(seconds: step));
          remaining -= step;
        }
        if (!await _refreshFresh()) {
          out.add(_p(CompoundPhase.failed, _notCaughtUp));
          return;
        }
        continue;
      }

      // healthy or nothing: finished
      out.add(_p(CompoundPhase.done,
          _round == 0 ? advice.message : 'Done. You now have ${env.allCoins().length} coins.'));
      return;
    }
  }

  Future<_Outcome> _sendWithRetry(
    String address,
    List<Utxo> chunk,
    StreamController<CompoundProgress> out,
    int sent,
    int total,
  ) async {
    var connectionTries = 0;
    var rateTries = 0;
    while (true) {
      if (_stopped) return _Outcome.stopped;
      if (env.walletLocked) return _Outcome.locked;

      final wait = pacer.waitFor(address, env.now());
      if (wait > Duration.zero) {
        out.add(_p(CompoundPhase.waiting,
            'Pausing briefly so the network keeps up…',
            sent: sent, total: total, waitSeconds: wait.inSeconds + 1));
        await env.pause(wait);
        continue;
      }

      try {
        await env.sendChunk(address, chunk);
        pacer.record(address, env.now());
        return _Outcome.ok;
      } catch (e) {
        lastError = e;
        if (isWalletLockedError(e)) return _Outcome.locked;
        if (isRateLimitError(e)) {
          if (++rateTries > 6) return _Outcome.failed;
          out.add(_p(CompoundPhase.waiting,
              'The network asked us to slow down. Waiting a moment…',
              sent: sent, total: total, waitSeconds: rateLimitWait.inSeconds));
          await env.pause(rateLimitWait);
          continue;
        }
        // The node did not answer in time, or says it already has this send:
        // either way an earlier try may have gone through.
        if (isTimeoutError(e) || isAlreadyHandledError(e)) {
          // The node may have counted this send: count it against the pace too.
          pacer.record(address, env.now());
          return _Outcome.unknown;
        }
        if (isConnectionError(e)) {
          if (++connectionTries > 3) return _Outcome.failed;
          out.add(_p(CompoundPhase.waiting,
              'Lost contact with the node. Trying again…',
              sent: sent, total: total, waitSeconds: 5 * connectionTries));
          await env.pause(Duration(seconds: 5 * connectionTries));
          continue;
        }
        if (isTooNewError(e) || isNotEnoughFundsError(e)) return _Outcome.tooNew;
        return _Outcome.failed;
      }
    }
  }
}
