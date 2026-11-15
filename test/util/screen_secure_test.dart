import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/util/screen_secure.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('network.hoosat.wallet/screen');
  final calls = <(String, Object?)>[];
  var failing = false;

  setUp(() {
    calls.clear();
    failing = false;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add((call.method, call.arguments));
      if (failing) throw PlatformException(code: 'nope');
      return null;
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('on() switches the protection on, off() switches it off', () async {
    await ScreenSecure.on();
    expect(calls, [('secure', true)]);
    await ScreenSecure.off();
    expect(calls, [('secure', true), ('secure', false)]);
    expect(ScreenSecure.holders, 0);
  });

  test('two overlapping screens: the first to close does not switch it off',
      () async {
    await ScreenSecure.on(); // page
    await ScreenSecure.on(); // sheet on top of it
    expect(calls, [('secure', true)]); // asked once, not twice
    await ScreenSecure.off(); // the sheet closes
    expect(calls, [('secure', true)]); // still protected: the page is open
    await ScreenSecure.off(); // the page closes
    expect(calls, [('secure', true), ('secure', false)]);
  });

  test('off() without a matching on() does nothing and never goes negative',
      () async {
    await ScreenSecure.off();
    await ScreenSecure.off();
    expect(calls, isEmpty);
    expect(ScreenSecure.holders, 0);
    await ScreenSecure.on();
    expect(calls, [('secure', true)]);
    await ScreenSecure.off();
  });

  test('a phone that cannot do it does not crash the screen', () async {
    failing = true;
    await ScreenSecure.on();
    await ScreenSecure.off();
    expect(ScreenSecure.holders, 0);
  });

  testWidgets('SecureScreen protects while it is in the tree, and only then',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: SecureScreen(child: Text('secret phrase here'))));
    expect(calls, [('secure', true)]);
    expect(find.text('secret phrase here'), findsOneWidget);

    await tester.pumpWidget(const MaterialApp(home: Text('somewhere else')));
    expect(calls, [('secure', true), ('secure', false)]);
    expect(ScreenSecure.holders, 0);
  });
}
