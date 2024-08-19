import 'package:flutter/material.dart';

import '../../../common/colors.dart';
import '../../../components/card.dart';
import '../../../localization/localization.dart';
import '../../../model/chapter_model.dart';

class MyCardChapter extends StatelessWidget {
  final ChapterModel model;
  final BuildContext context;
  final VoidCallback onTap;

  const MyCardChapter(
      {super.key,
      required this.model,
      required this.context,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MyCardWidget(
        cardColor: MyColors.backgroundColorLight,
        textColor: MyColors.textDarkPrimary,
        title: null,
        titleColor: MyColors.textDarkPrimary,
        text1: MyLocalizations.of(context)
            .values
            .bible
            .chapterNumber(model.chapterNumber),
        text1Color: MyColors.textDarkInverse,
        textRight: null,
        text2: model.desChapter,
        text3: model.textPreview,
        icon: null,
        iconEvent: null,
        onTap: onTap);
  }
}
