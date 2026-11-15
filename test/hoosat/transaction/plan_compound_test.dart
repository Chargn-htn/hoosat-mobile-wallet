import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/compound_grouping.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';

Utxo coin(String addr, int i, int amount) => Utxo(
      address: addr,
      outpoint: Outpoint(transactionId: 't$addr$i', index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(amount),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.zero,
        isCoinbase: false,
      ),
    );

/// n coins on [addr], amounts 1..n HTN (so the smallest are the lowest numbers).
List<Utxo> coins(String addr, int n) =>
    [for (var i = 1; i <= n; i++) coin(addr, i, i * 100000000)];

/// What the coin count would be after carrying out [plan].
int afterPlan(List<Utxo> all, List<(String, List<Utxo>)> plan) {
  final merged = {for (final (_, c) in plan) ...c.map((u) => u.outpoint.transactionId)};
  return all.length - merged.length + plan.length;
}

void main() {
  group('how many coins to merge', () {
    test('removing coins costs one extra coin per transaction', () {
      expect(coinsRemovedBy(2), 1);
      expect(coinsRemovedBy(84), 83);
      expect(coinsRemovedBy(85), 83); // 2 transactions: 85 in, 2 out
      expect(coinsRemovedBy(1), 0);
    });
    test('the fewest coins that remove what is needed', () {
      expect(coinsToMergeToRemove(5, available: 100), 6);
      expect(coinsToMergeToRemove(86, available: 96), 88); // 2 transactions
      expect(coinsToMergeToRemove(500, available: 50), 50); // capped
    });
  });

  group('planCompound: a group at or below the target is left alone', () {
    test('10 coins: nothing', () {
      final all = coins('M', 10);
      expect(planCompound(allCoins: all, spendable: all, accountAddresses: {}),
          isEmpty);
    });
    test('1 coin per address stays put', () {
      final all = [coin('A', 1, 5), coin('B', 1, 5)];
      expect(planCompound(allCoins: all, spendable: all, accountAddresses: {}),
          isEmpty);
    });
  });

  group('planCompound: lands on exactly 10, merging the smallest first', () {
    test('11 coins: the 2 smallest merge, leaving 10', () {
      final all = coins('M', 11);
      final plan =
          planCompound(allCoins: all, spendable: all, accountAddresses: {});
      expect(plan, hasLength(1));
      expect(plan.first.$2.map((u) => u.utxoEntry.amount.toInt()),
          [100000000, 200000000]);
      expect(afterPlan(all, plan), 10);
    });

    test('25 coins: the 16 smallest merge, the 9 biggest are untouched', () {
      final all = coins('M', 25);
      final plan =
          planCompound(allCoins: all, spendable: all, accountAddresses: {});
      final merged = plan.expand((p) => p.$2).map((u) => u.utxoEntry.amount.toInt());
      expect(merged.length, 16);
      expect(merged.reduce((a, b) => a > b ? a : b), 1600000000); // 16th smallest
      expect(afterPlan(all, plan), 10);
    });

    test('96 coins on one address: two transactions, ends on 10', () {
      final all = coins('M', 96);
      final plan =
          planCompound(allCoins: all, spendable: all, accountAddresses: {});
      expect(plan, hasLength(2));
      expect(plan.every((p) => p.$2.length >= 2 && p.$2.length <= 84), isTrue);
      expect(afterPlan(all, plan), 10);
    });

    test('a big pile (2000) needs several transactions and never goes past 84',
        () {
      final all = coins('M', 2000);
      final plan =
          planCompound(allCoins: all, spendable: all, accountAddresses: {});
      expect(plan.every((p) => p.$2.length <= 84), isTrue);
      expect(plan.length, greaterThan(20));
    });
  });

  group('planCompound: groups are counted separately', () {
    test('Main (several addresses together) and each account are separate',
        () {
      final all = [
        ...coins('M1', 8), ...coins('M2', 8), // main group: 16 coins -> excess 6
        ...coins('ACC', 30), // account: 30 coins -> excess 20
      ];
      final plan = planCompound(
          allCoins: all, spendable: all, accountAddresses: {'ACC'});
      final byAddr = <String, int>{};
      for (final (a, c) in plan) {
        byAddr.update(a, (n) => n + c.length, ifAbsent: () => c.length);
      }
      // account: merge 21 coins -> 30 - 21 + 1 = 10
      expect(byAddr['ACC'], 21);
      // main: removes 6 coins in total, from its addresses only
      final mainMerged = (byAddr['M1'] ?? 0) + (byAddr['M2'] ?? 0);
      expect(mainMerged, greaterThanOrEqualTo(7));
      // coins never leave their own address
      for (final (a, c) in plan) {
        expect(c.every((u) => u.address == a), isTrue);
      }
    });

    test('a small account is left alone even beside a big Main', () {
      final all = [...coins('M', 40), ...coins('ACC', 3)];
      final plan = planCompound(
          allCoins: all, spendable: all, accountAddresses: {'ACC'});
      expect(plan.every((p) => p.$1 == 'M'), isTrue);
    });
  });

  group('planCompound: coins still maturing count but are not merged', () {
    test('the group has 20 coins but only 5 can be merged right now', () {
      final all = coins('M', 20);
      final spendable = all.take(5).toList(); // only 5 are old enough
      final plan = planCompound(
          allCoins: all, spendable: spendable, accountAddresses: {});
      final merged = plan.expand((p) => p.$2).toList();
      expect(merged.length, 5); // all it can reach (excess is 10)
      expect(merged.every((u) => spendable.contains(u)), isTrue);
    });

    test('nothing to do when the excess is already being handled', () {
      final all = coins('M', 10); // 10 including the maturing ones
      expect(
          planCompound(allCoins: all, spendable: all.take(3).toList(), accountAddresses: {}),
          isEmpty);
    });
  });

  test('totalExcessCoins adds up what is above the target per group', () {
    final all = [...coins('M', 25), ...coins('ACC', 12)];
    expect(totalExcessCoins(all, {'ACC'}, 10), 15 + 2);
  });

  group('tiny coins and a repeatable plan', () {
    test('dust (worth no more than the fee to move it) is left alone', () {
      final dust = [for (var i = 0; i < 40; i++) coin('M', 1000 + i, 5000)];
      final real = coins('M', 30);
      final all = [...real, ...dust];
      final plan = planCompound(
          allCoins: all, spendable: all, accountAddresses: {});
      final merged = {for (final (_, c) in plan) ...c};
      expect(merged.any(isDustCoin), isFalse, reason: 'no dust in any merge');
      // the target counts only real coins: 30 real -> 10, dust untouched
      expect(afterPlan(real, plan), 10);
    });

    test('the "about 10 coins" target does not count dust', () {
      final dust = [for (var i = 0; i < 100; i++) coin('M', 2000 + i, 1)];
      final real = coins('M', 8);
      expect(totalExcessCoins([...real, ...dust], {}, 10), 0,
          reason: '8 real coins are already under the target');
    });

    test('equal groups are ordered the same way every time', () {
      final a = coins('A-addr', 20);
      final b = coins('B-addr', 20);
      List<String> firstAddresses(List<Utxo> all) => [
            for (final (addr, _) in planCompound(
                allCoins: all, spendable: all, accountAddresses: {'A-addr', 'B-addr'}))
              addr
          ];
      final one = firstAddresses([...a, ...b]);
      final two = firstAddresses([...b.reversed, ...a.reversed]);
      expect(one, two);
    });
  });
}
