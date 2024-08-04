import 'package:bibbia_cattolica/model/chapter_model.dart';
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
    OldTestamentBooks.routeName: (BuildContext context) => OldTestamentBooks(),
    NewTestamentBooks.routeName: (BuildContext context) => NewTestamentBooks(),
    BibleChapters.routeName: (BuildContext context) => BibleChapters(),
    BibleTextCompare.routeName: (BuildContext context) => BibleTextCompare(),
    Lectures.routeName: (BuildContext context) => Lectures(),
    Bookmarks.routeName: (BuildContext context) => Bookmarks(),
    Settings.routeName: (BuildContext context) => Settings(),
  };

  static Route<dynamic> Function(RouteSettings) onGenerateRoute = (settings) {
    if (settings.name == BibleText.routeName) {
      final ChapterModel chapter = settings.arguments;
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
