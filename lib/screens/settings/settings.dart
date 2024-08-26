import 'package:bibbia_cattolica/common/bibles.dart';
import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/common/drawer_items.dart';
import 'package:bibbia_cattolica/common/preferences.dart';
import 'package:bibbia_cattolica/components/app_bar_title.dart';
import 'package:bibbia_cattolica/components/drawer.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:bibbia_cattolica/screens/settings/components/preference_title.dart';
import 'package:bibbia_cattolica/screens/settings/components/radio_button_preference.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';

import 'components/checkbox_preference.dart';
import 'components/color_preference.dart';

class Settings extends StatelessWidget {
  static const routeName = '/settings';

  const Settings({super.key});

  _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('CheckBox'),
            content: CheckboxListTile(
              title: const Text("CheckBox Text"),
              value: true,
              onChanged: (val) {},
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          model:
              AppBarModel(MyLocalizations.of(context).values.drawer.settings),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: const MyDrawer(
        selectedItem: DrawerItemsEnum.settings,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            PreferenceTitle(
                title:
                    MyLocalizations.of(context).values.settings.generalTitle),
            ColorPreference(
              title:
                  MyLocalizations.of(context).values.settings.primaryColorTitle,
              subtitle: MyLocalizations.of(context)
                  .values
                  .settings
                  .primaryColorSubtitle,
              colors: MyColors.availablePrimaryColors,
              preferenceKey: MyPreferences.primaryColor,
            ),
            RadioButtonPreference(
              title:
                  MyLocalizations.of(context).values.settings.bibleVersionTitle,
              subtitle: MyLocalizations.of(context)
                  .values
                  .settings
                  .bibleVersionSubtitle,
              keys: Bibles.bibles,
              values: Bibles.biblesDescriptions(context),
              defaultValue: Bibles.defaultBible(AppState.of(context).language),
              preferenceKey: MyPreferences.bibleVersion,
              callback: () => AppState.of(context).load(context),
            ),
            RadioButtonPreference(
              title: MyLocalizations.of(context).values.settings.languageTitle,
              subtitle:
                  MyLocalizations.of(context).values.settings.languageSubtitle,
              keys: List.from(MyLocalizations.of(context).getLanguages().keys),
              values:
                  List.from(MyLocalizations.of(context).getLanguages().values),
              defaultValue: "",
              preferenceKey: MyPreferences.language,
              callback: () => AppState.of(context).load(context),
            ),
            CheckBoxPreference(
              title: MyLocalizations.of(context).values.settings.verseTitle,
              subtitle:
                  MyLocalizations.of(context).values.settings.verseSubtitle,
              preferenceKey: MyPreferences.showVerses,
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
            ListTile(
              title: const Text("This is a ListPreference"),
              subtitle: const Text("Subtitle goes here"),
              onTap: () {
                _displayDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
