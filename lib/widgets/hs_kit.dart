import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';

/// The wallet's one design kit (taken from the Home screen design): the same
/// header, section title, grouped list, dialog button and empty state are used
/// on every page, so the whole app looks like one product.
///
/// Measurements come from the Home screen: side gutter 22, card radius 24,
/// icon tile 44 / radius 13, pill buttons, title weights 800 / 700 / 600.
const double kHsGutter = 22;
const double kHsCardRadius = 24;

/// A round action button used in headers (back, more, filter...).
class HsCircleButton extends ConsumerWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  const HsCircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final button = Material(
      color: theme.backgroundDark,
      shape: CircleBorder(side: BorderSide(color: theme.text10)),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, size: 20, color: theme.text),
        ),
      ),
    );
    return tooltip == null ? button : Tooltip(message: tooltip!, child: button);
  }
}

/// Title of a tab page (Accounts, Activity, Settings): big bold title with an
/// optional round action on the right.
class HsPageHeader extends ConsumerWidget {
  final String title;
  final Widget? trailing;
  const HsPageHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    // The TESTNET corner label sits over the top-right: keep actions clear.
    final clearOfRibbon = ref.watch(networkIdProvider) != 'mainnet';
    return Padding(
      padding: EdgeInsets.fromLTRB(
          kHsGutter, clearOfRibbon ? 44 : 20, kHsGutter, 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: theme.text,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

/// Title of a sub-page (Advanced, Security...): round back button + title.
class HsSubHeader extends ConsumerWidget {
  final String title;
  final VoidCallback onBack;
  final Widget? trailing;
  const HsSubHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.trailing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final clearOfRibbon = ref.watch(networkIdProvider) != 'mainnet';
    return Padding(
      padding: EdgeInsets.fromLTRB(
          kHsGutter, clearOfRibbon ? 40 : 14, kHsGutter, 6),
      child: Row(
        children: [
          HsCircleButton(icon: AppIcons.back, onPressed: onBack),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
                color: theme.text,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

/// A whole sub-page: background, header, and a scrolling body.
class HsSubPage extends ConsumerWidget {
  final String title;
  final VoidCallback onBack;
  final Widget? trailing;
  final Widget child;
  final Widget? bottom;
  const HsSubPage({
    super.key,
    required this.title,
    required this.onBack,
    required this.child,
    this.trailing,
    this.bottom,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Container(
      color: theme.background,
      child: SafeArea(
        child: Column(
          children: [
            HsSubHeader(title: title, onBack: onBack, trailing: trailing),
            Expanded(child: child),
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }
}

/// Small bold title above a group ("Preferences", "Manage").
class HsSectionLabel extends ConsumerWidget {
  final String text;
  const HsSectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(kHsGutter, 20, kHsGutter, 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.5,
          fontWeight: FontWeight.w700,
          color: theme.text,
        ),
      ),
    );
  }
}

/// A short muted sentence between groups (not inside a card).
class HsNote extends ConsumerWidget {
  final String text;
  const HsNote(this.text, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(kHsGutter, 10, kHsGutter, 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 13, height: 1.45, color: theme.text60),
      ),
    );
  }
}

/// The one progress bar: rounded, the app's green on a soft green track.
/// [value] null = "working, no idea how long".
class HsProgressBar extends ConsumerWidget {
  final double? value;
  const HsProgressBar({super.key, this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        color: theme.primary,
        backgroundColor: theme.primary15,
      ),
    );
  }
}

/// One rounded card around a set of rows, with thin dividers between them.
class HsGroup extends ConsumerWidget {
  final List<Widget> children;
  const HsGroup({super.key, required this.children});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        rows.add(Divider(height: 1, thickness: 1, color: theme.text10));
      }
      rows.add(children[i]);
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kHsGutter),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.backgroundDark,
        borderRadius: BorderRadius.circular(kHsCardRadius),
        border: Border.all(color: theme.text10),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: rows),
    );
  }
}

/// A list page body. Pass rows and [HsSectionLabel]s (and old-style
/// [Divider]s, which are ignored): each run of rows becomes one rounded card.
class HsMenuList extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  const HsMenuList({
    super.key,
    required this.children,
    this.padding = const EdgeInsets.only(bottom: 32),
  });

  @override
  Widget build(BuildContext context) {
    final out = <Widget>[];
    var run = <Widget>[];
    void flush() {
      if (run.isNotEmpty) {
        out.add(HsGroup(children: run));
        run = <Widget>[];
      }
    }

    for (final w in children) {
      if (w is Divider) continue;
      if (w is HsSectionLabel || w is HsNote) {
        flush();
        out.add(w);
      } else {
        run.add(w);
      }
    }
    flush();
    return ListView(primary: false, padding: padding, children: out);
  }
}

/// The look of a list row: soft icon tile, bold title, muted subtitle, arrow.
class HsRowTile extends ConsumerWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool disabled;
  final bool showChevron;
  final Widget? trailing;
  const HsRowTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onPressed,
    this.onLongPress,
    this.disabled = false,
    this.showChevron = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final tint = disabled ? theme.primary45 : theme.primary;
    return IgnorePointer(
      ignoring: disabled,
      child: InkWell(
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.primary15,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(icon, size: 22, color: tint),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                        color: disabled ? theme.text45 : theme.text,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.35,
                          color: theme.text60,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (showChevron)
                Icon(Icons.chevron_right, size: 20, color: theme.text45),
            ],
          ),
        ),
      ),
    );
  }
}

/// A dialog button: a filled pill for the main action, an outlined pill for
/// the others. Labels are Title Case, never ALL CAPS.
class HsDialogButton extends ConsumerWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool primary;
  const HsDialogButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final enabled = onPressed != null;
    final fill = primary ? (enabled ? theme.primary : theme.primary30) : null;
    return Material(
      color: fill ?? Colors.transparent,
      shape: StadiumBorder(
        side: primary
            ? BorderSide.none
            : BorderSide(
                color: enabled ? theme.primary : theme.text20,
                width: 1.5,
              ),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onPressed,
        child: Container(
          height: 46,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w700,
                color: primary
                    ? (theme.isLightTheme ? Colors.white : theme.background)
                    : (enabled ? theme.primary : theme.text30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// "STOP" -> "Stop", "Compound" -> "Compound": dialog button labels were
/// written in capitals; the new style uses normal capitalisation.
String hsLabelCase(String s) {
  final t = s.trim();
  if (t.length < 2) return t;
  if (t != t.toUpperCase()) return t; // already mixed case: leave it
  final words = t.split(RegExp(r'\s+'));
  // Acronyms stay as written ("OK", "PIN", "QR", "HTN"): "Ok" / "Pin" / "Htn"
  // would be wrong.
  if (words.length == 1 && _keepUpper.contains(words.first)) return t;
  return [
    for (var i = 0; i < words.length; i++)
      _keepUpper.contains(words[i])
          ? words[i]
          : (i == 0
              ? words[i][0] + words[i].substring(1).toLowerCase()
              : words[i].toLowerCase()),
  ].join(' ');
}

const _keepUpper = {
  'OK', 'PIN', 'QR', 'HTN', 'USD', 'NZD', 'EUR', 'ID', 'NFC', 'URL', 'TXID',
  'UTXO', 'UTXOS', 'RPC', 'DAA', 'CSV', 'PDF',
};

/// A friendly empty state: dashed card, soft icon tile, title, one sentence.
class HsEmptyState extends ConsumerWidget {
  final IconData icon;
  final String title;
  final String message;
  const HsEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kHsGutter, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kHsCardRadius),
        border: Border.all(color: theme.text15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: theme.primary15,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, size: 26, color: theme.primary),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
              color: theme.text,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.5, height: 1.45, color: theme.text60),
          ),
        ],
      ),
    );
  }
}
