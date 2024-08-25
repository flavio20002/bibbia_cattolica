import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/common/drawer_items.dart';
import 'package:bibbia_cattolica/components/page_view_app_bar.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:bibbia_cattolica/model/testament_model.dart';
import 'package:flutter/material.dart';

import 'components/bible_books_page.dart';

class BibleBooks extends StatelessWidget {
  final TestamentModel testament;

  const BibleBooks({super.key, required this.testament});

  static oldTestament(BuildContext context) {
    return TestamentModel(
        DrawerItemsEnum.oldTestament,
        'A',
        MyLocalizations.of(context).values.home.oldTestamentTitle,
        46,
        MyLocalizations.of(context).values.home.oldTestamentText,
        MyLocalizations.of(context).values.home.oldTestamentBook);
  }

  static newTestament(BuildContext context) {
    return TestamentModel(
        DrawerItemsEnum.newTestament,
        'N',
        MyLocalizations.of(context).values.home.newTestamentTitle,
        27,
        MyLocalizations.of(context).values.home.newTestamentText,
        MyLocalizations.of(context).values.home.newTestamentBook);
  }

  @override
  Widget build(BuildContext context) {
    List<TestamentModel> testaments = [
      oldTestament(context),
      newTestament(context)
    ];
    return PageViewAppBar(
      initialPage: testaments.indexOf(testament),
      itemCount: testaments.length,
      itemBuilder: (context, position) {
        return BibleBooksPage(testament: testaments[position]);
      },
      appBarBuilder: (int page) {
        return AppBarModel(testaments[page].desTestament,
            subtitle:
                '${testaments[page].booksNumber} ${MyLocalizations.of(context).values.bible.books}',
            drawerItem: testaments[page].drawerItem);
      },
      backgroundColor: MyColors.backgroundColorCardsLight,
      actions: const [],
    );
  }
}
