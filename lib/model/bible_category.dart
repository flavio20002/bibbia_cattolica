import 'package:bibbia_cattolica/model/bible_book.dart';

class BibleCategoryModel {
  final String categoryTitle;
  final List<BibleBookModel> books;

  BibleCategoryModel({required this.categoryTitle, required this.books});
}
