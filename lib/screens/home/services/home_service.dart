import 'dart:math';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/cupertino.dart';

class HomeService {
  static ChapterModel getRandomChapter(BuildContext context) {
    List<ChapterModel> chapters = AppState.of(context).chapters;
    final _random = new Random();
    return chapters[_random.nextInt(chapters.length)];
  }
}
