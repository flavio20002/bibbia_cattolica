import 'package:bibbia_cattolica/components/app_bar_title.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:flutter/material.dart';

class Lectures extends StatelessWidget {
  static const routeName = '/lectures';

  @override
  Widget build(BuildContext context) {
    final DateTime date =
        ModalRoute.of(context)!.settings.arguments as DateTime;
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          model: AppBarModel(
            date.toIso8601String(),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
