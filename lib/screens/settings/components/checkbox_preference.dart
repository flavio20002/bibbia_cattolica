import 'package:bibbia_cattolica/services/preferences_service.dart';
import 'package:flutter/material.dart';

class CheckBoxPreference extends StatefulWidget {
  final String title;
  final String subtitle;
  final String preferenceKey;

  const CheckBoxPreference(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.preferenceKey});

  @override
  _CheckBoxPreferenceState createState() => _CheckBoxPreferenceState();
}

class _CheckBoxPreferenceState extends State<CheckBoxPreference> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    bool currentValue = await PreferencesService.getBooleanPreference(
        widget.preferenceKey, true);
    setState(() {
      _value = currentValue;
    });
  }

  Future<void> saveValue(bool value) async {
    await PreferencesService.setBooleanPreference(widget.preferenceKey, value);
    await loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _value,
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      onChanged: (value) {
        if (value != null) {
          saveValue(value);
        }
      },
    );
  }
}
