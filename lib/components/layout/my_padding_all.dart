import 'package:flutter/material.dart';

class MyPaddingAll extends StatelessWidget {
  final Widget child;
  const MyPaddingAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12), child: child);
  }
}
