import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/services/preferences_service.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPreference extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Color> colors;
  final String preferenceKey;
  ColorPreference(
      {@required this.title,
      @required this.subtitle,
      @required this.colors,
      @required this.preferenceKey,
      Key key})
      : super(key: key);

  @override
  _ColorPreference createState() => _ColorPreference();
}

class _ColorPreference extends State<ColorPreference> {
  Color _value = Colors.transparent;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  _displayDialog(BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(widget.title),
        content: SingleChildScrollView(
          child: BlockPicker(
            availableColors: widget.colors,
            pickerColor: _value,
            onColorChanged: (color) {
              saveValue(color.value);
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
                MyLocalizations.of(context).values.home.cancel.toUpperCase()),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> loadPreferences() async {
    int currentValue = await PreferencesService.getIntegerPreference(
        widget.preferenceKey, widget.colors[0].value);
    setState(() {
      _value = Color(currentValue);
    });
  }

  Future<void> saveValue(int value) async {
    await PreferencesService.setIntegerPreference(widget.preferenceKey, value);
    await loadPreferences();
    AppState.of(context).loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      trailing: Container(
        margin: EdgeInsets.all(3),
        width: 36,
        height: 36,
        decoration: BoxDecoration(color: _value, shape: BoxShape.circle),
      ),
      onTap: () {
        _displayDialog(context);
      },
    );
  }
}
