import 'package:bibbia_cattolica/services/bible.dart';
import 'package:flutter/material.dart';

class BibleTextState with ChangeNotifier {
  String? _text;

  String? get text {
    return _text;
  }

  Future<void> load(chapter, bibleVersion) async {
    _text = await BibleService.getChapter(chapter, bibleVersion);
    notifyListeners();
  }
}
