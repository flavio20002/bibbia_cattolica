import 'package:bibbia_cattolica/model/app_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarState with ChangeNotifier {
  AppBarState(AppBarModel model) {
    _model = model;
  }
  late AppBarModel _model;

  AppBarModel get model {
    return _model;
  }

  static AppBarState of(BuildContext context) {
    return Provider.of<AppBarState>(context, listen: false);
  }

  Future<void> update(model) async {
    _model = model;
    notifyListeners();
  }
}
