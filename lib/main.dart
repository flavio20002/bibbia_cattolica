import 'package:bibbia_cattolica/common/theme.dart';
import 'package:bibbia_cattolica/screens/home/home.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/colors.dart';
import 'common/routes.dart';
import 'common/service_locator.dart';
import 'components/base_view.dart';
import 'components/loading_view.dart';
import 'localization/localization.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BaseView<AppState>(
      initialize: (model) {
        model.load();
      },
      model: AppState(),
      builder: (context, model, child) => MaterialApp(
          locale: model.language == null ? null : Locale(model.language),
          routes: Routes.routes,
          onGenerateRoute: Routes.onGenerateRoute,
          onGenerateTitle: (BuildContext context) =>
              MyLocalizations.of(context).values.title,
          localizationsDelegates: [
            const MyLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: MyLocalizations.supportedLocales,
          theme: MyTheme.appTheme(context),
          initialRoute: '/',
          home: model.isLoading
              ? LoadingView(
                  backgroundColor: AppState.of(context).primaryColor,
                  indicatorColor: MyColors.textLightPrimary,
                )
              : MyHomePage()),
    );
  }
}
