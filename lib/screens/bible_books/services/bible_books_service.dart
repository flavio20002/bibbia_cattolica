import 'dart:async';

import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/model/category_model.dart';
import 'package:get_it/get_it.dart';

import 'bible_books_sqlite_service.dart';

class BibleBooksService {
  final service = GetIt.instance;

  Future<List<BookModel>> _getBooks(String language) async {
    List<Map> list =
        await service<BibleBooksSqliteService>().queryBooks(language);
    List<BookModel> result = [];
    for (var elem in list) {
      result.add(BookModel(elem['codice'], elem['des_libro'],
          elem['id_categoria'], elem['numero_capitoli']));
    }
    return result;
  }

  List<BookModel> _filterBooks(var books, int category) {
    List<BookModel> result = [];
    for (BookModel book in books) {
      if (book.category == category) {
        result.add(book);
      }
    }
    return result;
  }

  Future<List<CategoryModel>> getCategories(
      String testament, String language) async {
    List<Map> list = await service<BibleBooksSqliteService>()
        .queryCategories(testament, language);
    List<BookModel> books = await _getBooks(language);
    List<CategoryModel> result = [];
    for (var elem in list) {
      result.add(
          CategoryModel(elem['descrizione'], _filterBooks(books, elem['id'])));
    }
    return result;
  }
}
