import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BibleHtmlText extends StatelessWidget {
  final String html;

  const BibleHtmlText({super.key, required this.html});

  @override
  Widget build(BuildContext context) {
    Widget widget = Padding(
      padding: const EdgeInsets.all(16),
      child: SelectionArea(
        child: HtmlWidget(
          html,
          customStylesBuilder: (element) {
            if (element.localName == 'sup' ||
                element.classes.contains('titoli')) {
              return {'color': '#CC0000'};
            }
            return null;
          },
          onErrorBuilder: (context, element, error) =>
              Text('$element error: $error'),
          onLoadingBuilder: (context, element, loadingProgress) =>
              const CircularProgressIndicator(),
          renderMode: RenderMode.column,
          textStyle: DefaultTextStyle.of(context).style.copyWith(fontSize: 26),
        ),
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: widget,
      ),
    );
  }
}
