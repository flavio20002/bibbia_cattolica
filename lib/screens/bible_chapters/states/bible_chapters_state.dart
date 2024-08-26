import 'package:bibbia_cattolica/model/bible_chapter.dart';
import 'package:bibbia_cattolica/services/bible.dart';
import 'package:flutter/material.dart';

class BibleChaptersState with ChangeNotifier {
  List<BibleChapterModel>? _model;

  List<BibleChapterModel>? get model {
    return _model;
  }

  Future<void> load(book, language, bibleVersion) async {
    _model = await BibleService.getChapters(
        book: book, language: language, bibleVersion: bibleVersion);
    notifyListeners();
  }
}
