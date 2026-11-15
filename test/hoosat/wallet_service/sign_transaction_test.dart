import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/hoosat/transaction/txscript.dart';

/// A signer with two real keys (so signatures can be verified) that counts how
/// it is asked to sign.
class _CountingSigner implements SignerBase {
  final keys = <String, Uint8List>{}; // address -> private key
  String? shortFor; // when set, signMany returns one signature too few for it
  int singleCalls = 0;
  final manyCalls = <(String, int)>[]; // (address, how many hashes)

  @override
  Future<bool> canSignForAddress(Address address) async =>
      keys.containsKey(address.encoded);

  @override
  Future<Uint8List> sign(Uint8List data, Address address) async {
    singleCalls++;
    return signSchnorr(hash: data, privateKey: keys[address.encoded]!);
  }

  @override
  Future<List<Uint8List>> signMany(List<Uint8List> data, Address address) async {
    manyCalls.add((address.encoded, data.length));
    final signatures = [
      for (final d in data)
        signSchnorr(hash: d, privateKey: keys[address.encoded]!),
    ];
    if (shortFor == address.encoded) signatures.removeLast();
    return signatures;
  }
}

final _seedHex = [for (var i = 0; i < 64; i++) ((i * 37 + 11) & 0xff).toRadixString(16).padLeft(2, '0')].join();
final _wallet = HdWallet.forSeedHex(_seedHex, type: HdWalletType.schnorr);
KeyPair _key(int index) => _wallet.deriveKeyPair(typeIndex: 0, index: index);

void main() {
  late _CountingSigner signer;
  late WalletService service;
  late Address a;
  late Address b;
  late Uint8List pubA;
  late Uint8List pubB;

  setUp(() {
    signer = _CountingSigner();
    final kpA = _key(1);
    final kpB = _key(2);
    pubA = kpA.publicKey;
    pubB = kpB.publicKey;
    a = Address.publicKey(prefix: AddressPrefix.hoosat, publicKey: pubA);
    b = Address.publicKey(prefix: AddressPrefix.hoosat, publicKey: pubB);
    signer.keys[a.encoded] = kpA.privateKey;
    signer.keys[b.encoded] = kpB.privateKey;
    service = WalletService(signer: signer, client: VoidHoosatClient());
  });

  Transaction tx(List<Address> inputAddresses) => Transaction(
        version: 0,
        inputs: [
          for (var i = 0; i < inputAddresses.length; i++)
            TxInput(
              address: inputAddresses[i],
              previousOutpoint: Outpoint(
                  transactionId: List.filled(32, (i + 1) & 0xff)
                      .map((e) => e.toRadixString(16).padLeft(2, '0'))
                      .join(),
                  index: i),
              signatureScript: Uint8List(64 + 2),
              sequence: Int64.ZERO,
              sigOpCount: 1,
              utxoEntry: UtxoEntry(
                amount: BigInt.from(100000000 + i),
                scriptPublicKey: payToAddressScript(inputAddresses[i]),
                blockDaaScore: BigInt.from(1000),
                isCoinbase: false,
              ),
            ),
        ],
        outputs: [
          TxOutput(
              value: Int64(100000),
              scriptPublicKey: payToAddressScript(inputAddresses.first)),
        ],
        lockTime: Int64.ZERO,
        subnetworkId: kSubnetworkIdNative,
        gas: Int64.ZERO,
      );

  /// every input's script must be [len+1][signature][hashType] and the
  /// signature must verify against the sighash with the right public key
  void expectValid(Transaction t, List<Uint8List> pubKeys) {
    final reused = SighashReusedValues();
    for (var i = 0; i < t.inputs.length; i++) {
      final script = t.inputs[i].signatureScript;
      expect(script[0], 65, reason: 'input $i: length byte');
      expect(script[65], SigHashType.sigHashAll.raw, reason: 'input $i: hash type');
      final sig = script.sublist(1, 65);
      final hash = calculateSignatureHashSchnorr(
        tx: t,
        inputIndex: i,
        hashType: SigHashType.sigHashAll,
        sighashReusedValues: reused,
      );
      expect(
        verifySchnorr(
            publicKey: bytesToHex(pubKeys[i]),
            hash: bytesToHex(hash),
            signature: bytesToHex(sig)),
        isTrue,
        reason: 'input $i: signature does not verify',
      );
    }
  }

  test('a merge (84 coins, one address) asks the signer ONCE for all 84', () async {
    final t = tx(List.filled(84, a));
    await service.signTransaction(t);
    expect(signer.singleCalls, 0);
    expect(signer.manyCalls, [(a.encoded, 84)]);
    expectValid(t, List.filled(84, pubA));
  });

  test('coins from two addresses: one call per address, signatures land on the right inputs',
      () async {
    final order = [a, b, a, a, b, b, a];
    final t = tx(order);
    await service.signTransaction(t);
    expect(signer.singleCalls, 0);
    expect(signer.manyCalls.length, 2);
    expect(signer.manyCalls.toSet(), {(a.encoded, 4), (b.encoded, 3)});
    expectValid(t, [for (final x in order) x == a ? pubA : pubB]);
  });

  test('a single input still works', () async {
    final t = tx([b]);
    await service.signTransaction(t);
    expectValid(t, [pubB]);
  });

  test('a signature made for the wrong key does NOT verify (the check can fail)',
      () async {
    final t = tx([a, a]);
    await service.signTransaction(t);
    final reused = SighashReusedValues();
    final hash = calculateSignatureHashSchnorr(
        tx: t,
        inputIndex: 0,
        hashType: SigHashType.sigHashAll,
        sighashReusedValues: reused);
    expect(
      verifySchnorr(
          publicKey: bytesToHex(pubB),
          hash: bytesToHex(hash),
          signature: bytesToHex(t.inputs[0].signatureScript.sublist(1, 65))),
      isFalse,
    );
  });

  test('a short result from the signer leaves the transaction completely unsigned',
      () async {
    final t = tx([a, a, b, b]);
    signer.shortFor = b.encoded; // the SECOND group comes back one signature short
    await expectLater(service.signTransaction(t), throwsA(isA<StateError>()));
    for (final input in t.inputs) {
      // nothing was written, not even for address A whose signatures were fine
      expect(input.signatureScript.every((byte) => byte == 0), isTrue);
    }
  });
}
