import 'package:bibbia_cattolica/model/bible_book.dart';
import 'package:bibbia_cattolica/model/bible_chapter.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/components/card_chapter.dart';
import 'package:bibbia_cattolica/screens/bible_text/bible_text.dart';
import 'package:flutter/material.dart';

class BibleChaptersCards {
  static cards(BuildContext context, BibleBookModel book,
      List<BibleChapterModel> model) {
    var result = [];
    for (BibleChapterModel elem in model) {
      result.add(
        MyCardChapter(
          model: elem,
          context: context,
          onTap: () => {
            Navigator.pushNamed(
              context,
              BibleText.routeName,
              arguments: elem,
            ),
          },
        ),
      );
    }

    return result;
  }
}
