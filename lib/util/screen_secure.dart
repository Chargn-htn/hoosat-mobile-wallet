import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Blocks screenshots, screen recording and the app-switcher preview while a
/// screen that shows or takes the secret phrase is open (Android FLAG_SECURE).
///
/// It counts the screens that want it: two such screens can overlap (a sheet on
/// top of a page), and closing one must not switch the protection off for the
/// other. If the phone cannot do it (tests, other platforms) nothing happens.
class ScreenSecure {
  static const _channel = MethodChannel('network.hoosat.wallet/screen');
  static int _holders = 0;

  /// How many screens currently ask for the protection (for tests).
  static int get holders => _holders;

  static Future<void> on() async {
    _holders++;
    if (_holders == 1) await _set(true);
  }

  static Future<void> off() async {
    if (_holders == 0) return;
    _holders--;
    if (_holders == 0) await _set(false);
  }

  static Future<void> _set(bool on) async {
    try {
      await _channel.invokeMethod('secure', on);
    } catch (_) {
      // not available: carry on without it
    }
  }
}

/// Wrap a screen that shows or takes the secret phrase: the protection is on
/// for as long as this widget is in the tree.
class SecureScreen extends StatefulWidget {
  const SecureScreen({super.key, required this.child});
  final Widget child;

  @override
  State<SecureScreen> createState() => _SecureScreenState();
}

class _SecureScreenState extends State<SecureScreen> {
  @override
  void initState() {
    super.initState();
    ScreenSecure.on();
  }

  @override
  void dispose() {
    ScreenSecure.off();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
