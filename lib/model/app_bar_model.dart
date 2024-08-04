import 'package:bibbia_cattolica/common/drawer_items.dart';

class AppBarModel {
  final String title;
  final String subtitle;
  final DrawerItemsEnum drawerItem;
  AppBarModel(this.title,
      {this.subtitle, this.drawerItem = DrawerItemsEnum.none});
}
