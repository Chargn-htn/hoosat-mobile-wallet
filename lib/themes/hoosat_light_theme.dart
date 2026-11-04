import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_theme.dart';

class HoosatLightTheme extends BaseTheme {
  // Mock4 home-screen design (2026-11, owner-approved), reskinned across
  // the whole app per the owner's call: one accent, near-black/white
  // backgrounds instead of stark black/white, "colours need to be smooth."
  static const accentGreen = Color(0xFF1FAE66);
  static const accentGreenDarkened = Color(0xFF188850); // darken(accentGreen, 0.22), matching Mock4's own darken() helper exactly

  static const teal = Color(0xFF1E7A7A);

  static const tealLight = Color.fromARGB(255, 104, 168, 168);

  static const white = Color(0xFFFFFFFF);

  static const offWhiteBg = Color(0xFFF6F7F7);
  static const chipBg = Color(0xFFF0F1F1);

  static const nearBlackText = Color(0xFF0A0A0A);
  static const grey = Color(0xFF454868);

  static const black = Color(0xFF000000);

  static const darkDeepTeal = Color(0xFF009688);

  bool isLightTheme = true;

  Color primary = accentGreenDarkened;
  Color primary60 = accentGreen.withOpacitySafe(0.9);
  Color primary45 = accentGreen.withOpacitySafe(0.8);
  Color primary30 = accentGreen.withOpacitySafe(0.6);
  Color primary20 = accentGreen.withOpacitySafe(0.45);
  Color primary15 = accentGreen.withOpacitySafe(0.3);
  Color primary10 = accentGreen.withOpacitySafe(0.2);

  Color success = teal;
  Color success60 = teal.withOpacitySafe(0.6);
  Color success30 = teal.withOpacitySafe(0.3);
  Color success15 = teal.withOpacitySafe(0.15);

  Color successDark = tealLight;
  Color successDark30 = tealLight.withOpacitySafe(0.3);

  Color background = offWhiteBg;
  Color background40 = offWhiteBg.withOpacitySafe(0.4);
  Color background00 = offWhiteBg.withOpacitySafe(0.0);

  Color backgroundDark = white;
  Color backgroundDark00 = white.withOpacitySafe(0.0);

  Color backgroundDarkest = chipBg;

  Color text = nearBlackText;
  Color text60 = grey.withOpacitySafe(0.6);
  Color text45 = grey.withOpacitySafe(0.45);
  Color text30 = grey.withOpacitySafe(0.3);
  Color text20 = grey.withOpacitySafe(0.2);
  Color text15 = grey.withOpacitySafe(0.15);
  Color text10 = grey.withOpacitySafe(0.1);
  Color text05 = grey.withOpacitySafe(0.05);
  Color text03 = grey.withOpacitySafe(0.03);

  Color overlay90 = black.withOpacitySafe(0.9);
  Color overlay85 = black.withOpacitySafe(0.85);
  Color overlay80 = black.withOpacitySafe(0.8);
  Color overlay70 = black.withOpacitySafe(0.70);
  Color overlay50 = black.withOpacitySafe(0.5);
  Color overlay30 = black.withOpacitySafe(0.3);
  Color overlay20 = black.withOpacitySafe(0.2);

  Color barrier = black.withOpacitySafe(0.7);
  Color barrierWeaker = black.withOpacitySafe(0.4);
  Color barrierWeakest = black.withOpacitySafe(0.3);
  Color barrierStronger = black.withOpacitySafe(0.85);

  Color animationOverlayMedium = white.withOpacitySafe(0.7);
  Color animationOverlayStrong = white.withOpacitySafe(0.85);

  //Brightness brightness = Brightness.light;
  SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.dark;
  SystemUiOverlayStyle statusBar =
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent);

  BoxShadow boxShadow = BoxShadow(
    color: darkDeepTeal.withOpacitySafe(0.1),
    offset: Offset(0, 3),
    blurRadius: 15,
  );
  BoxShadow boxShadowButton = BoxShadow(
    color: darkDeepTeal.withOpacitySafe(0.2),
    offset: Offset(0, 3),
    blurRadius: 15,
  );
}
