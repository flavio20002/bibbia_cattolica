import 'package:flutter/material.dart';

class MyPaddingTop extends StatelessWidget {
  final Widget child;

  const MyPaddingTop(
    this.child, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 8), child: child);
  }
}
