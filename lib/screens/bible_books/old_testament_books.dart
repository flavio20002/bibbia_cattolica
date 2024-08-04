import 'package:flutter/material.dart';

import 'bible_books.dart';

class OldTestamentBooks extends StatelessWidget {
  static const routeName = '/oldTestamentBooks';

  const OldTestamentBooks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BibleBooks(
      testament: BibleBooks.oldTestament(context),
    );
  }
}