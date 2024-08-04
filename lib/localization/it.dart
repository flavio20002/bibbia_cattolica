import 'package:bibbia_cattolica/model/chapter_model.dart';

import 'en.dart';

class ItalianLanguage extends DefaultLanguage {
  String get title => 'Bibbia Cattolica';
  DefaultHome _home = new ItalianHome();
  DefaultDrawer _drawer = new ItalianDrawer();
  DefaultBible _bible = new ItalianBible();
  DefaultSettings _settings = new ItalianSettings();
  DefaultHome get home => _home;
  DefaultDrawer get drawer => _drawer;
  DefaultBible get bible => _bible;
  DefaultSettings get settings => _settings;
}

class ItalianHome extends DefaultHome {
  String get oldTestamentTitle => 'Antico Testamento';
  String get oldTestamentText =>
      '"Per acquistare una saggia educazione, equità, giustizia e rettitudine"';
  String get oldTestamentBook => 'Proverbi 1,3';
  String get newTestamentTitle => 'Nuovo Testamento';
  String get newTestamentText => '"Io sono la via, la verità e la vita"';
  String get newTestamentBook => 'Giovanni 14,6';
  String get lecturesTitle => 'Letture del giorno';
  String get randomVerseTitle => 'Il vento soffia dove vuole…';
  String randomVerseChapter(ChapterModel chapter) =>
      '${chapter.book.desBook} - capitolo ${chapter.chapterNumber}';
  String get bookmarksTitle => 'Segnalibri e cronologia';
  String get bookmarksText =>
      'Visualizza ed organizza i tuoi segnalibri e la cronologia';
  String get searchTooltip => 'Cerca';
  String get searchHint => 'Cerca…';
  String get searchShortQuery => 'Inserisci almeno tre lettere';
  String get cancel => 'Annulla';
}

class ItalianDrawer extends DefaultDrawer {
  String get home => 'Home';
  String get oldTestament => 'Antico Testamento';
  String get newTestament => 'Nuovo Testamento';
  String get lectures => 'Letture del giorno';
  String get bookmarks => 'Segnalibri';
  String get maps => 'Mappe';
  String get prayers => 'Preghiere';
  String get settings => 'Impostazioni';
  String get credits => 'Crediti';
  String get guide => 'Guida';
}

class ItalianBible extends DefaultBible {
  String get italianCei2008 => 'CEI 2008 (Italiano)';
  String get englishCpdv => 'Cattolica di Pubblico Dominio (Inglese)';
  String get latinNovaVulgata => 'Nova Vulgata (Latino)';
  String get books => 'libri';
  String get chapters => 'capitoli';
  String get oneChapter => '1 capitolo';
  String chapterNumber(var chapterNumber) => 'Capitolo $chapterNumber';
}

class ItalianSettings extends DefaultSettings {
  String get defaultLanguage => 'Lingua di sistema';
  String get italianLanguage => 'Italiano';
  String get englishLanguage => 'Inglese';
  String get generalTitle => 'Generali';
  String get themeTitle => 'Team';
  String get themeSubtitle => 'Scegli un tema';
  String get primaryColorTitle => 'Colore principale';
  String get primaryColorSubtitle => "Il colore principale dell'applicazione";
  String get bibleVersionTitle => 'Versione';
  String get bibleVersionSubtitle => 'Versione della Bibbia';
  String get languageTitle => 'Lingua';
  String get languageSubtitle => "Lingua dell'applicazione";
  String get verseTitle => 'Versetti';
  String get verseSubtitle => 'Mostra il numero del versetto';
  String get titlesTitle => 'Titoli';
  String get titlesSubtitle => 'Mostra i titoli dei paragrafi';
  String get advancedTitle => 'Avanzate';
  String get resetSettingsTitle => 'Reimposta preferenze';
  String get resetSettingsSubtitle => 'Reimposta i valori di default';
}
