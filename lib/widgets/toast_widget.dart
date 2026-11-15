import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

/// A short message at the top of the screen: a card with an accent dot, in the
/// same style as every other card in the wallet.
class ToastWidget extends ConsumerWidget {
  final String content;

  const ToastWidget({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return LayoutBuilder(builder: (context, constratins) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        width: constratins.maxWidth,
        decoration: BoxDecoration(
          color: theme.backgroundDark,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: theme.text15),
          boxShadow: [
            BoxShadow(
              color: theme.barrier,
              offset: const Offset(0, 10),
              blurRadius: 24,
              spreadRadius: -6,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 8,
              height: 8,
              decoration:
                  BoxDecoration(color: theme.primary, shape: BoxShape.circle),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: theme.text,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
