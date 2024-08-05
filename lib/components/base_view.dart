import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) initialize;
  final T model;
  BaseView({
    required this.builder,
    required this.initialize,
    required this.model,
  });
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  @override
  void initState() {
    widget.initialize(widget.model);
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => widget.model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
