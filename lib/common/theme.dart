import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static TextStyle myTitle(BuildContext context) {
    return const TextStyle(
        fontSize: 18.0,
        color: MyColors.textDarkInverse,
        fontWeight: FontWeight.bold);
  }

  static appTheme(context) {
    Color primaryColor = AppState.of(context).primaryColor;
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      // textTheme: Theme.of(context).textTheme.apply(
      //       fontSizeFactor: 1.5,
      //     ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18.0),
        bodyMedium: TextStyle(fontSize: 18.0),
        titleMedium: TextStyle(fontSize: 20.0),
        labelLarge: TextStyle(fontSize: 16.0),
      ),
      colorScheme: ColorScheme.light(
        primary: primaryColor,
      ).copyWith(secondary: Colors.cyan[600]),
      checkboxTheme: CheckboxThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return null;
        }),
        trackColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),
    );
  }
}
