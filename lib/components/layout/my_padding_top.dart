import 'package:flutter/material.dart';

class MyPaddingTop extends StatelessWidget {
  final Widget child;

  const MyPaddingTop({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 8), child: child);
  }
}
