import 'dart:convert';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';

/// The signature hash is what the wallet signs. These tests compare it with
/// the answer from HTND's OWN code (consensushashing.CalculateSignatureHashSchnorr),
/// computed once for the identical transaction by a small separate Go program
/// that uses HTND as a read-only library.
///
/// The transaction: 1 input (outpoint 0102..20 : 1, amount 5 HTN, P2PK script
/// 0x20 <a1..c0> 0xac), 2 outputs (3 HTN to another key, 1.9999 HTN back),
/// version 0, lock time 0, sequence 0, sigOpCount 1, gas 0.
///
/// To re-derive the three values: call CalculateSignatureHashSchnorr (HTND v2,
/// domain/consensus/utils/consensushashing/calculate_signature_hash.go) on that
/// transaction with the native subnetwork and no payload, with the data
/// subnetwork and the JSON `{"app":"example","v":1,"n":42}`, and with the data
/// subnetwork and an empty payload.
const _nativeNoPayload =
    'fb29202a50bef84eb76269c4db7882c255d1f73d9badd875864d5e39b7d82fcd';
const _dataJson =
    '3f14b4a0f047b3767fec7dd0f431ab5d76d26335a0def8d40c88e2f51de18345';
const _dataEmpty =
    'e2ff7745332b389ca674c55b29480bc98295ebdf93aa1735fbc7dc6c4a3ec165';

Uint8List _script(int firstByte) => Uint8List.fromList(
    [0x20, for (var i = 1; i <= 32; i++) firstByte + i, 0xac]);

Transaction _tx({required Uint8List subnetwork, Uint8List? payload}) {
  final txid = Uint8List.fromList([for (var i = 0; i < 32; i++) i + 1]);
  final inScript = ScriptPublicKey(scriptPublicKey: _script(0xa0), version: 0);
  return Transaction(
    version: 0,
    inputs: [
      TxInput(
        address: Address.publicKey(
            prefix: AddressPrefix.hoosat, publicKey: Uint8List(32)),
        previousOutpoint: Outpoint(transactionId: bytesToHex(txid), index: 1),
        signatureScript: Uint8List(0),
        sequence: Int64.ZERO,
        sigOpCount: 1,
        utxoEntry: UtxoEntry(
          amount: BigInt.from(500000000),
          scriptPublicKey: inScript,
          blockDaaScore: BigInt.from(123456),
          isCoinbase: false,
        ),
      ),
    ],
    outputs: [
      TxOutput(
          value: Int64(300000000),
          scriptPublicKey:
              ScriptPublicKey(scriptPublicKey: _script(0x40), version: 0)),
      TxOutput(value: Int64(199990000), scriptPublicKey: inScript),
    ],
    lockTime: Int64.ZERO,
    subnetworkId: subnetwork,
    gas: Int64.ZERO,
    payload: payload,
  );
}

String _sighash(Transaction tx) => bytesToHex(calculateSignatureHashSchnorr(
      tx: tx,
      inputIndex: 0,
      hashType: SigHashType.sigHashAll,
      sighashReusedValues: SighashReusedValues(),
    ));

void main() {
  final dataSubnetwork = kSubnetworkIdData;

  group('signature hash matches HTND for the same transaction', () {
    test('a normal send (no payload) is unchanged - this is what every send signs',
        () {
      expect(_sighash(_tx(subnetwork: kSubnetworkIdNative)), _nativeNoPayload);
    });

    test('a data transaction with a JSON note commits to the note', () {
      final payload =
          Uint8List.fromList(utf8.encode('{"app":"example","v":1,"n":42}'));
      expect(_sighash(_tx(subnetwork: dataSubnetwork, payload: payload)),
          _dataJson);
    });

    test('a data transaction with an empty note is not the same as a normal one',
        () {
      final h = _sighash(_tx(subnetwork: dataSubnetwork));
      expect(h, _dataEmpty);
      expect(h, isNot(_nativeNoPayload));
    });

    test('changing the note changes the hash (so the note cannot be swapped)',
        () {
      final a = _sighash(_tx(
          subnetwork: dataSubnetwork,
          payload: Uint8List.fromList(utf8.encode('{"n":1}'))));
      final b = _sighash(_tx(
          subnetwork: dataSubnetwork,
          payload: Uint8List.fromList(utf8.encode('{"n":2}'))));
      expect(a, isNot(b));
    });
  });

  group('refuses what the node would never accept', () {
    test('a normal transaction that carries a payload is not signed', () {
      expect(
        () => _sighash(_tx(
            subnetwork: kSubnetworkIdNative,
            payload: Uint8List.fromList(utf8.encode('{"a":1}')))),
        throwsArgumentError,
      );
    });

    test('a normal transaction with an EMPTY payload is still fine', () {
      expect(_sighash(_tx(subnetwork: kSubnetworkIdNative, payload: Uint8List(0))),
          _nativeNoPayload);
    });

    test('a subnetwork id of the wrong length is refused, not signed as normal',
        () {
      expect(() => _sighash(_tx(subnetwork: Uint8List(0))), throwsArgumentError);
      expect(() => _sighash(_tx(subnetwork: Uint8List(3))), throwsArgumentError);
    });
  });

  group('one shared cache for all inputs', () {
    test('every input of a data transaction signs the same payload hash', () {
      final payload = Uint8List.fromList(utf8.encode('{"app":"example","v":1,"n":42}'));
      final tx = _tx(subnetwork: dataSubnetwork, payload: payload);
      final shared = SighashReusedValues();
      final withShared = bytesToHex(calculateSignatureHashSchnorr(
        tx: tx,
        inputIndex: 0,
        hashType: SigHashType.sigHashAll,
        sighashReusedValues: shared,
      ));
      // asking again with the SAME cache (as signing a second input would)
      final again = bytesToHex(calculateSignatureHashSchnorr(
        tx: tx,
        inputIndex: 0,
        hashType: SigHashType.sigHashAll,
        sighashReusedValues: shared,
      ));
      expect(again, withShared);
      expect(withShared, _dataJson); // and it is still the node's value
    });
  });
}
