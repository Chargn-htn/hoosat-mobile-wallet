import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/hoosat/transaction/move_to_main_grouping.dart';
import 'package:hoosat_mobile/wallet_address/account_adoption.dart';
import 'package:hoosat_mobile/wallet_balance/main_balance.dart';

Utxo coin(String address, String tx, int amount) => Utxo(
      address: address,
      outpoint: Outpoint(transactionId: tx, index: 0),
      utxoEntry: UtxoEntry(
        amount: BigInt.from(amount),
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.from(1),
        isCoinbase: false,
      ),
    );

const qp4a =
    'hoosat:qp4ad2eh72xc8dtjjyz4llxzq9utn6k26uyl644xxw70wskdfl85zsqj9k4vz';
const qr4c =
    'hoosat:qpzyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyguuhlqeac';

class FakeGenerator extends HdAddressGenerator {
  final List<String> pattern;
  FakeGenerator(this.pattern);
  @override
  Address get mainAddress => Address.decodeAddress(pattern.first);
  @override
  Future<Address> addressAtIndex(
          {required int typeIndex, required int index}) async =>
      Address.decodeAddress(pattern[index % pattern.length]);
}

void main() {
  group('Main = Total minus the accounts', () {
    test('Main is what is left after the accounts', () {
      final main = mainBalanceOf(Amount.raw(BigInt.from(1000)),
          [Amount.raw(BigInt.from(300)), Amount.raw(BigInt.from(50))]);
      expect(main.raw, BigInt.from(650));
    });
    test('with no accounts Main is the whole total', () {
      expect(mainBalanceOf(Amount.raw(BigInt.from(1000)), []).raw,
          BigInt.from(1000));
    });
    test('never goes negative', () {
      expect(
          mainBalanceOf(Amount.raw(BigInt.from(10)),
              [Amount.raw(BigInt.from(30))]).raw,
          BigInt.zero);
    });
  });

  group('what each Send "From" choice can spend', () {
    final coins = [
      coin('M', 't1', 10),
      coin('X', 't2', 20), // a non-account address
      coin('A', 't3', 30), // account address
    ];
    test('Any = everything', () {
      expect(
          spendableForFrom(coins,
                  fromAddress: null, mainAddress: 'M', accountAddresses: {'A'})
              .length,
          3);
    });
    test('Main = everything except account coins', () {
      final r = spendableForFrom(coins,
          fromAddress: 'M', mainAddress: 'M', accountAddresses: {'A'});
      expect(r.map((u) => u.address).toSet(), {'M', 'X'});
    });
    test('an account = only its own address', () {
      final r = spendableForFrom(coins,
          fromAddress: 'A', mainAddress: 'M', accountAddresses: {'A'});
      expect(r.map((u) => u.address), ['A']);
    });
  });

  test('Move to Main never sweeps a named account', () {
    final big = 10000000000; // well over the dust floor
    final chunks = groupUtxosForMoveToMain(
      [coin('M', 't1', big), coin('X', 't2', big), coin('A', 't3', big)],
      mainAddress: 'M',
      excludeAddresses: {'A'},
    );
    expect(chunks.map((c) => c.$1), ['X']);
  });

  group('finding out whether an account address belongs to this wallet', () {
    test('found: returns its index', () async {
      final idx = await findReceiveIndex(FakeGenerator([qp4a, qr4c]), qr4c,
          searchTo: 80);
      expect(idx, 1);
    });
    test('not found: null', () async {
      final idx = await findReceiveIndex(FakeGenerator([qp4a]), qr4c,
          searchTo: 80);
      expect(idx, isNull);
    });
  });
}
