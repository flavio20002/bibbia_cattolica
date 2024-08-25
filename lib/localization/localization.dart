import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture, kDebugMode;
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'en.dart';
import 'it.dart';

class MyLocalizations {
  MyLocalizations(this.locale)
      : values = getLanguageClasses()[locale.languageCode]!();

  final Locale locale;
  final DefaultLanguage values;

  static const String italianLanguage = 'it';
  static const String englishLanguage = 'en';

  static const List<String> _supportedLanguages = [
    englishLanguage,
    italianLanguage,
  ];

  static Locale getSystemLanguage(BuildContext context) {
    List<Locale> locales = View.of(context).platformDispatcher.locales;
    for (var locale in locales) {
      if (_supportedLanguages.contains(locale.languageCode)) {
        return locale;
      }
    }
    return Locale(_supportedLanguages[0]);
  }

  static Future<void> loadDataFormats() async {
    for (var language in _supportedLanguages) {
      await initializeDateFormatting(language, null);
    }
  }

  static List<Locale> get supportedLocales {
    return _supportedLanguages.map((s) => Locale(s)).toList();
  }

  Map<String, String> getLanguages() {
    return Map.fromIterables([""] + _supportedLanguages, [
      values.settings.defaultLanguage,
      values.settings.englishLanguage,
      values.settings.italianLanguage,
    ]);
  }

  static Map<String, Function> getLanguageClasses() {
    return Map.fromIterables(
      _supportedLanguages,
      [
        () => DefaultLanguage(),
        () => ItalianLanguage(),
      ],
    );
  }

  get languageCode {
    return locale.languageCode;
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations)!;
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<MyLocalizations> load(Locale locale) {
    if (kDebugMode) {
      print('Language: ${locale.languageCode}');
    }
    return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
