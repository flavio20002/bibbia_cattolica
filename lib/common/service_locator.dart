import 'package:bibbia_cattolica/screens/bible_books/services/bible_books_service.dart';
import 'package:bibbia_cattolica/screens/bible_books/services/bible_books_sqlite_service.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/services/bible_chapters_service.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/services/bible_chapters_sqlite_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<BibleBooksService>(BibleBooksService());
  getIt.registerSingleton<BibleBooksSqliteService>(BibleBooksSqliteService());
  getIt.registerSingleton<BibleChaptersService>(BibleChaptersService());
  getIt.registerSingleton<BibleChaptersSqliteService>(
      BibleChaptersSqliteService());
}
