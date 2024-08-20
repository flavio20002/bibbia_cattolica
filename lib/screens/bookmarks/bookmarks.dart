import 'package:bibbia_cattolica/components/app_bar_title.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
  static const routeName = '/bookmarks';

  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          model: AppBarModel('Bookmarks'),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
