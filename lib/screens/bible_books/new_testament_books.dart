import 'package:flutter/material.dart';

import 'bible_books.dart';

class NewTestamentBooks extends StatelessWidget {
  static const routeName = '/newTestamentBooks';

  const NewTestamentBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BibleBooks(
      testament: BibleBooks.newTestament(context),
    );
  }
}
