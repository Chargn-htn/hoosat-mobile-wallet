import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MainTab { home, accounts, activity, settings }

/// Which of the 4 bottom-bar tabs (Mock4 design) is currently showing.
/// Not autoDispose -- this is the root navigation state for the whole
/// app's main screen, it should persist for the life of the app session.
final mainTabProvider = StateProvider<MainTab>((ref) => MainTab.home);
