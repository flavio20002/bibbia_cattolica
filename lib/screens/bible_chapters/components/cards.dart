import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/components/card_chapter.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/screens/bible_text/bible_text.dart';
import 'package:flutter/material.dart';

class BibleChaptersCards {
  static cards(BuildContext context, BookModel book, List<ChapterModel> model) {
    var result = [];
    for (ChapterModel elem in model) {
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
