import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:hoosat_mobile/intro/backup_verify_questions.dart';

void main() {
  group('buildVerifyQuestions', () {
    final words = List.generate(12, (i) => 'word$i');

    test('returns nothing for an empty word list', () {
      expect(buildVerifyQuestions([], Random(1)), isEmpty);
    });

    test('asks the requested number of distinct questions', () {
      final questions = buildVerifyQuestions(words, Random(1));
      expect(questions, hasLength(3));
      final indices = questions.map((q) => q.wordIndex).toSet();
      expect(indices, hasLength(3)); // no repeated positions
    });

    test('each question has the requested number of options', () {
      final questions = buildVerifyQuestions(words, Random(1));
      for (final q in questions) {
        expect(q.options, hasLength(4));
      }
    });

    test('the correct word always appears exactly once among the options',
        () {
      final questions = buildVerifyQuestions(words, Random(1));
      for (final q in questions) {
        final matches = q.options.where((o) => o == q.correctWord);
        expect(matches, hasLength(1));
      }
    });

    test('options never contain duplicates', () {
      final questions = buildVerifyQuestions(words, Random(2));
      for (final q in questions) {
        expect(q.options.toSet(), hasLength(q.options.length));
      }
    });

    test('correctWord actually matches the mnemonic at wordIndex', () {
      final questions = buildVerifyQuestions(words, Random(3));
      for (final q in questions) {
        expect(words[q.wordIndex], q.correctWord);
      }
    });

    test('gracefully handles a word list shorter than optionCount', () {
      final shortWords = ['alpha', 'beta'];
      final questions = buildVerifyQuestions(shortWords, Random(1));
      for (final q in questions) {
        // Can't offer 4 distinct options from only 2 words -- must not
        // crash or duplicate, just offer however many distinct words exist.
        expect(q.options.toSet(), hasLength(q.options.length));
        expect(q.options.length, lessThanOrEqualTo(shortWords.length));
      }
    });

    test('custom questionCount and optionCount are respected', () {
      final questions = buildVerifyQuestions(
        words,
        Random(1),
        questionCount: 5,
        optionCount: 3,
      );
      expect(questions, hasLength(5));
      for (final q in questions) {
        expect(q.options, hasLength(3));
      }
    });
  });
}
