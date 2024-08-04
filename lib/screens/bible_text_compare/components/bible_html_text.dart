import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/html_parser/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

class BibleHtmlText extends StatelessWidget {
  final String html;

  BibleHtmlText({@required this.html});

  @override
  Widget build(BuildContext context) {
    Widget widget = Html(
      data: html,
      padding: html.startsWith('<div')
          ? EdgeInsets.only(left: 8, right: 8, bottom: 8)
          : EdgeInsets.all(8),
      defaultTextStyle: DefaultTextStyle.of(context).style.copyWith(
          //fontSize: 26
          ),
      customTextStyle: (dom.Node node, TextStyle baseStyle) {
        if (node is dom.Element) {
          switch (node.className) {
            case 'titoli':
              return baseStyle.merge(
                TextStyle(
                    color: MyColors.textDarkInverse,
                    fontWeight: FontWeight.bold),
              );
          }
          switch (node.localName) {
            case 'sup':
              return baseStyle.merge(
                TextStyle(color: MyColors.textDarkInverse),
              );
          }
        }
        return baseStyle;
      },
      customEdgeInsets: (dom.Node node) {
        if (node is dom.Element) {
          switch (node.className) {
            case 'rientrato':
              return EdgeInsets.only(top: 8, bottom: 8, left: 16);
          }
          switch (node.localName) {
            case 'div':
              return EdgeInsets.only(top: 8);
            case 'p':
              return EdgeInsets.only(top: 8);
          }
        }
        return null;
      },
      customTextAlign: (dom.Node node) {
        if (node is dom.Element) {
          switch (node.className) {
            case 'rientrato':
              return TextAlign.start;
          }
          switch (node.localName) {
            case 'p':
              return TextAlign.justify;
          }
        }
        return TextAlign.start;
      },
    );
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: widget,
        ),
      ),
    );
  }
}
