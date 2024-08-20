import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/services/preferences_service.dart';
import 'package:flutter/material.dart';

class RadioButtonPreference extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> keys;
  final List<String> values;
  final String defaultValue;
  final String preferenceKey;
  final Function callback;

  const RadioButtonPreference({
    super.key,
    required this.title,
    required this.subtitle,
    required this.keys,
    required this.values,
    required this.defaultValue,
    required this.preferenceKey,
    required this.callback,
  });

  @override
  _RadioButtonPreference createState() => _RadioButtonPreference();
}

class _RadioButtonPreference extends State<RadioButtonPreference> {
  String? _value;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  _displayDialog(BuildContext context) async {
    if (_value != null) {
      int languageIndex =
          !widget.keys.contains(_value!) ? 0 : widget.keys.indexOf(_value!);
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.title),
            contentPadding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 24.0),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  for (var v in widget.values)
                    RadioListTile(
                      value: widget.values.indexOf(v),
                      groupValue: languageIndex,
                      onChanged: (ind) {
                        if (ind != null) {
                          saveValue(widget.keys[ind]);
                          Navigator.of(context).pop();
                        }
                      },
                      title: Text(v),
                    )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(MyLocalizations.of(context)
                    .values
                    .home
                    .cancel
                    .toUpperCase()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  Future<void> loadPreferences() async {
    String currentValue = await PreferencesService.getStringPreference(
        widget.preferenceKey, widget.defaultValue);
    setState(() {
      _value = currentValue;
    });
  }

  Future<void> saveValue(String value) async {
    if (value.isEmpty) {
      await PreferencesService.removePreference(widget.preferenceKey);
    } else {
      await PreferencesService.setStringPreference(widget.preferenceKey, value);
    }
    await loadPreferences();
    await widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      onTap: () {
        _displayDialog(context);
      },
    );
  }
}
