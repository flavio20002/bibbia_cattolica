import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/base_view.dart';
import 'package:bibbia_cattolica/components/card_list.dart';
import 'package:bibbia_cattolica/components/loading_view.dart';
import 'package:bibbia_cattolica/model/testament_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/states/bible_books_state.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'cards.dart';

class BibleBooksPage extends StatelessWidget {
  final TestamentModel testament;

  BibleBooksPage({required this.testament});

  @override
  Widget build(BuildContext context) {
    final String language = AppState.of(context).language;
    return BaseView<BibleBooksState>(
      initialize: (model) {
        model.load(testament.codTestament, language);
      },
      model: BibleBooksState(),
      builder: (context, model, child) => model.model == null
          ? LoadingView(
              backgroundColor: MyColors.backgroundColorLight,
              indicatorColor: AppState.of(context).primaryColor,
            )
          : CardList(
              BibleBooksCards.cards(context, model.model!),
            ),
    );
  }
}
