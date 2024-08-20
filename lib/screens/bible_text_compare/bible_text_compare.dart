import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/page_view_app_bar.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/model/compare_model.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'components/bible_text_page.dart';

class BibleTextCompare extends StatelessWidget {
  static const routeName = '/bibleTextCompare';

  const BibleTextCompare({super.key});

  String chapterNumber(BuildContext context, int chapterNumber) {
    return MyLocalizations.of(context)
        .values
        .bible
        .chapterNumber(chapterNumber);
  }

  @override
  Widget build(BuildContext context) {
    final CompareModel model = ModalRoute.of(context).settings.arguments;
    List<ChapterModel> chapters = AppState.of(context).chapters;
    return PageViewAppBar(
      initialPage: chapters.indexOf(model.chapter),
      itemCount: chapters.length,
      itemBuilder: (context, position) {
        return BibleTextPage(chapter: chapters[position]);
      },
      appBarBuilder: (int page) {
        return AppBarModel(chapterNumber(context, chapters[page].chapterNumber),
            subtitle: chapters[page].book.desBook);
      },
      backgroundColor: MyColors.backgroundColorLight,
    );
  }
}
