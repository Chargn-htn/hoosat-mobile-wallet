import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/wallet_address/account_display_name_provider.dart';

void main() {
  test('a contact name wins', () {
    expect(
        displayLabelFor(
            contactName: '@bob',
            accountLabel: 'set test1',
            isMain: false,
            mainLabel: 'Main',
            genericName: 'Receive 1'),
        '@bob');
  });
  test('an account the user named shows that name, not "Receive 1"', () {
    expect(
        displayLabelFor(
            accountLabel: 'set test1',
            isMain: false,
            mainLabel: 'Main',
            genericName: 'Receive 1'),
        'set test1');
  });
  test('the main address shows Main', () {
    expect(
        displayLabelFor(isMain: true, mainLabel: 'Main', genericName: 'Receive 0'),
        'Main');
  });
  test('only an unnamed address falls back to the generic name', () {
    expect(
        displayLabelFor(isMain: false, mainLabel: 'Main', genericName: 'Receive 7'),
        'Receive 7');
  });
}
