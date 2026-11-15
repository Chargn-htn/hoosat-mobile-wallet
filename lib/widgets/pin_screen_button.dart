import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class PinScreenButton extends ConsumerWidget {
  final String text;
  final double size;
  final void Function(String text) onTap;

  const PinScreenButton({
    Key? key,
    required this.text,
    this.size = 100,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    // Soft round key with a bold white digit, like the rest of the wallet.
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(8),
      child: Material(
        color: theme.backgroundDark,
        shape: CircleBorder(side: BorderSide(color: theme.text10)),
        child: InkWell(
          customBorder: const CircleBorder(),
          highlightColor: theme.primary15,
          splashColor: theme.primary30,
          onTap: () => onTap(text),
          child: Container(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: theme.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
