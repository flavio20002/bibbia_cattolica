import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/lecture_model.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:bibbia_cattolica/components/card.dart';

class CardLectures extends StatelessWidget {
  final LectureModel lecture;
  final VoidCallback onTap;
  CardLectures({@required this.lecture, @required this.onTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCardWidget(
        cardColor: AppState.of(context).primaryColor,
        textColor: MyColors.textLightPrimary,
        title: MyLocalizations.of(context).values.home.lecturesTitle,
        titleColor: MyColors.secondaryColor,
        text1: lecture.date,
        text1Color: MyColors.textLightPrimary,
        textRight: null,
        text2: lecture.liturgy,
        text3: null,
        icon: null,
        iconEvent: null,
        onTap: onTap);
  }
}
