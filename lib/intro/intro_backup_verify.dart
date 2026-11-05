import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import 'backup_verify_questions.dart';
import 'intro_back_button.dart';
import 'intro_providers.dart';

class IntroBackupVerify extends HookConsumerWidget {
  const IntroBackupVerify({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final introData = ref.watch(introDataProvider);
    final words = introData.mnemonic?.split(' ') ?? const <String>[];

    final random = useMemoized(() => Random());
    final questions = useMemoized(
      () => buildVerifyQuestions(words, random),
      [introData.mnemonic],
    );
    final currentIndex = useState(0);
    final wrongAnswer = useState<String?>(null);

    void goBack() {
      final intro = ref.read(introStateProvider.notifier);
      intro.goBack();
    }

    void finish() {
      final notifier = ref.read(introDataProvider.notifier);
      notifier.complete();
    }

    void selectOption(String option, String correctWord) {
      if (option != correctWord) {
        wrongAnswer.value = option;
        return;
      }
      wrongAnswer.value = null;
      if (currentIndex.value == questions.length - 1) {
        finish();
      } else {
        currentIndex.value += 1;
      }
    }

    if (questions.isEmpty) {
      // Defensive: should never happen in practice (backupSeed always sets
      // a real mnemonic before this screen is reachable), but never leave
      // the user on a dead screen with no way forward if it somehow does.
      return Scaffold(
        backgroundColor: theme.backgroundDark,
        body: SafeArea(
          child: Center(
            child: TextButton(onPressed: goBack, child: const Text('Back')),
          ),
        ),
      );
    }

    final question = questions[currentIndex.value];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.035,
          top: MediaQuery.of(context).size.height * 0.075,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: const IntroBackButton(),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
              alignment: AlignmentDirectional(-1, 0),
              child: Text(
                l10n.verifyBackupTitle,
                style: styles.textStyleHeaderColored,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 15),
              alignment: AlignmentDirectional(-1, 0),
              child: Text(
                l10n.verifyBackupInstruction,
                style: styles.textStyleParagraph,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              l10n.verifyBackupWordPrompt(question.wordIndex + 1),
              style: styles.textStyleHeaderColored,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  for (final option in question.options)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                              color: option == wrongAnswer.value
                                  ? theme.text30
                                  : theme.text10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () =>
                              selectOption(option, question.correctWord),
                          child: Text(
                            option,
                            style: styles.textStyleParagraph,
                          ),
                        ),
                      ),
                    ),
                  if (wrongAnswer.value != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        l10n.verifyBackupWrongAnswer,
                        style: styles.textStyleParagraph,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
