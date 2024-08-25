import 'package:bibbia_cattolica/screens/bible_books/model/category_model.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/bible_chapters.dart';
import 'package:flutter/material.dart';

import 'card_category.dart';

class BibleBooksCards {
  static cards(BuildContext context, List<CategoryModel> model) {
    var result = [];
    for (CategoryModel elem in model) {
      result.add(
        MyCardCategory(
          model: elem,
          onTap: (book) => {
            Navigator.pushNamed(context, BibleChapters.routeName,
                arguments: book)
          },
        ),
      );
    }

    return result;
  }
}
