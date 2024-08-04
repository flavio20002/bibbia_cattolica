import 'package:bibbia_cattolica/common/drawer_items.dart';
import 'package:bibbia_cattolica/common/images.dart';
import 'package:bibbia_cattolica/model/drawer_item_model.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatelessWidget {
  final DrawerItemsEnum selectedItem;

  MyDrawer({
    @required this.selectedItem,
    Key key,
  }) : super(key: key);

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(MyImages.headerBackground),
        ),
      ),
      child: null,
    );
  }

  Widget _createDrawerItem(
      {DrawerItemsEnum drawerItem,
      String svgIcon,
      IconData icon,
      String text,
      GestureTapCallback onTap}) {
    return ListTile(
      selected: drawerItem == selectedItem,
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            width: 24.0,
            alignment: Alignment.center,
            child: icon != null
                ? Icon(
                    icon,
                    size: 24.0,
                  )
                : SvgPicture.asset(
                    svgIcon,
                    color: IconTheme.of(context).color,
                  ),
          );
        },
      ),
      title: Text(text),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    var packageInfo = AppState.of(context).packageInfo;
    return Drawer(
      child: Scrollbar(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            for (var item in MyDrawerItems.items)
              item == DrawerItemModel.divider
                  ? Divider()
                  : _createDrawerItem(
                      drawerItem: item.drawerItem,
                      svgIcon: item.svgIcon,
                      icon: item.icon,
                      text: item.title(context),
                      onTap: () {
                        if (item.drawerItem == selectedItem) {
                          Navigator.of(context).pop();
                        } else if (item.drawerItem == DrawerItemsEnum.home) {
                          Navigator.popUntil(
                            context,
                            (Route route) => route.isFirst,
                          );
                        } else {
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            item.route,
                            (Route route) => route.isFirst,
                          );
                        }
                      },
                    ),
            ListTile(
              title: Text(
                packageInfo == null ? '' : 'v ' + packageInfo.version,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
