import 'package:bibbia_cattolica/screens/bible_text/services/bible_text_service.dart';
import 'package:flutter/material.dart';

class BibleTextState with ChangeNotifier {
  String? _text;

  String? get text {
    return _text;
  }

  Future<void> load(chapter, bibleVersion) async {
    _text = await BibleTextService.getText(chapter, bibleVersion);
    notifyListeners();
  }
}
