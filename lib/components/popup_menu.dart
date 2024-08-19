import 'package:bibbia_cattolica/model/menu_choice.dart';
import 'package:flutter/material.dart';

class MyPopUpMenu extends StatelessWidget {
  final List<MenuChoice> choices;
  const MyPopUpMenu({super.key, required this.choices});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuChoice>(
      onSelected: (MenuChoice choice) => choice.onTap(),
      itemBuilder: (BuildContext context) {
        return choices.map((MenuChoice choice) {
          return PopupMenuItem<MenuChoice>(
            value: choice,
            child: Text(choice.title),
          );
        }).toList();
      },
    );
  }
}
