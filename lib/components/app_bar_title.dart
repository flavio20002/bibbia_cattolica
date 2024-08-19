import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final AppBarModel model;

  const AppBarTitle({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: TextStyle(fontSize: 18.0),
          ),
          if (model.subtitle != null)
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                model.subtitle!,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
        ]);
  }
}
