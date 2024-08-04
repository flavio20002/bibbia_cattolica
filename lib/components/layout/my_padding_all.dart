import 'package:flutter/material.dart';

class MyPaddingAll extends StatelessWidget {
  final Widget child;

  const MyPaddingAll(
    this.child, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12), child: child);
  }
}
