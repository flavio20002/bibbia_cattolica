import 'package:flutter/material.dart';
import 'package:bibbia_cattolica/common/theme.dart';

class PreferenceTitle extends StatelessWidget {
  final String title;

  const PreferenceTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 16),
        child: Text(
          title,
          style: MyTheme.myTitle(context),
        ),
      ),
    );
  }
}
