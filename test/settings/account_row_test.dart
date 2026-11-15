import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/app_providers.dart';
import 'package:hoosat_mobile/settings_advanced/account_row.dart';
import 'package:hoosat_mobile/themes/hoosat_dark_theme.dart';
import 'package:hoosat_mobile/widgets/hs_kit.dart';

const _addr = 'hoosattest:qqg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3z7sxg9auu';

Widget _rows({String test10Name = 'test10'}) => HsGroup(children: [
      AccountRow(
          label: 'Main',
          address: 'hoosattest:qq3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyg3zyrmzp82nk',
          balance: '2,944,444.3396 THTN',
          onCopy: () {},
          copyTooltip: 'Copy'),
      AccountRow(
          label: test10Name,
          address: _addr,
          balance: '2,844.5634 THTN',
          onCopy: () {},
          copyTooltip: 'Copy',
          trailing: IconButton(
              icon: const Icon(Icons.archive_outlined),
              onPressed: () {},
              visualDensity: VisualDensity.compact,
              constraints: const BoxConstraints.tightFor(width: 40, height: 36),
              padding: EdgeInsets.zero)),
      AccountRow(
          label: 'test20',
          address: 'hoosattest:qqenxvenxvenxvenxvenxvenxvenxvenxvenxvenxvenxvenxvenxx4nu4fa0',
          balance: '89.9552 THTN',
          onCopy: () {},
          copyTooltip: 'Copy'),
      AccountRow(
          label: 'A very long account name that goes on and on',
          address: _addr,
          balance: '1,234,567,890.12345678 THTN',
          onCopy: () {},
          copyTooltip: 'Copy'),
    ]);

Future<void> _shot(WidgetTester tester, String name,
    {required double width, double textScale = 1.0}) async {
  final key = GlobalKey();
  tester.view.physicalSize = Size(width * 3, 900 * 3);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ProviderScope(
    overrides: [themeProvider.overrideWithValue(HoosatDarkTheme())],
    child: MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      builder: (c, child) => MediaQuery(
          data: MediaQuery.of(c).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!),
      home: Scaffold(
        backgroundColor: const Color(0xFF0B0B0C),
        body: RepaintBoundary(
          key: key,
          child: Container(
            color: const Color(0xFF0B0B0C),
            padding: const EdgeInsets.fromLTRB(22, 40, 22, 20),
            alignment: Alignment.topCenter,
            child: _rows(),
          ),
        ),
      ),
    ),
  ));
  await tester.pump(const Duration(milliseconds: 300));
  await tester.runAsync(() async {
    final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final img = await boundary.toImage(pixelRatio: 3);
    final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
    final out = Platform.environment['SHOT_DIR'];
    if (out != null) File('$out/$name.png').writeAsBytesSync(bytes!.buffer.asUint8List());
  });
  expect(tester.takeException(), isNull); // no overflow stripes
}

Future<void> _loadInter() async {
  final loader = FontLoader('Inter')
    ..addFont(Future.value(
        ByteData.sublistView(File('fonts/Inter-Variable.ttf').readAsBytesSync())));
  await loader.load();
}

void main() {
  setUpAll(_loadInter);

  test('short address keeps the prefix and the end', () {
    expect(shortAddress(_addr), 'hoosattest:qqg3…xg9auu');
    expect(shortAddress('hoosat:abc'), 'hoosat:abc');
  });

  testWidgets('rows fit a narrow phone (360) without overflow', (t) async {
    await _shot(t, 'accounts_360', width: 360);
  });
  testWidgets('rows fit a narrow phone with big text (1.3x)', (t) async {
    await _shot(t, 'accounts_360_big', width: 360, textScale: 1.3);
  });
  testWidgets('rows fit a wide phone (411)', (t) async {
    await _shot(t, 'accounts_411', width: 411);
  });
}
