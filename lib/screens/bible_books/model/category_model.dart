import 'dart:convert';

import 'package:bibbia_cattolica/model/book_model.dart';

class CategoryModel {
  final String categoryTitle;
  final List<BookModel> books;

  CategoryModel(this.categoryTitle, this.books);

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryTitle': categoryTitle,
      'books': [for (var b in books) b.toMap()],
    };
  }
}
