import 'package:bibbia_cattolica/common/drawer_items.dart';
import 'package:bibbia_cattolica/components/app_bar_title.dart';
import 'package:bibbia_cattolica/components/drawer.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:bibbia_cattolica/screens/home/components/cards.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'components/search.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppState.of(context).primaryColorDark,
      drawer: const MyDrawer(
        selectedItem: DrawerItemsEnum.home,
      ),
      appBar: AppBar(
        title: AppBarTitle(
          model: AppBarModel(MyLocalizations.of(context).values.title),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: MyLocalizations.of(context).values.home.searchTooltip,
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                    hintText:
                        MyLocalizations.of(context).values.home.searchHint),
              );
            },
          ),
        ],
      ),
      body: const HomeCards(),
    );
  }
}
