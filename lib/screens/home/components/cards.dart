import 'package:bibbia_cattolica/components/card_list.dart';
import 'package:bibbia_cattolica/model/lecture_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/bible_books.dart';
import 'package:bibbia_cattolica/screens/bible_books/new_testament_books.dart';
import 'package:bibbia_cattolica/screens/bible_books/old_testament_books.dart';
import 'package:bibbia_cattolica/screens/bookmarks/bookmarks.dart';
import 'package:bibbia_cattolica/screens/home/components/card_random_verse.dart';
import 'package:bibbia_cattolica/screens/lectures/lectures.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'card_bookmarks.dart';
import 'card_lectures.dart';
import 'card_testament.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({super.key});

  @override
  Widget build(BuildContext context) {
    final String language = AppState.of(context).language;
    return CardList(
      cardsList: [
        MyCardTestament(
            testament: BibleBooks.oldTestament(context),
            titleColor: AppState.of(context).primaryColor,
            onTap: () => {
                  Navigator.pushNamed(
                    context,
                    OldTestamentBooks.routeName,
                  )
                }),
        MyCardTestament(
            testament: BibleBooks.newTestament(context),
            titleColor: AppState.of(context).primaryColor,
            onTap: () => {
                  Navigator.pushNamed(
                    context,
                    NewTestamentBooks.routeName,
                  )
                }),
        CardLectures(
          lecture: LectureModel(formatCurrentDate(language),
              '5° settimana del Tempo ordinario, mercoledì'),
          onTap: () => {
            Navigator.pushNamed(
              context,
              Lectures.routeName,
              arguments: DateTime.now(),
            )
          },
        ),
        const CardRandomVerse(),
        CardBookmarks(
          onTap: () => {
            Navigator.pushNamed(
              context,
              Bookmarks.routeName,
            )
          },
        ),
      ],
    );
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static DateTime cleanDate(DateTime date) =>
      DateTime.utc(date.year, date.month, date.day);

  static DateTime currentDate() => cleanDate(DateTime.now());

  static String formatDate(DateTime date, String locale) =>
      capitalize(DateFormat('EEEE, d MMMM yyyy', locale).format(date));

  static String formatCurrentDate(String locale) =>
      formatDate(currentDate(), locale);
}
