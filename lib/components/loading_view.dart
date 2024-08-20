import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color backgroundColor;
  final Color indicatorColor;

  const LoadingView(
      {super.key, required this.backgroundColor, required this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
        ),
      ),
    );
  }
}
