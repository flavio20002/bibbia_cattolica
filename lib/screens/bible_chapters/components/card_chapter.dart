import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:bibbia_cattolica/components/card.dart';

class MyCardChapter extends MyCardWidget {
  final ChapterModel model;
  final BuildContext context;
  final VoidCallback onTap;

  MyCardChapter(
      {Key key,
      @required this.model,
      @required this.context,
      @required this.onTap})
      : super(
            key: key,
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
