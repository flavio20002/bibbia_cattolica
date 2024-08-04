import 'package:bibbia_cattolica/localization/localization.dart';

class Bibles {
  static const String italianCei2008 = 'italian-cei-2008';
  static const String englishCpdv = 'english-cpdv';
  static const String latinNovaVulgata = 'latin-nova-vulgata';

  static List<String> get bibles {
    return [italianCei2008, englishCpdv, latinNovaVulgata];
  }

  static List<String> biblesDescriptions(context) {
    return [
      MyLocalizations.of(context).values.bible.italianCei2008,
      MyLocalizations.of(context).values.bible.englishCpdv,
      MyLocalizations.of(context).values.bible.latinNovaVulgata
    ];
  }

  static String defaultBible(language) {
    if (language == MyLocalizations.italianLanguage) {
      return italianCei2008;
    } else {
      return englishCpdv;
    }
  }
}
