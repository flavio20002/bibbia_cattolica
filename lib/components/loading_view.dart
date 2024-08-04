import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color backgroundColor;
  final Color indicatorColor;

  const LoadingView({
    Key key,
    @required this.backgroundColor,
    @required this.indicatorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(indicatorColor),
        ),
      ),
      color: backgroundColor,
    );
  }
}
