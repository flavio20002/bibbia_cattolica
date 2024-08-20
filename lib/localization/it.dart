import 'package:bibbia_cattolica/model/chapter_model.dart';

import 'en.dart';

class ItalianLanguage extends DefaultLanguage {
  @override
  String get title => 'Bibbia Cattolica';
  final DefaultHome _home = ItalianHome();
  final DefaultDrawer _drawer = ItalianDrawer();
  final DefaultBible _bible = ItalianBible();
  final DefaultSettings _settings = ItalianSettings();
  @override
  DefaultHome get home => _home;
  @override
  DefaultDrawer get drawer => _drawer;
  @override
  DefaultBible get bible => _bible;
  @override
  DefaultSettings get settings => _settings;
}

class ItalianHome extends DefaultHome {
  @override
  String get oldTestamentTitle => 'Antico Testamento';
  @override
  String get oldTestamentText =>
      '"Per acquistare una saggia educazione, equità, giustizia e rettitudine"';
  @override
  String get oldTestamentBook => 'Proverbi 1,3';
  @override
  String get newTestamentTitle => 'Nuovo Testamento';
  @override
  String get newTestamentText => '"Io sono la via, la verità e la vita"';
  @override
  String get newTestamentBook => 'Giovanni 14,6';
  @override
  String get lecturesTitle => 'Letture del giorno';
  @override
  String get randomVerseTitle => 'Il vento soffia dove vuole…';
  @override
  String randomVerseChapter(ChapterModel chapter) =>
      '${chapter.book.desBook} - capitolo ${chapter.chapterNumber}';
  @override
  String get bookmarksTitle => 'Segnalibri e cronologia';
  @override
  String get bookmarksText =>
      'Visualizza ed organizza i tuoi segnalibri e la cronologia';
  @override
  String get searchTooltip => 'Cerca';
  @override
  String get searchHint => 'Cerca…';
  @override
  String get searchShortQuery => 'Inserisci almeno tre lettere';
  @override
  String get cancel => 'Annulla';
}

class ItalianDrawer extends DefaultDrawer {
  @override
  String get home => 'Home';
  @override
  String get oldTestament => 'Antico Testamento';
  @override
  String get newTestament => 'Nuovo Testamento';
  @override
  String get lectures => 'Letture del giorno';
  @override
  String get bookmarks => 'Segnalibri';
  @override
  String get maps => 'Mappe';
  @override
  String get prayers => 'Preghiere';
  @override
  String get settings => 'Impostazioni';
  @override
  String get credits => 'Crediti';
  @override
  String get guide => 'Guida';
}

class ItalianBible extends DefaultBible {
  @override
  String get italianCei2008 => 'CEI 2008 (Italiano)';
  @override
  String get englishCpdv => 'Cattolica di Pubblico Dominio (Inglese)';
  @override
  String get latinNovaVulgata => 'Nova Vulgata (Latino)';
  @override
  String get books => 'libri';
  @override
  String get chapters => 'capitoli';
  @override
  String get oneChapter => '1 capitolo';
  @override
  String chapterNumber(var chapterNumber) => 'Capitolo $chapterNumber';
}

class ItalianSettings extends DefaultSettings {
  @override
  String get defaultLanguage => 'Lingua di sistema';
  @override
  String get italianLanguage => 'Italiano';
  @override
  String get englishLanguage => 'Inglese';
  @override
  String get generalTitle => 'Generali';
  @override
  String get themeTitle => 'Team';
  @override
  String get themeSubtitle => 'Scegli un tema';
  @override
  String get primaryColorTitle => 'Colore principale';
  @override
  String get primaryColorSubtitle => "Il colore principale dell'applicazione";
  @override
  String get bibleVersionTitle => 'Versione';
  @override
  String get bibleVersionSubtitle => 'Versione della Bibbia';
  @override
  String get languageTitle => 'Lingua';
  @override
  String get languageSubtitle => "Lingua dell'applicazione";
  @override
  String get verseTitle => 'Versetti';
  @override
  String get verseSubtitle => 'Mostra il numero del versetto';
  @override
  String get titlesTitle => 'Titoli';
  @override
  String get titlesSubtitle => 'Mostra i titoli dei paragrafi';
  @override
  String get advancedTitle => 'Avanzate';
  @override
  String get resetSettingsTitle => 'Reimposta preferenze';
  @override
  String get resetSettingsSubtitle => 'Reimposta i valori di default';
}
