import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/wallet_balance/main_balance.dart';

const mainAddr =
    'hoosat:qp4ad2eh72xc8dtjjyz4llxzq9utn6k26uyl644xxw70wskdfl85zsqj9k4vz';
const accountAddr =
    'hoosat:qpzyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyguuhlqeac';

Utxo coin(String address, String tx, BigInt amount) => Utxo(
      address: address,
      outpoint: Outpoint(transactionId: tx, index: 0),
      utxoEntry: UtxoEntry(
        amount: amount,
        scriptPublicKey:
            ScriptPublicKey(scriptPublicKey: Uint8List(0), version: 0),
        blockDaaScore: BigInt.zero,
        isCoinbase: false,
      ),
    );

void main() {
  final hoo = kSompiPerHoosat;
  final big = coin(mainAddr, 'big', hoo * BigInt.from(545241));
  final five = coin(accountAddr, 'five', hoo * BigInt.from(5));
  // spendableUtxosProvider sorts largest first
  final all = [big, five];

  List<Utxo> pick(List<Utxo> from) {
    final b = TransactionBuilder(utxos: from);
    b.createUnsignedTransaction(
      toAddress: Address.decodeAddress(accountAddr),
      amountRaw: hoo * BigInt.from(5),
      changeAddress: Address.decodeAddress(mainAddr),
    );
    return b.selectedUtxos;
  }

  test('sending from Main never touches the account\'s coin', () {
    final fromMain = spendableForFrom(all,
        fromAddress: mainAddr, mainAddress: mainAddr, accountAddresses: {accountAddr});
    expect(pick(fromMain).map((u) => u.outpoint.transactionId), ['big']);
  });

  test('"Any" can pull the account\'s coin in (why Main is the default)', () {
    final any = spendableForFrom(all,
        fromAddress: null, mainAddress: mainAddr, accountAddresses: {accountAddr});
    expect(pick(any).map((u) => u.outpoint.transactionId), ['big', 'five']);
  });
}
