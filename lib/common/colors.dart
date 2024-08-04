import 'package:flutter/material.dart';

class MyColors {
  static const Color transparent = Color(0x00000000);
  static const Color secondaryColor = Color(0xFFFFD700);
  static const Color textDarkPrimary = Color(0xDE000000);
  static const Color textDarkInverse = Color(0xFFCC0000);
  static const Color textDarkSecondaryTrue = Color(0x8A000000);
  static const Color textDarkDisabled = Color(0x61000000);
  static const Color textLightPrimary = Color(0xFFFFFFFF);
  static const Color textLightInverse = Color(0xFFFFD700);
  static const Color textLightSecondary = Color(0xB2FFFFFF);
  static const Color textLightDisabled = Color(0x80FFFFFF);
  static const Color buttonColor = Color(0xFF757575);
  static const Color backgroundColorLight = Color(0xFFFFFFFF);
  static const Color backgroundColorCardsLight = Color(0xFFE2E2E2);

  static const List<Color> availablePrimaryColors = [
    Color(0xFF831928),
    Color(0xFF232D53),
    Color(0xFFC62828),
    Color(0xFFAD1457),
    Color(0xFF4527A0),
    Color(0xFF1565C0),
    Color(0xFF00796B),
    Color(0xFF2E7D32),
    Color(0xFFD84315),
    Color(0xFF4E342E),
    Color(0xFF546E7A),
    Color(0xFF757575),
  ];

  static Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
        (c.blue * f).round());
  }

  static Color brighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round());
  }
}
