import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:get_it/get_it.dart';

import 'bible_chapters_sqlite_service.dart';

class BibleChaptersService {
  final service = GetIt.instance;

  Future<List<ChapterModel>> getChapters(
      BookModel book, String language, String bibleVersion) async {
    List<Map<dynamic, dynamic>> list =
        await service<BibleChaptersSqliteService>()
            .queryChapters(book.codBook, language, bibleVersion);
    return [
      for (var elem in list)
        ChapterModel(elem['id'], elem['titolo'], elem['numero_capitolo'],
            elem['testo_breve'], book)
    ];
  }
}
