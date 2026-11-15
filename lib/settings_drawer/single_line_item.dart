import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/hs_kit.dart';

//Settings row without a value, opens a page or runs an action
class SingleLineItem extends ConsumerWidget {
  final String heading;
  final IconData settingIcon;
  final double iconSize;
  final VoidCallback? onPressed;

  const SingleLineItem({
    Key? key,
    required this.heading,
    required this.settingIcon,
    this.iconSize = 24,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HsRowTile(
      icon: settingIcon,
      title: heading,
      onPressed: () => onPressed?.call(),
    );
  }
}
