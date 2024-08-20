import 'dart:convert';

import 'package:bibbia_cattolica/model/book_model.dart';

class CategoryModel {
  final String categoryTitle;
  final List<BookModel> books;

  CategoryModel(this.categoryTitle, this.books);

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryTitle': categoryTitle,
      'books': [for (var b in books) b.toMap()],
    };
  }
}
