import 'dart:io';

import 'package:bibbia_cattolica/common/bibles.dart';
import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/common/preferences.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/bible_book.dart';
import 'package:bibbia_cattolica/model/bible_chapter.dart';
import 'package:bibbia_cattolica/services/bible.dart';
import 'package:bibbia_cattolica/services/preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  PackageInfo? packageInfo;
  String language = 'en';
  late String bibleVersion;
  Color primaryColor = Colors.white;
  Color primaryColorDark = Colors.white;
  late List<BibleChapterModel> chapters;
  late List<BibleBookModel> books;
  bool isLoading = true;

  static AppState of(BuildContext context) {
    return Provider.of<AppState>(context, listen: false);
  }

  Future<void> load(BuildContext context) async {
    isLoading = true;
    await loadPreferences(context);
    await loadDb();
    await MyLocalizations.loadDataFormats();
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadPreferences(BuildContext context) async {
    String systemLanguageCode =
        MyLocalizations.getSystemLanguage(context).languageCode;
    primaryColor = Color(await PreferencesService.getIntegerPreference(
        MyPreferences.primaryColor, MyColors.availablePrimaryColors[0].value));
    primaryColorDark = MyColors.darken(primaryColor, 25);
    language = await PreferencesService.getStringPreference(
        MyPreferences.language, systemLanguageCode);
    bibleVersion = await PreferencesService.getStringPreference(
      MyPreferences.bibleVersion,
      Bibles.defaultBible(language),
    );
    if (!Platform.isWindows) {
      packageInfo = await PackageInfo.fromPlatform();
      if (kDebugMode) {
        print(
            'PackageInfo: ${packageInfo!.appName} - ${packageInfo!.version} (${packageInfo!.buildNumber})');
      }
    }

    notifyListeners();
  }

  Future<void> loadDb() async {
    chapters = await BibleService.getAllChapters(language, bibleVersion);
    books = await BibleService.getAllBooks(language);
  }
}
