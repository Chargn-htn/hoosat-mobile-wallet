import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/util/friendly_error.dart';

void main() {
  group('errors a person can act on', () {
    test('wallet locked', () {
      expect(friendlyError(Exception('Wallet is locked')),
          contains('locked itself'));
    });
    test('node rate limit', () {
      expect(
          friendlyError('Compound transaction rate limit exceeded for addresses'),
          contains('few transactions per minute'));
    });
    test('coins too new', () {
      expect(
          friendlyError(
              'every input must be at least 1000 DAA score units old'),
          contains('too new'));
    });
    test('spam rule', () {
      expect(friendlyError('Rejected spam tx abc from mempool'),
          contains('too many new coins'));
    });
    test('anything else is still a sentence, never raw text', () {
      final m = friendlyError(Exception('weird internal failure 0xDEAD'));
      expect(m, startsWith('Something went wrong'));
      expect(m.contains('0xDEAD'), isFalse); // the raw text is never shown
    });
  });

  group('a timeout never claims nothing happened', () {
    test('a timeout tells the person to check activity first', () {
      final m = friendlyError(TimeoutException('Request timed out after 60 s'));
      expect(m, contains('may or may not have gone through'));
      expect(m, contains('Check your activity'));
    });
    test('a gRPC "deadline exceeded" is a timeout too, not a blind retry', () {
      expect(isTimeoutError('gRPC Error (code: 4, codeName: DEADLINE_EXCEEDED)'),
          isTrue);
      expect(friendlyError('gRPC Error (code: 4, codeName: DEADLINE_EXCEEDED)'),
          contains('Check your activity'));
    });
  });

  group('a node that answered is not a lost connection', () {
    test('a gRPC-wrapped "already spent" rejection says it may have gone through',
        () {
      const e =
          'gRPC Error (code: 2, codeName: UNKNOWN, message: transaction abc is '
          'already spent by another transaction)';
      expect(isConnectionError(e), isFalse);
      expect(isAlreadyHandledError(e), isTrue);
      expect(friendlyError(e), contains('may have gone through'));
      expect(friendlyError(e), isNot(contains('lost contact')));
    });
    test('another gRPC rejection is not called "lost contact"', () {
      const e = 'gRPC Error (code: 2, message: transaction mass is too high)';
      expect(isConnectionError(e), isFalse);
      expect(friendlyError(e), startsWith('Something went wrong'));
    });
    test('a really unreachable node is still reported as lost contact', () {
      const e = 'gRPC Error (code: 14, codeName: UNAVAILABLE, message: Error '
          'connecting: SocketException)';
      expect(isConnectionError(e), isTrue);
      expect(friendlyError(e), contains('lost contact'));
      expect(friendlyError(e), contains('look at your activity'));
    });
  });

  group('not enough funds is not "too new"', () {
    test('it says there is not enough spendable money, and where to look', () {
      final m = friendlyError('not enough funds to cover the amount and fee');
      expect(m, contains('not enough spendable money'));
      expect(m, isNot(contains('too new')));
      expect(isNotEnoughFundsError('not enough funds'), isTrue);
      expect(isTooNewError('not enough funds'), isFalse);
    });
  });
}
