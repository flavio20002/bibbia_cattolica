import 'package:bibbia_cattolica/common/drawer_items.dart';
import 'package:flutter/cupertino.dart';

class DrawerItemModel {
  final DrawerItemsEnum drawerItem;
  final String? svgIcon;
  final IconData? icon;
  final Function title;
  final String route;
  DrawerItemModel(
      this.drawerItem, this.svgIcon, this.icon, this.title, this.route);
  static DrawerItemModel? get divider {
    return null;
  }
}
