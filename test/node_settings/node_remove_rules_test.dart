import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hoosat_mobile/database/boxes/generic_box.dart';
import 'package:hoosat_mobile/hoosat/hoosat.dart';
import 'package:hoosat_mobile/node_settings/node_settings_notifier.dart';
import 'package:hoosat_mobile/node_settings/node_types.dart';
import 'package:hoosat_mobile/settings/settings_repository.dart';

void main() {
  late NodeSettingsNotifier notifier;
  late Directory tempDir;

  const custom = NodeConfig(
    id: 'custom-1',
    name: 'My node',
    urls: ['192.0.2.10:42420'],
    isDns: false,
    isSecure: false,
    network: HoosatNetwork.mainnet,
  );

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('node_remove_test');
    Hive.init(tempDir.path);
    final box = await Hive.openBox('node_remove_test');
    notifier = NodeSettingsNotifier(SettingsRepository(GenericBox(box)));
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  test('the built-in mainnet node can never be removed', () async {
    await notifier.addOption(custom);
    await notifier.updateSelected(custom); // even when it is not in use
    expect(await notifier.removeOption(mainnetNodeConfig), isFalse);
    expect(notifier.state.options, contains(mainnetNodeConfig));
  });

  test('the node in use cannot be removed', () async {
    await notifier.addOption(custom);
    await notifier.updateSelected(custom);
    expect(await notifier.removeOption(custom), isFalse);
    expect(notifier.state.options, contains(custom));
  });

  test('an added node that is not in use can be removed', () async {
    await notifier.addOption(custom);
    expect(await notifier.removeOption(custom), isTrue);
    expect(notifier.state.options, isNot(contains(custom)));
  });
}
