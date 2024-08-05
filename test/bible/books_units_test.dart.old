import 'package:bibbia_cattolica/common/bibles.dart';
import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/services/bible_books_service.dart';
import 'package:bibbia_cattolica/screens/bible_books/services/bible_books_sqlite_service.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/services/bible_chapters_service.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/services/bible_chapters_sqlite_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

final getIt = GetIt.instance;

class MockBibleBooksSqliteService extends Mock
    implements BibleBooksSqliteService {}

class MockBibleChaptersSqliteService extends Mock
    implements BibleChaptersSqliteService {}

var _testament = 'A';
var _book = 'XXX';
var _bibleVersion = Bibles.italianCei2008;
var _language = 'it';

var _sampleCategories = [
  {'id': 1, 'descrizione': 'Test Category'},
  {'id': 2, 'descrizione': 'Test Category 2'}
];

var _sampleBooks = [
  {
    'codice': _book,
    'numero_capitoli': 10,
    'des_libro': 'Test Book',
    'id_categoria': 1
  },
  {
    'codice': 'YYYY',
    'numero_capitoli': 15,
    'des_libro': 'Test Book 2',
    'id_categoria': 1
  },
  {
    'codice': 'ZZZZ',
    'numero_capitoli': 2,
    'des_libro': 'Test Book 3',
    'id_categoria': 2
  }
];

var _sampleChapters = [
  {
    'id': '${_book}_1',
    'titolo': 'Sample title',
    'numero_capitolo': 1,
    'testo_breve': 'Sample Text'
  }
];

main() {
  group('Bible Books', () {
    final mockBibleBooksSqliteService = MockBibleBooksSqliteService();
    getIt.registerSingleton<BibleBooksSqliteService>(
        mockBibleBooksSqliteService);
    final mockBibleChaptersSqliteService = MockBibleChaptersSqliteService();
    getIt.registerSingleton<BibleChaptersSqliteService>(
        mockBibleChaptersSqliteService);
    final bibleBooksService = BibleBooksService();
    final bibleChaptersService = BibleChaptersService();

    test('Read Bible categories and books', () async {
      when(mockBibleBooksSqliteService.queryCategories(_testament, _language))
          .thenAnswer((_) => Future.value(_sampleCategories));
      when(mockBibleBooksSqliteService.queryBooks(_language))
          .thenAnswer((_) => Future.value(_sampleBooks));
      var categories =
          await bibleBooksService.getCategories(_testament, _language);
      expect(categories.length, _sampleCategories.length);
      expect(categories[0].categoryTitle, 'Test Category');
      expect(categories[0].books.length, 2);
      expect(categories[0].books[0].desBook, 'Test Book');
      expect(categories[1].categoryTitle, 'Test Category 2');
      expect(categories[1].books.length, 1);
      expect(categories[1].books[0].desBook, 'Test Book 3');
    });

    test('Read Bible categories and books error', () async {
      when(mockBibleBooksSqliteService.queryCategories(_testament, _language))
          .thenThrow(Exception('Db not available'));
      expect(() => bibleBooksService.getCategories(_testament, _language),
          throwsException);
    });

    test('Read Bible chapters', () async {
      when(mockBibleChaptersSqliteService.queryChapters(
              _book, _language, _bibleVersion))
          .thenAnswer((_) => Future.value(_sampleChapters));
      var chapters = await bibleChaptersService.getChapters(
          BookModel(_book, '', 0, 0), _language, _bibleVersion);
      expect(chapters.length, _sampleChapters.length);
      expect(chapters[0].book.codBook, _book);
      expect(chapters[0].chapterNumber, 1);
      expect(chapters[0].codChapter, '${_book}_1');
    });

    test('Read Bible chapters error', () async {
      when(mockBibleChaptersSqliteService.queryChapters(
              _book, _language, _bibleVersion))
          .thenThrow(Exception('Db not available'));
      expect(
          () => bibleChaptersService.getChapters(
              BookModel(_book, '', 0, 0), _language, _bibleVersion),
          throwsException);
    });
  });
}
