import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/card.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/screens/bible_text/bible_text.dart';
import 'package:bibbia_cattolica/screens/home/services/home_service.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardRandomVerse extends StatefulWidget {
  const CardRandomVerse({super.key});

  @override
  _CardRandomVerseState createState() => _CardRandomVerseState();
}

class _CardRandomVerseState extends State<CardRandomVerse>
    with WidgetsBindingObserver {
  late ChapterModel _model;
  late List<ChapterModel> _chapters;

  @override
  Widget build(BuildContext context) {
    return MyCardWidget(
      cardColor: AppState.of(context).primaryColor,
      textColor: MyColors.textLightPrimary,
      title: MyLocalizations.of(context).values.home.randomVerseTitle,
      titleColor: MyColors.secondaryColor,
      text1: MyLocalizations.of(context).values.home.randomVerseChapter(_model),
      text1Color: MyColors.textLightPrimary,
      textRight: null,
      text2: _model.desChapter,
      text3: _model.textPreview,
      icon: Icons.refresh,
      iconEvent: () {
        _reloadChapter();
      },
      onTap: () => {
        Navigator.pushNamed(
          context,
          BibleText.routeName,
          arguments: _model,
        )
      },
    );
  }

  didChangeDependencies() {
    final chapters = Provider.of<AppState>(context).chapters;
    if (chapters != _chapters) {
      _reloadChapter();
      _chapters = chapters;
    }
    super.didChangeDependencies();
  }

  void _reloadChapter() {
    setState(
      () {
        _model = HomeService.getRandomChapter(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _reloadChapter();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _reloadChapter();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
