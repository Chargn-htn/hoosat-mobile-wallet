import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

/// "hoosattest:qzje…xzzgm5": the network prefix and the first four characters
/// after it, then the last six. Short enough to always fit beside the buttons,
/// enough to tell accounts apart at a glance.
String shortAddress(String address) {
  if (address.length <= 22) return address;
  final colon = address.indexOf(':');
  final head = colon < 0 ? 10 : (colon + 5).clamp(0, address.length);
  return '${address.substring(0, head)}…${address.substring(address.length - 6)}';
}

/// One account in the Accounts list.
///
/// Two lines, so a long balance never squeezes the name or the address:
///
///   [icon]  Name ......................... 2,844.5634 THTN
///           hoosattest:qzje…xzzgm5            [copy] [more]
class AccountRow extends ConsumerWidget {
  final String label;
  final String address;
  final String balance;
  final VoidCallback? onTap;
  final VoidCallback onCopy;
  final String copyTooltip;
  final Widget? trailing;

  const AccountRow({
    super.key,
    required this.label,
    required this.address,
    required this.balance,
    required this.onCopy,
    required this.copyTooltip,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.primary15,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(Icons.account_balance_wallet_outlined,
                  size: 22, color: theme.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LayoutBuilder(
                    builder: (context, c) => Row(
                      children: [
                        // The name gives way first (the balance gets at most
                        // 60% of the line and shrinks rather than overflow).
                        Expanded(
                          child: Text(
                            label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w700,
                              color: theme.text,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: c.maxWidth * 0.6),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Text(
                              balance,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                                color: theme.text,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      // The address shrinks a little to fit instead of being cut.
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            shortAddress(address),
                            maxLines: 1,
                            softWrap: false,
                            style:
                                TextStyle(fontSize: 12, color: theme.text60),
                          ),
                        ),
                      ),
                      _SmallIconButton(
                        icon: Icons.copy,
                        color: theme.text60,
                        tooltip: copyTooltip,
                        onPressed: onCopy,
                      ),
                      if (trailing != null) trailing!,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A compact icon button (the default is 48 px, which crowds a list row).
class _SmallIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onPressed;
  const _SmallIconButton({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(icon, color: color, size: 18),
        tooltip: tooltip,
        onPressed: onPressed,
        visualDensity: VisualDensity.compact,
        constraints: const BoxConstraints.tightFor(width: 40, height: 36),
        padding: EdgeInsets.zero,
      );
}
