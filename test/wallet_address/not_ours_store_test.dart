import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hoosat_mobile/database/boxes/generic_box.dart';
import 'package:hoosat_mobile/wallet_address/account_adoption.dart';

void main() {
  late Directory dir;
  late NotOursStore store;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('not_ours_test');
    Hive.init(dir.path);
    store = NotOursStore(GenericBox(await Hive.openBox('not_ours_test')));
  });
  tearDown(() async {
    await Hive.deleteFromDisk();
    await dir.delete(recursive: true);
  });

  test('remembers which accounts are not this wallet\'s, per wallet', () async {
    await store.add('walletA', 'hoosat:x');
    await store.add('walletA', 'hoosat:y');
    await store.add('walletB', 'hoosat:z');
    expect(store.load('walletA'), {'hoosat:x', 'hoosat:y'});
    expect(store.load('walletB'), {'hoosat:z'});
    expect(store.load('walletC'), isEmpty);
  });

  test('adding the same address twice keeps one entry', () async {
    await store.add('w', 'hoosat:x');
    await store.add('w', 'hoosat:x');
    expect(store.load('w'), {'hoosat:x'});
  });
}
