import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseViewStateless<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  BaseViewStateless({
    @required this.builder,
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => this.model,
      child: Consumer<T>(builder: this.builder),
    );
  }
}
