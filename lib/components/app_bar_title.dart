import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final AppBarModel model;

  const AppBarTitle(
    this.model, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.subtitle == null) {
      return Text(model.title);
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: TextStyle(fontSize: 18.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                model.subtitle,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ]);
    }
  }
}
