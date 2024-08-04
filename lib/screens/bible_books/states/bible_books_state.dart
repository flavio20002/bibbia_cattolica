import 'package:bibbia_cattolica/screens/bible_books/model/category_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/services/bible_books_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BibleBooksState with ChangeNotifier {
  final service = GetIt.instance;
  List<CategoryModel> _model;

  List<CategoryModel> get model {
    return _model;
  }

  Future<void> load(testament, language) async {
    _model =
        await service<BibleBooksService>().getCategories(testament, language);
    notifyListeners();
  }
}
