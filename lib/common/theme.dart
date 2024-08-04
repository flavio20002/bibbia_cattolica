import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static TextStyle myTitle(BuildContext context) {
    return TextStyle(
        fontSize: 18.0,
        color: MyColors.textDarkInverse,
        fontWeight: FontWeight.bold);
  }

  static appTheme(context) {
    Color primaryColor = AppState.of(context).primaryColor;
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
      ),
      accentColor: Colors.cyan[600],
      toggleableActiveColor: primaryColor,
      // textTheme: Theme.of(context).textTheme.apply(
      //       fontSizeFactor: 1.5,
      //     ),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18.0),
        bodyText2: TextStyle(fontSize: 18.0),
        subtitle1: TextStyle(fontSize: 20.0),
        button: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
