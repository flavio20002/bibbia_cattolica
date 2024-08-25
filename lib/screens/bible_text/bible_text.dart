import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/common/drawer_items.dart';
import 'package:bibbia_cattolica/components/app_bar_title.dart';
import 'package:bibbia_cattolica/components/drawer.dart';
import 'package:bibbia_cattolica/components/popup_menu.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:bibbia_cattolica/model/compare_model.dart';
import 'package:bibbia_cattolica/model/menu_choice.dart';
import 'package:bibbia_cattolica/screens/bible_text_compare/bible_text_compare.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'components/bible_text_page.dart';

class BibleText extends StatefulWidget {
  final ChapterModel chapter;
  static const routeName = '/bibleText';

  const BibleText({super.key, required this.chapter});

  @override
  State<BibleText> createState() => _BibleTextState();
}

class _BibleTextState extends State<BibleText> {
  late ChapterModel _currentChapter;
  String chapterNumber(BuildContext context, int chapterNumber) {
    return MyLocalizations.of(context)
        .values
        .bible
        .chapterNumber(chapterNumber);
  }

  @override
  void initState() {
    _currentChapter = widget.chapter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ChapterModel> chapters = AppState.of(context).chapters;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          model: AppBarModel(
              chapterNumber(context, _currentChapter.chapterNumber),
              subtitle: _currentChapter.book.desBook),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          MyPopUpMenu(choices: <MenuChoice>[
            MenuChoice(
              title: 'Compare',
              onTap: () {
                Navigator.pushNamed(context, BibleTextCompare.routeName,
                    arguments: CompareModel(_currentChapter, "it", "en", null));
              },
            ),
            MenuChoice(title: 'Change Bible version', onTap: () {}),
          ])
        ],
      ),
      drawer: const MyDrawer(selectedItem: DrawerItemsEnum.none),
      backgroundColor: MyColors.backgroundColorLight,
      body: Builder(
        builder: (BuildContext context) {
          return PageView.builder(
            onPageChanged: (int page) {
              setState(() {
                _currentChapter = chapters[page];
              });
            },
            controller:
                PageController(initialPage: chapters.indexOf(widget.chapter)),
            itemCount: chapters.length,
            itemBuilder: (context, position) {
              return BibleTextPage(chapter: chapters[position]);
            },
          );
        },
      ),
    );
  }
}
