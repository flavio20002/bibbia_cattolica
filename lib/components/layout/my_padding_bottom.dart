import 'package:flutter/material.dart';

class MyPaddingBottom extends StatelessWidget {
  final Widget child;

  const MyPaddingBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 8), child: child);
  }
}
