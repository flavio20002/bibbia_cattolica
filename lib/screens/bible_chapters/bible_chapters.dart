import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/page_view_app_bar.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'components/bible_chapters_page.dart';

class BibleChapters extends StatelessWidget {
  static const routeName = '/bibleChapters';

  const BibleChapters({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel book =
        ModalRoute.of(context)!.settings.arguments! as BookModel;
    List<BookModel> books = AppState.of(context).books;
    return PageViewAppBar(
      initialPage: books.indexOf(book),
      itemCount: books.length,
      itemBuilder: (context, position) {
        return BibleChaptersPage(book: books[position]);
      },
      appBarBuilder: (int page) {
        return AppBarModel(books[page].desBook,
            subtitle: books[page].chapters == 1
                ? MyLocalizations.of(context).values.bible.oneChapter
                : '${books[page].chapters} ${MyLocalizations.of(context).values.bible.chapters}');
      },
      backgroundColor: MyColors.backgroundColorCardsLight,
      actions: const [],
    );
  }
}
