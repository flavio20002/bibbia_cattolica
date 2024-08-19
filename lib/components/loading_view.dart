import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color backgroundColor;
  final Color indicatorColor;

  const LoadingView(
      {super.key, required this.backgroundColor, required this.indicatorColor});

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
