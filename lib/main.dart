import 'package:bibbia_cattolica/common/theme.dart';
import 'package:bibbia_cattolica/screens/home/home.dart';
import 'package:bibbia_cattolica/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/colors.dart';
import 'common/routes.dart';
import 'common/service_locator.dart';
import 'components/base_view.dart';
import 'components/loading_view.dart';
import 'localization/localization.dart';

void main() {
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BaseView<AppState>(
      initialize: (model) {
        model.load(context);
      },
      model: AppState(),
      builder: (context, model, child) => MaterialApp(
          locale: Locale(model.language),
          routes: Routes.routes,
          onGenerateRoute: Routes.onGenerateRoute,
          onGenerateTitle: (BuildContext context) =>
              MyLocalizations.of(context).values.title,
          localizationsDelegates: const [
            MyLocalizationsDelegate(),
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
              : const MyHomePage()),
    );
  }
}
