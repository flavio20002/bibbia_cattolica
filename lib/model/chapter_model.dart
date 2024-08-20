import 'package:bibbia_cattolica/model/book_model.dart';

class ChapterModel {
  final String codChapter;
  final String desChapter;
  final int chapterNumber;
  final String textPreview;
  final BookModel book;

  ChapterModel(this.codChapter, this.desChapter, this.chapterNumber,
      this.textPreview, this.book);

  @override
  bool operator ==(o) => o is ChapterModel && codChapter == o.codChapter;
  @override
  int get hashCode => codChapter.hashCode;
}
