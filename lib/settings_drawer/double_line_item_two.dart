import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/hs_kit.dart';

class DoubleLineItemTwo extends ConsumerWidget {
  final String heading;
  final String text;
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  final bool disabled;

  const DoubleLineItemTwo({
    Key? key,
    required this.heading,
    required this.text,
    required this.icon,
    this.iconSize = 24,
    required this.onPressed,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HsRowTile(
      icon: icon,
      title: heading,
      subtitle: text,
      onPressed: onPressed,
      disabled: disabled,
    );
  }
}
