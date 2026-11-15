import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/transaction/types.dart';
import 'package:hoosat_mobile/settings_advanced/compound_advice.dart';

Utxo coin(String addr, int i, {int daa = 0}) => Utxo(
      address: addr,
      outpoint: Outpoint(transactionId: 't$addr$i', index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(1000000000),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.from(daa),
        isCoinbase: false,
      ),
    );

CompoundAdvice advise(List<Utxo> all, List<Utxo> spendable,
        {Set<String> accounts = const {}, int score = 100000}) =>
    adviseCompound(
      allCoins: all,
      spendable: spendable,
      accountAddresses: accounts,
      score: BigInt.from(score),
      daaPerSecond: 4,
    );

void main() {
  group('what Compound says, in plain words', () {
    test('many coins: ready, with the real fee', () {
      final coins = [for (var i = 0; i < 25; i++) coin('M', i)];
      final a = advise(coins, coins);
      expect(a.situation, CompoundSituation.ready);
      expect(a.canCompound, isTrue);
      // 25 coins, keep 10: the 16 smallest merge into one, 15 coins disappear
      expect(a.coinsToMerge, 16);
      expect(a.transactions, 1);
      expect(a.fee, BigInt.from(16) * kFeePerInput); // 0.0016 HTN
      expect(a.message, contains('0.0016 HTN'));
      expect(a.message, contains('16 smallest coins in 1 transaction'));
      expect(a.message, contains('about 10 coins per account'));
    });

    test('a big wallet needs several transactions', () {
      final coins = [for (var i = 0; i < 200; i++) coin('M', i)];
      final a = advise(coins, coins);
      expect(a.transactions, 3); // 84 + 84 + 32
    });

    test('10 coins or fewer: nothing to do, said in plain words', () {
      final coins = [for (var i = 0; i < 10; i++) coin('M', i)];
      final a = advise(coins, coins);
      expect(a.situation, CompoundSituation.healthy);
      expect(a.canCompound, isFalse);
      expect(a.message, contains('10 coins or fewer'));
      expect(a.message, contains('nothing to merge'));
    });

    test('the healthy message does not count the whole wallet', () {
      // 10 on Main + 10 on each of two accounts = 30 coins, but every group
      // is at its target, so nothing is wrong
      final coins = [
        for (var i = 0; i < 10; i++) coin('M', i),
        for (var i = 0; i < 10; i++) coin('A1', i),
        for (var i = 0; i < 10; i++) coin('A2', i),
      ];
      final a = advise(coins, coins, accounts: {'A1', 'A2'});
      expect(a.situation, CompoundSituation.healthy);
      expect(a.message, isNot(contains('30')));
    });

    test('coins still maturing: says when, instead of "too few"', () {
      // 25 coins on Main, but all younger than 1000 units at score 100000
      final coins = [for (var i = 0; i < 25; i++) coin('M', i, daa: 99500)];
      final a = advise(coins, const []);
      expect(a.situation, CompoundSituation.maturing);
      expect(a.message, contains('still too new'));
      expect(a.message, anyOf(contains('minute')));
    });

    test('a handful of coins on separate addresses: nothing to do', () {
      final coins = [coin('A', 0), coin('B', 0), coin('C', 0)];
      final a = advise(coins, coins);
      expect(a.canCompound, isFalse);
    });

    test('a single coin: nothing to merge', () {
      final coins = [coin('A', 0)];
      final a = advise(coins, coins);
      expect(a.situation, CompoundSituation.nothing);
    });

    test('many coins but one per address: says why it cannot merge', () {
      // coins only merge within their own address
      final coins = [for (var i = 0; i < 15; i++) coin('ADDR$i', 0)];
      final a = advise(coins, coins);
      expect(a.situation, CompoundSituation.nothing);
      expect(a.message, contains('different address'));
    });

    test('an account with a few coins is left alone', () {
      final coins = [
        for (var i = 0; i < 3; i++) coin('ACC', i),
        coin('M', 0),
      ];
      final a = advise(coins, coins, accounts: {'ACC'});
      expect(a.canCompound, isFalse);
    });

    test('only the big group is merged; the small account is not counted in', () {
      final coins = [
        for (var i = 0; i < 25; i++) coin('M', i),
        for (var i = 0; i < 3; i++) coin('ACC', i),
      ];
      final a = advise(coins, coins, accounts: {'ACC'});
      expect(a.situation, CompoundSituation.ready);
      expect(a.coinsToMerge, 16); // Main only
    });
  });
}
