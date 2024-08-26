import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/layout/my_padding_all.dart';
import 'package:bibbia_cattolica/components/layout/my_padding_top.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/model/bible_book.dart';
import 'package:bibbia_cattolica/model/bible_category.dart';
import 'package:flutter/material.dart';
import 'package:bibbia_cattolica/common/theme.dart';

class MyCardCategory extends StatelessWidget {
  final BibleCategoryModel model;
  final void Function(BibleBookModel) onTap;

  const MyCardCategory({
    super.key,
    required this.model,
    required this.onTap,
  });

  _getCard(context) {
    return Card(
      color: MyColors.backgroundColorLight,
      margin: const EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          _getContent(context),
        ],
      ),
    );
  }

  _getContent(context) {
    return DefaultTextStyle(
      child: _getRows(context),
      style: DefaultTextStyle.of(context)
          .style
          .copyWith(color: MyColors.textDarkPrimary),
    );
  }

  _getRows(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        MyPaddingAll(
          child: Text(
            model.categoryTitle,
            style: MyTheme.myTitle(context),
          ),
        ),
        ListView.separated(
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemCount: model.books.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              onTap(
                model.books[index],
              );
            },
            child: MyPaddingAll(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(model.books[index].desBook),
                  MyPaddingTop(
                    child: Text(
                      model.books[index].numeroCapitoli == 1
                          ? MyLocalizations.of(context).values.bible.oneChapter
                          : "${model.books[index].numeroCapitoli} ${MyLocalizations.of(context).values.bible.chapters}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getCard(context);
  }
}
