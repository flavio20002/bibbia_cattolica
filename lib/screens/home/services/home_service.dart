import 'dart:math';
import 'package:bibbia_cattolica/model/bible_chapter.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/cupertino.dart';

class HomeService {
  static BibleChapterModel getRandomChapter(BuildContext context) {
    List<BibleChapterModel> chapters = AppState.of(context).chapters;
    final random = Random();
    return chapters[random.nextInt(chapters.length)];
  }
}
