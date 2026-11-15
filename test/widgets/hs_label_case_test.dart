import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/widgets/hs_kit.dart';

void main() {
  group('button labels written in capitals', () {
    test('ordinary words become normal case', () {
      expect(hsLabelCase('STOP'), 'Stop');
      expect(hsLabelCase('COPY ADDRESS'), 'Copy address');
      expect(hsLabelCase('TEST AGAIN'), 'Test again');
    });
    test('acronyms are not mangled', () {
      expect(hsLabelCase('OK'), 'OK');
      expect(hsLabelCase('PIN'), 'PIN');
      expect(hsLabelCase('QR'), 'QR');
      expect(hsLabelCase('ENTER PIN'), 'Enter PIN');
      expect(hsLabelCase('SEND HTN'), 'Send HTN');
    });
    test('mixed case and one-letter labels are left alone', () {
      expect(hsLabelCase('Already fine'), 'Already fine');
      expect(hsLabelCase('X'), 'X');
    });
  });
}
