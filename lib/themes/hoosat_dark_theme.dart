import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_theme.dart';

class HoosatDarkTheme extends BaseTheme {
  // Mock4 home-screen design (2026-11, owner-approved), reskinned across
  // the whole app per the owner's call: one accent, near-black/white
  // backgrounds instead of stark black/white, "colours need to be smooth."
  static const accentGreen = Color(0xFF1FAE66);

  static const teal = Color(0xFF1E7A7A);

  static const greenDark = Color(0xfffc865a);

  static const nearBlackBg = Color(0xFF0B0B0C);
  static const nearBlackCard = Color(0xFF17181A);

  static const blueishGreyDarkest = Color.fromARGB(255, 99, 99, 100);

  static const white = Color(0xffffffff);

  static const black = Color(0xff000000);

  bool isLightTheme = false;

  Color primary = accentGreen;
  Color primary60 = accentGreen.withOpacitySafe(0.6);
  Color primary45 = accentGreen.withOpacitySafe(0.45);
  Color primary30 = accentGreen.withOpacitySafe(0.3);
  Color primary20 = accentGreen.withOpacitySafe(0.2);
  Color primary15 = accentGreen.withOpacitySafe(0.15);
  Color primary10 = accentGreen.withOpacitySafe(0.1);

  Color success = teal;
  Color success60 = teal.withOpacitySafe(0.6);
  Color success30 = teal.withOpacitySafe(0.3);
  Color success15 = teal.withOpacitySafe(0.15);

  Color successDark = greenDark;
  Color successDark30 = greenDark.withOpacitySafe(0.3);

  Color background = nearBlackBg;
  Color background40 = nearBlackBg.withOpacitySafe(0.4);
  Color background00 = nearBlackBg.withOpacitySafe(0.0);

  Color backgroundDark = nearBlackCard;
  Color backgroundDark00 = nearBlackCard.withOpacitySafe(0.0);

  Color backgroundDarkest = blueishGreyDarkest;

  Color text = white.withOpacitySafe(0.92);
  Color text60 = white.withOpacitySafe(0.5);
  Color text45 = white.withOpacitySafe(0.45);
  Color text30 = white.withOpacitySafe(0.3);
  Color text20 = white.withOpacitySafe(0.2);
  Color text15 = white.withOpacitySafe(0.15);
  Color text10 = white.withOpacitySafe(0.1);
  Color text05 = white.withOpacitySafe(0.05);
  Color text03 = white.withOpacitySafe(0.03);

  Color overlay20 = black.withOpacitySafe(0.2);
  Color overlay30 = black.withOpacitySafe(0.3);
  Color overlay50 = black.withOpacitySafe(0.5);
  Color overlay70 = black.withOpacitySafe(0.7);
  Color overlay80 = black.withOpacitySafe(0.8);
  Color overlay85 = black.withOpacitySafe(0.85);
  Color overlay90 = black.withOpacitySafe(0.9);

  Color barrier = black.withOpacitySafe(0.7);
  Color barrierWeaker = black.withOpacitySafe(0.4);
  Color barrierWeakest = black.withOpacitySafe(0.3);
  Color barrierStronger = black.withOpacitySafe(0.85);

  Color animationOverlayMedium = black.withOpacitySafe(0.7);
  Color animationOverlayStrong = black.withOpacitySafe(0.85);

  //Brightness brightness = Brightness.dark;
  SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light;
  SystemUiOverlayStyle statusBar =
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent);

  BoxShadow boxShadow = BoxShadow(color: Colors.transparent);
  BoxShadow boxShadowButton = BoxShadow(color: Colors.transparent);
}
