import 'package:bibbia_cattolica/common/bibles.dart';
import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/common/preferences.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/services/database_service.dart';
import 'package:bibbia_cattolica/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AppState extends ChangeNotifier {
  PackageInfo? packageInfo;
  late String language;
  late String bibleVersion;
  Color primaryColor = Colors.white;
  Color primaryColorDark = Colors.white;
  late List<ChapterModel> chapters;
  late List<BookModel> books;
  bool isLoading = true;

  static AppState of(BuildContext context) {
    return Provider.of<AppState>(context, listen: false);
  }

  Future<void> load() async {
    isLoading = true;
    await loadPreferences();
    await loadDb();
    await MyLocalizations.loadDataFormats();
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadPreferences() async {
    primaryColor = Color(await PreferencesService.getIntegerPreference(
        MyPreferences.primaryColor, MyColors.availablePrimaryColors[0].value));
    primaryColorDark = MyColors.darken(primaryColor, 25);
    language = await PreferencesService.getStringPreference(
        MyPreferences.language, MyLocalizations.systemLanguage.languageCode);
    bibleVersion = await PreferencesService.getStringPreference(
      MyPreferences.bibleVersion,
      Bibles.defaultBible(language),
    );
    packageInfo = await PackageInfo.fromPlatform();
    print(
        'PackageInfo: ${packageInfo!.appName} - ${packageInfo!.version} (${packageInfo!.buildNumber})');
    notifyListeners();
  }

  Future<void> loadDb() async {
    await Future.delayed(Duration(seconds: 2));
    await DatabaseService.init(context, packageInfo!, bibleVersion);
    chapters = await DatabaseService.getAllChapters(language, bibleVersion);
    books = await DatabaseService.getAllBooks(language);
  }
}
