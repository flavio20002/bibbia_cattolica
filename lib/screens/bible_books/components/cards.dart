import 'package:bibbia_cattolica/model/bible_category.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/bible_chapters.dart';
import 'package:flutter/material.dart';

import 'card_category.dart';

class BibleBooksCards {
  static cards(BuildContext context, List<BibleCategoryModel> model) {
    var result = [];
    for (BibleCategoryModel elem in model) {
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
