import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/card.dart';
import 'package:bibbia_cattolica/model/testament_model.dart';
import 'package:flutter/material.dart';

class MyCardTestament extends StatelessWidget {
  final TestamentModel testament;
  final Color titleColor;
  final VoidCallback onTap;

  MyCardTestament(
      {Key key,
      required this.testament,
      required this.titleColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCardWidget(
        cardColor: MyColors.secondaryColor,
        textColor: MyColors.textDarkPrimary,
        title: testament.desTestament.toUpperCase(),
        titleColor: titleColor,
        text1: testament.verseText,
        text1Color: MyColors.textDarkPrimary,
        textRight: testament.verseFrom,
        text2: null,
        text3: null,
        icon: null,
        iconEvent: null,
        onTap: onTap);
  }
}
