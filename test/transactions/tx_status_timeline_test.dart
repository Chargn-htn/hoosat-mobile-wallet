import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat_api/types.dart';
import 'package:hoosat_mobile/transactions/transaction_types.dart';
import 'package:hoosat_mobile/transactions/tx_status.dart';

ApiTransaction api({bool accepted = false, int? blue, String? hash}) =>
    ApiTransaction(
      transactionId: 'tx',
      blockTime: 1,
      isAccepted: accepted,
      acceptingBlockBlueScore: blue,
      acceptingBlockHash: hash,
    );

BigInt b(int n) => BigInt.from(n);

String name(TxState s) => s.when(
      unknown: () => 'unknown',
      pending: () => 'pending',
      unconfirmed: () => 'unconfirmed',
      confirming: (c) => 'confirming $c',
      confirmed: () => 'confirmed',
    );

void main() {
  group('one counter for coins that arrive in this wallet (target 1000)', () {
    TxState at(int confirmations, {bool maturing = false}) => decideTxState(
          accepted: true,
          acceptingBlockBlueScore: 5000,
          blueScore: b(5000 + confirmations),
          target: b(1000),
          coinStillMaturing: maturing,
        );

    test('counts up smoothly from 0', () {
      expect(name(at(0)), 'confirming 0');
      expect(name(at(10)), 'confirming 10');
      expect(name(at(250)), 'confirming 250');
      expect(name(at(999)), 'confirming 999');
    });
    test('confirmed only at 1000', () {
      expect(name(at(1000)), 'confirmed');
      expect(name(at(5000)), 'confirmed');
    });
    test('never says confirmed while the coin list still says it cannot be spent', () {
      expect(name(at(1002, maturing: true)), 'confirming 999');
    });
    test('does NOT turn "confirmed" at 100 any more', () {
      expect(name(at(100)), 'confirming 100');
    });
  });

  group('a payment to someone else only (target 100)', () {
    test('confirmed at 100', () {
      TxState at(int c) => decideTxState(
          accepted: true,
          acceptingBlockBlueScore: 100,
          blueScore: b(100 + c),
          target: b(100),
          coinStillMaturing: false);
      expect(name(at(40)), 'confirming 40');
      expect(name(at(100)), 'confirmed');
    });
  });

  group('when the node\'s accepted message was missed', () {
    test('the wallet\'s own coin proves acceptance and gives the count', () {
      final s = decideTxState(
          accepted: false,
          blueScore: b(9000),
          coinAge: b(300),
          target: b(1000),
          coinStillMaturing: true);
      expect(name(s), 'confirming 300');
    });
    test('with no proof at all it stays unconfirmed', () {
      expect(
          name(decideTxState(
              accepted: false,
              blueScore: b(9000),
              target: b(1000),
              coinStillMaturing: false)),
          'unconfirmed');
    });
  });

  group('a slow source can never move the label backwards', () {
    test('an explorer record without acceptance keeps what the node told us', () {
      final known = api(accepted: true, blue: 777, hash: 'abc');
      final slowExplorer = api(accepted: false);
      final merged = keepAcceptance(slowExplorer, known);
      expect(merged.isAccepted, isTrue);
      expect(merged.acceptingBlockBlueScore, 777);
      expect(merged.acceptingBlockHash, 'abc');
    });
    test('newer acceptance info replaces older', () {
      final merged = keepAcceptance(
          api(accepted: true, blue: 900), api(accepted: true, blue: 777));
      expect(merged.acceptingBlockBlueScore, 900);
    });
    test('nothing learned yet: the fresh record is used as is', () {
      expect(keepAcceptance(api(), null).isAccepted, isFalse);
      expect(keepAcceptance(api(), api()).isAccepted, isFalse);
    });
  });

  test('an old, still-unaccepted record is called stale, not "waiting"', () {
    final t0 = DateTime(2026, 11, 13, 12);
    final born = t0.millisecondsSinceEpoch;
    expect(isStaleRecord(born, now: t0.add(const Duration(minutes: 5))), isFalse);
    expect(isStaleRecord(born, now: t0.add(const Duration(minutes: 31))), isTrue);
    expect(isStaleRecord(0, now: t0), isFalse);
  });

  group('old records that still say "not accepted"', () {
    ApiTransaction rec(String id,
            {bool accepted = false, int? blue, int blockTime = 1}) =>
        ApiTransaction(
          transactionId: id,
          blockTime: blockTime,
          isAccepted: accepted,
          acceptingBlockBlueScore: blue,
        );
    final now = DateTime(2026, 11, 15, 21);
    final old = now.subtract(const Duration(hours: 2)).millisecondsSinceEpoch;
    final fresh =
        now.subtract(const Duration(minutes: 5)).millisecondsSinceEpoch;

    test('only OLD, unaccepted records are asked about', () {
      final ids = staleUnacceptedIds([
        rec('old-unaccepted', blockTime: old),
        rec('new-unaccepted', blockTime: fresh),
        rec('old-accepted', accepted: true, blue: 5, blockTime: old),
      ], alreadyAsked: {}, now: now);
      expect(ids, ['old-unaccepted']);
    });

    test('a record is asked about once, and at most 20 at a time', () {
      final many = [for (var i = 0; i < 30; i++) rec('t$i', blockTime: old)];
      expect(staleUnacceptedIds(many, alreadyAsked: {}, now: now).length, 20);
      expect(
          staleUnacceptedIds(many, alreadyAsked: {'t0', 't1'}, now: now).first,
          't2');
    });

    test("the explorer's answer splits into accepted and never-accepted", () {
      final r = sortByAcceptance([
        rec('missed', accepted: true, blue: 77),
        rec('never-accepted'),
        rec('accepted-but-no-block', accepted: true),
      ]);
      expect(r.accepted.map((t) => t.transactionId), ['missed']);
      expect(r.notAccepted, {'never-accepted'});
    });
  });
}
