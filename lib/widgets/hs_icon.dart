import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The home-screen icon set (2026-11 redesign): thin custom outline SVGs
/// rather than Material Icons, which have a visibly different stroke
/// weight/style and are not part of the design.
enum HsIcon {
  send,
  receive,
  scan,
  compound,
  settings,
  sun,
  moon,
}

String _svgFor(HsIcon icon, String stroke) {
  switch (icon) {
    case HsIcon.send:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M7 17L17 7" stroke="$stroke" stroke-width="1.9" stroke-linecap="round"/>
  <path d="M9 7h8v8" stroke="$stroke" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''';
    case HsIcon.receive:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M17 7L7 17" stroke="$stroke" stroke-width="1.9" stroke-linecap="round"/>
  <path d="M15 17H7V9" stroke="$stroke" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''';
    case HsIcon.scan:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M4 8V5a1 1 0 011-1h3M20 8V5a1 1 0 00-1-1h-3M4 16v3a1 1 0 001 1h3M20 16v3a1 1 0 01-1 1h-3" stroke="$stroke" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/>
  <rect x="9" y="9" width="6" height="6" rx="1" stroke="$stroke" stroke-width="1.9"/>
</svg>''';
    case HsIcon.compound:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M4 12a8 8 0 0113-6.2M20 12a8 8 0 01-13 6.2" stroke="$stroke" stroke-width="1.9" stroke-linecap="round"/>
  <path d="M17 3v4h-4M7 21v-4h4" stroke="$stroke" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''';
    case HsIcon.settings:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M12 15.3a3.3 3.3 0 100-6.6 3.3 3.3 0 000 6.6z" stroke="$stroke" stroke-width="1.7"/>
  <path d="M19 13c.1-.5.1-1 0-1.5l1.4-1.2-1.4-2.4-1.7.5a5.6 5.6 0 00-1.2-.7L15.8 5.5h-2.8l-.3 2.2c-.4.2-.8.4-1.2.7l-1.7-.5-1.4 2.4L9.8 11.5c-.1.5-.1 1 0 1.5l-1.4 1.2 1.4 2.4 1.7-.5c.4.3.8.5 1.2.7l.3 2.2h2.8l.3-2.2c.4-.2.8-.4 1.2-.7l1.7.5 1.4-2.4z" stroke="$stroke" stroke-width="1.4" stroke-linejoin="round"/>
</svg>''';
    case HsIcon.sun:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <circle cx="12" cy="12" r="4.3" stroke="$stroke" stroke-width="1.6"/>
  <path d="M12 3.5v2.4M12 18.1v2.4M4.5 12H6.9M17.1 12h2.4M6.3 6.3l1.7 1.7M16 16l1.7 1.7M17.7 6.3L16 8M8 16l-1.7 1.7" stroke="$stroke" stroke-width="1.6" stroke-linecap="round"/>
</svg>''';
    case HsIcon.moon:
      return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none">
  <path d="M19 14.2A7.8 7.8 0 019.8 5a8 8 0 1010 10.1c-.3 0-.5-.1-.8-.1z" stroke="$stroke" stroke-width="1.6" stroke-linejoin="round"/>
</svg>''';
  }
}

class HsIconWidget extends StatelessWidget {
  final HsIcon icon;
  final Color color;
  final double size;

  const HsIconWidget({
    super.key,
    required this.icon,
    required this.color,
    this.size = 19,
  });

  @override
  Widget build(BuildContext context) {
    final r = (color.r * 255.0).round() & 0xff;
    final g = (color.g * 255.0).round() & 0xff;
    final b = (color.b * 255.0).round() & 0xff;
    final hex =
        '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}';
    return SvgPicture.string(
      _svgFor(icon, hex),
      width: size,
      height: size,
    );
  }
}
