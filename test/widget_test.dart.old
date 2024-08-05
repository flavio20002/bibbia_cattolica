import 'package:bibbia_cattolica/localization/en.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/screens/bible_books/bible_books.dart';
import 'package:bibbia_cattolica/screens/home/components/card_testament.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyCardTestament', (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            locale: Locale('en'),
            title: 'Flutter layout demo',
            localizationsDelegates: [
              const MyLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              body: Builder(
                builder: (ctx) => MyCardTestament(
                  testament: BibleBooks.oldTestament(ctx),
                  titleColor: Colors.green,
                  onTap: () => Scaffold.of(ctx).showSnackBar(
                    SnackBar(
                      content: Text('Tap'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    expect(
        find.text(
          DefaultLanguage().home.oldTestamentTitle.toUpperCase(),
        ),
        findsOneWidget);

    await tester.tap(
      find.byType(MyCardTestament),
    );
  });
}
