import 'package:bibbia_cattolica/components/app_bar_title.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
  static const routeName = '/bookmarks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          AppBarModel('Bookmarks'),
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
