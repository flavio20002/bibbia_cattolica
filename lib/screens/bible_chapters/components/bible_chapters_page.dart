import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/base_view.dart';
import 'package:bibbia_cattolica/components/card_list.dart';
import 'package:bibbia_cattolica/components/loading_view.dart';
import 'package:bibbia_cattolica/model/bible_book.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/states/bible_chapters_state.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'cards.dart';

class BibleChaptersPage extends StatelessWidget {
  final BibleBookModel book;

  const BibleChaptersPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final String language = AppState.of(context).language;
    final String bibleVersion = AppState.of(context).bibleVersion;
    return BaseView<BibleChaptersState>(
      initialize: (model) {
        model.load(book, language, bibleVersion);
      },
      model: BibleChaptersState(),
      builder: (context, model, child) => model.model == null
          ? LoadingView(
              backgroundColor: MyColors.backgroundColorLight,
              indicatorColor: AppState.of(context).primaryColor,
            )
          : CardList(
              cardsList: BibleChaptersCards.cards(context, book, model.model!),
            ),
    );
  }
}
