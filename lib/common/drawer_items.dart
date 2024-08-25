import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/drawer_item_model.dart';
import 'package:bibbia_cattolica/screens/bible_books/new_testament_books.dart';
import 'package:bibbia_cattolica/screens/bible_books/old_testament_books.dart';
import 'package:bibbia_cattolica/screens/home/home.dart';
import 'package:bibbia_cattolica/screens/settings/settings.dart';
import 'package:flutter/material.dart';

import 'icons.dart';

enum DrawerItemsEnum {
  home,
  oldTestament,
  newTestament,
  lectures,
  bookmarks,
  maps,
  prayers,
  settings,
  credits,
  none,
}

class MyDrawerItems {
  static final items = [
    DrawerItemModel(
        DrawerItemsEnum.home,
        null,
        Icons.home,
        (context) => MyLocalizations.of(context).values.drawer.home,
        MyHomePage.routeName),
    DrawerItemModel(
        DrawerItemsEnum.oldTestament,
        MyIcons.book,
        null,
        (context) => MyLocalizations.of(context).values.drawer.oldTestament,
        OldTestamentBooks.routeName),
    DrawerItemModel(
        DrawerItemsEnum.newTestament,
        MyIcons.fish,
        null,
        (context) => MyLocalizations.of(context).values.drawer.newTestament,
        NewTestamentBooks.routeName),
    DrawerItemModel(
        DrawerItemsEnum.lectures,
        MyIcons.calendar,
        null,
        (context) => MyLocalizations.of(context).values.drawer.lectures,
        NewTestamentBooks.routeName),
    DrawerItemModel(
        DrawerItemsEnum.bookmarks,
        null,
        Icons.star,
        (context) => MyLocalizations.of(context).values.drawer.bookmarks,
        NewTestamentBooks.routeName),
    DrawerItemModel(
        DrawerItemsEnum.maps,
        MyIcons.map,
        null,
        (context) => MyLocalizations.of(context).values.drawer.maps,
        NewTestamentBooks.routeName),
    DrawerItemModel(
        DrawerItemsEnum.prayers,
        MyIcons.pray,
        null,
        (context) => MyLocalizations.of(context).values.drawer.prayers,
        NewTestamentBooks.routeName),
    DrawerItemModel(
        DrawerItemsEnum.settings,
        null,
        Icons.settings,
        (context) => MyLocalizations.of(context).values.drawer.settings,
        Settings.routeName),
    DrawerItemModel(
        DrawerItemsEnum.credits,
        null,
        Icons.info_outline,
        (context) => MyLocalizations.of(context).values.drawer.credits,
        Settings.routeName),
  ];
}
