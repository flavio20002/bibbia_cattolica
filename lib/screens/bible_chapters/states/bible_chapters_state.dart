import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/services/bible_chapters_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BibleChaptersState with ChangeNotifier {
  final service = GetIt.instance;

  List<ChapterModel> _model;

  List<ChapterModel> get model {
    return _model;
  }

  Future<void> load(book, language, bibleVersion) async {
    _model = await service<BibleChaptersService>()
        .getChapters(book, language, bibleVersion);
    notifyListeners();
  }
}
