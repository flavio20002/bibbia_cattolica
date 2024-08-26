import 'package:bibbia_cattolica/model/bible_chapter.dart';
import 'package:bibbia_cattolica/screens/bible_books/new_testament_books.dart';
import 'package:bibbia_cattolica/screens/bible_books/old_testament_books.dart';
import 'package:bibbia_cattolica/screens/bible_chapters/bible_chapters.dart';
import 'package:bibbia_cattolica/screens/bible_text/bible_text.dart';
import 'package:bibbia_cattolica/screens/bible_text_compare/bible_text_compare.dart';
import 'package:bibbia_cattolica/screens/bookmarks/bookmarks.dart';
import 'package:bibbia_cattolica/screens/lectures/lectures.dart';
import 'package:bibbia_cattolica/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    OldTestamentBooks.routeName: (BuildContext context) =>
        const OldTestamentBooks(),
    NewTestamentBooks.routeName: (BuildContext context) =>
        const NewTestamentBooks(),
    BibleChapters.routeName: (BuildContext context) => const BibleChapters(),
    BibleTextCompare.routeName: (BuildContext context) =>
        const BibleTextCompare(),
    Lectures.routeName: (BuildContext context) => const Lectures(),
    Bookmarks.routeName: (BuildContext context) => const Bookmarks(),
    Settings.routeName: (BuildContext context) => const Settings(),
  };

  static Route<dynamic>? Function(RouteSettings) onGenerateRoute = (settings) {
    if (settings.name == BibleText.routeName) {
      final BibleChapterModel chapter = settings.arguments as BibleChapterModel;
      return MaterialPageRoute(
        builder: (context) {
          return BibleText(
            chapter: chapter,
          );
        },
      );
    } else {
      return null;
    }
  };
}
