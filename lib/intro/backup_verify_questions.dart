import 'dart:math';

/// One "what is word #N?" multiple-choice question.
class VerifyQuestion {
  final int wordIndex; // 0-based index into the mnemonic
  final String correctWord;
  final List<String> options; // shuffled, includes correctWord exactly once

  const VerifyQuestion({
    required this.wordIndex,
    required this.correctWord,
    required this.options,
  });
}

/// Builds a seed-backup verification quiz from [words] (the user's own
/// mnemonic, already shown to them on the previous screen): picks
/// [questionCount] distinct random word positions, and for each one,
/// [optionCount] shuffled options -- the correct word plus distractors
/// drawn from the mnemonic's *other* words (not an external wordlist,
/// since the user has already seen all of their own words).
List<VerifyQuestion> buildVerifyQuestions(
  List<String> words,
  Random random, {
  int questionCount = 3,
  int optionCount = 4,
}) {
  if (words.isEmpty) {
    return const [];
  }

  final indices = List<int>.generate(words.length, (i) => i)..shuffle(random);
  final chosenIndices = indices.take(min(questionCount, words.length)).toList()
    ..sort();

  return chosenIndices.map((wordIndex) {
    final correctWord = words[wordIndex];

    final distractorPool = [
      for (var i = 0; i < words.length; i++)
        if (i != wordIndex) words[i],
    ]..shuffle(random);
    final distractorCount = min(optionCount - 1, distractorPool.length);
    final distractors = distractorPool.take(distractorCount).toList();

    final options = [correctWord, ...distractors]..shuffle(random);

    return VerifyQuestion(
      wordIndex: wordIndex,
      correctWord: correctWord,
      options: options,
    );
  }).toList();
}
