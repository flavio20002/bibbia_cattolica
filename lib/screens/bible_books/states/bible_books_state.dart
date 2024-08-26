import 'package:bibbia_cattolica/model/bible_category.dart';
import 'package:bibbia_cattolica/services/bible.dart';
import 'package:flutter/material.dart';

class BibleBooksState with ChangeNotifier {
  List<BibleCategoryModel>? _model;

  List<BibleCategoryModel>? get model {
    return _model;
  }

  Future<void> load(testament, language) async {
    _model = await BibleService.getCategories(testament, language);
    notifyListeners();
  }
}
