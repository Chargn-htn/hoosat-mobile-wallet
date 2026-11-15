import 'package:flutter/services.dart';

/// Keeps the phone's screen on while a long job runs (compounding can take
/// many minutes). If the screen turns off the app goes to the background and
/// the wallet locks itself, which would stop the job half way.
class KeepAwake {
  static const _channel = MethodChannel('network.hoosat.wallet/screen');

  static Future<void> on() => _set(true);
  static Future<void> off() => _set(false);

  static Future<void> _set(bool on) async {
    try {
      await _channel.invokeMethod('keepOn', on);
    } catch (_) {
      // not available (tests, other platforms): carry on without it
    }
  }
}
