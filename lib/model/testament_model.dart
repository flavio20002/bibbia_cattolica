import 'package:bibbia_cattolica/common/drawer_items.dart';

class TestamentModel {
  final DrawerItemsEnum drawerItem;
  final String codTestament;
  final String desTestament;
  final int booksNumber;
  final String verseText;
  final String verseFrom;
  TestamentModel(this.drawerItem, this.codTestament, this.desTestament,
      this.booksNumber, this.verseText, this.verseFrom);

  @override
  bool operator ==(o) => o is TestamentModel && codTestament == o.codTestament;
  @override
  int get hashCode => codTestament.hashCode;
}
