import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/base_view.dart';
import 'package:bibbia_cattolica/components/loading_view.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/screens/bible_text/states/bible_text_state.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'bible_html_text.dart';

class BibleTextPage extends StatelessWidget {
  final ChapterModel chapter;

  const BibleTextPage({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    final String bibleVersion = AppState.of(context).bibleVersion;
    return BaseView<BibleTextState>(
      initialize: (model) {
        model.load(chapter.codChapter, bibleVersion);
      },
      model: BibleTextState(),
      builder: (context, model, child) => model.text == null
          ? LoadingView(
              backgroundColor: MyColors.backgroundColorLight,
              indicatorColor: AppState.of(context).primaryColor,
            )
          : BibleHtmlText(html: model.text!),
    );
  }
}
