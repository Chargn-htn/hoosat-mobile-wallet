//Settings row with a current value shown under the title
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/setting_item.dart';
import '../widgets/hs_kit.dart';

class DoubleLineItem extends ConsumerWidget {
  final String heading;
  final SettingSelectionItem defaultMethod;
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final bool disabled;

  const DoubleLineItem({
    Key? key,
    required this.heading,
    required this.defaultMethod,
    required this.icon,
    this.iconSize = 24,
    required this.onPressed,
    this.onLongPress,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HsRowTile(
      icon: icon,
      title: heading,
      subtitle: defaultMethod.getDisplayName(context),
      onPressed: onPressed,
      onLongPress: onLongPress,
      disabled: disabled,
    );
  }
}
