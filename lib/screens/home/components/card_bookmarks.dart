import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:bibbia_cattolica/components/card.dart';

class CardBookmarks extends StatelessWidget {
  final VoidCallback onTap;
  CardBookmarks({required this.onTap, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCardWidget(
        cardColor: AppState.of(context).primaryColor,
        textColor: MyColors.textLightPrimary,
        title: MyLocalizations.of(context).values.home.bookmarksTitle,
        titleColor: MyColors.secondaryColor,
        text1: MyLocalizations.of(context).values.home.bookmarksText,
        text1Color: MyColors.textLightPrimary,
        textRight: null,
        text2: null,
        text3: null,
        icon: null,
        iconEvent: null,
        onTap: onTap);
  }
}
