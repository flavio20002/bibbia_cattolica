import 'package:bibbia_cattolica/states/app_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar_title.dart';
import 'drawer.dart';

class PageViewAppBar extends StatelessWidget {
  final int initialPage;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final appBarBuilder;
  final onPageChanged;
  final Color backgroundColor;
  final List<Widget> actions;

  const PageViewAppBar({
    Key key,
    required this.initialPage,
    required this.itemCount,
    required this.itemBuilder,
    required this.appBarBuilder,
    this.onPageChanged,
    required this.backgroundColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppBarState>(
      create: (context) => AppBarState(appBarBuilder(initialPage)),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<AppBarState>(
            builder: (context, model, child) => AppBarTitle(model.model),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: actions,
        ),
        drawer: Consumer<AppBarState>(
          builder: (context, model, child) =>
              MyDrawer(selectedItem: model.model.drawerItem),
        ),
        backgroundColor: backgroundColor,
        body: Builder(
          builder: (BuildContext context) {
            return PageView.builder(
                onPageChanged: (int page) {
                  if (onPageChanged != null) {
                    onPageChanged(page);
                  }
                  AppBarState.of(context).update(appBarBuilder(page));
                },
                controller: PageController(initialPage: initialPage),
                itemCount: itemCount,
                itemBuilder: itemBuilder);
          },
        ),
      ),
    );
  }
}
