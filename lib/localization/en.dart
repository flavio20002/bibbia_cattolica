import 'package:bibbia_cattolica/model/chapter_model.dart';

class DefaultLanguage {
  String get title => 'Catholic Bible';
  DefaultHome _home = new DefaultHome();
  DefaultDrawer _drawer = new DefaultDrawer();
  DefaultBible _bible = new DefaultBible();
  DefaultSettings _settings = new DefaultSettings();
  DefaultHome get home => _home;
  DefaultDrawer get drawer => _drawer;
  DefaultBible get bible => _bible;
  DefaultSettings get settings => _settings;
}

class DefaultHome {
  String get oldTestamentTitle => 'Old Testament';
  String get oldTestamentText =>
      '"May receive instruction in wise conduct, in what is right, just and fair"';
  String get oldTestamentBook => 'Proverbs 1,3';
  String get newTestamentTitle => 'New Testament';
  String get newTestamentText => '"I am the way and the truth and the life"';
  String get newTestamentBook => 'John 14,6';
  String get lecturesTitle => 'Daily Reading';
  String get randomVerseTitle => 'The wind blows where it wills…';
  String randomVerseChapter(ChapterModel chapter) =>
      '${chapter.book.desBook} - chapter ${chapter.chapterNumber}';
  String get bookmarksTitle => 'Bookmarks and history';
  String get bookmarksText => 'View and organize your bookmarks and history';
  String get searchTooltip => 'Search';
  String get searchHint => 'Search…';
  String get searchShortQuery => 'Search term must be longer than two letters';
  String get cancel => 'Cancel';
}

class DefaultDrawer {
  String get home => 'Home';
  String get oldTestament => 'Old Testament';
  String get newTestament => 'New Testament';
  String get lectures => 'Daily Reading';
  String get bookmarks => 'Bookmarks';
  String get maps => 'Maps';
  String get prayers => 'Prayers';
  String get settings => 'Settings';
  String get credits => 'Credits';
  String get guide => 'Guide';
}

class DefaultBible {
  String get italianCei2008 => 'CEI 2008 (Italian)';
  String get englishCpdv => 'Catholic Public Domain (English)';
  String get latinNovaVulgata => 'Nova Vulgata (Latin)';
  String get books => 'books';
  String get chapters => 'chapters';
  String get oneChapter => '1 chapter';
  String chapterNumber(var chapterNumber) => 'Chapter $chapterNumber';
}

class DefaultSettings {
  String get defaultLanguage => 'System default';
  String get italianLanguage => 'Italian';
  String get englishLanguage => 'English';
  String get generalTitle => 'General';
  String get themeTitle => 'Theme';
  String get themeSubtitle => 'Choose a theme';
  String get primaryColorTitle => 'Primary color';
  String get primaryColorSubtitle => 'The most used color in the application';
  String get bibleVersionTitle => 'Version';
  String get bibleVersionSubtitle => 'Bible version';
  String get languageTitle => 'Language';
  String get languageSubtitle => 'Application language';
  String get verseTitle => 'Verses';
  String get verseSubtitle => 'Show the number of the verse';
  String get titlesTitle => 'Titles';
  String get titlesSubtitle => 'Show titles';
  String get advancedTitle => 'Advanced';
  String get resetSettingsTitle => 'Reset settings';
  String get resetSettingsSubtitle => 'Reset settings to default values';
}
