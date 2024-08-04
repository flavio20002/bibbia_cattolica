import 'package:bibbia_cattolica/common/colors.dart';
import 'package:flutter/material.dart';

import 'layout/my_padding_all.dart';
import 'layout/my_padding_bottom.dart';
import 'layout/my_padding_top.dart';

class MyCardWidget extends StatelessWidget {
  final Color cardColor;
  final Color textColor;
  final String title;
  final Color titleColor;
  final String text1;
  final Color text1Color;
  final String text2;
  final String text3;
  final String textRight;
  final VoidCallback onTap;
  final IconData icon;
  final VoidCallback iconEvent;

  const MyCardWidget({
    Key key,
    @required this.cardColor,
    @required this.textColor,
    @required this.title,
    @required this.titleColor,
    @required this.text1,
    @required this.text1Color,
    @required this.textRight,
    @required this.text2,
    @required this.text3,
    @required this.onTap,
    @required this.icon,
    @required this.iconEvent,
  }) : super(key: key);

  _getCard(context) {
    return Card(
      color: cardColor,
      margin: EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          _getContent(context),
          if (icon != null) _getIcon(context)
        ],
      ),
    );
  }

  _getContent(context) {
    return InkWell(
      onTap: onTap,
      child: MyPaddingAll(
        DefaultTextStyle(
          child: _getRows(),
          style: DefaultTextStyle.of(context).style.copyWith(color: textColor),
        ),
      ),
    );
  }

  _getRows() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        if (title != null)
          MyPaddingBottom(
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
          ),
        Text(
          text1,
          style: TextStyle(color: text1Color),
        ),
        if (textRight != null)
          MyPaddingTop(
            Text(textRight, textAlign: TextAlign.right),
          ),
        if (text2 != null)
          MyPaddingTop(
            Text(
              text2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (text3 != null)
          MyPaddingTop(
            Text(
              text3,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  _getIcon(context) {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: MyColors.transparent,
        child: InkWell(
          onTap: iconEvent,
          child: MyPaddingAll(
            Icon(
              icon,
              color: MyColors.textLightPrimary,
              size: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getCard(context);
  }
}
