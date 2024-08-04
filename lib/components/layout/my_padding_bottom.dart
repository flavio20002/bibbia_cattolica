import 'package:flutter/material.dart';

class MyPaddingBottom extends StatelessWidget {
  final Widget child;

  const MyPaddingBottom(
    this.child, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 8), child: child);
  }
}
