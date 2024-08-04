import 'package:bibbia_cattolica/components/card_list.dart';
import 'package:bibbia_cattolica/model/lecture_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/bible_books.dart';
import 'package:bibbia_cattolica/screens/bible_books/new_testament_books.dart';
import 'package:bibbia_cattolica/screens/bible_books/old_testament_books.dart';
import 'package:bibbia_cattolica/screens/bookmarks/bookmarks.dart';
import 'package:bibbia_cattolica/screens/home/components/card_random_verse.dart';
import 'package:bibbia_cattolica/screens/lectures/lectures.dart';
import 'package:bibbia_cattolica/services/lectures/lectures_service.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'card_bookmarks.dart';
import 'card_lectures.dart';
import 'card_testament.dart';

class HomeCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String language = AppState.of(context).language;
    return CardList(
      [
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
          lecture: LectureModel(LecturesService.formatCurrentDate(language),
              '5° settimana del Tempo ordinario, mercoledì'),
          onTap: () => {
            Navigator.pushNamed(
              context,
              Lectures.routeName,
              arguments: DateTime.now(),
            )
          },
        ),
        CardRandomVerse(),
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
}
