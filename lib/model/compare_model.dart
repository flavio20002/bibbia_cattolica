import 'package:bibbia_cattolica/model/bible_chapter.dart';

class CompareModel {
  final BibleChapterModel chapter;
  final String language1;
  final String language2;
  final String? language3;

  CompareModel(this.chapter, this.language1, this.language2, this.language3);
}
