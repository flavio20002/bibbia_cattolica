import 'package:bibbia_cattolica/common/colors.dart';
import 'package:bibbia_cattolica/components/card_list.dart';
import 'package:bibbia_cattolica/localization/localization.dart';
import 'package:bibbia_cattolica/screens/bible_books/components/cards.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    String? hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Center(
        child: Text(
          MyLocalizations.of(context).values.home.searchShortQuery,
        ),
      );
    } else {
      return CardList(
        cardsList: BibleBooksCards.cards(context, []),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Column();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: MyColors.textLightDisabled),
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: theme.textTheme.bodyMedium!
            .copyWith(color: MyColors.textLightPrimary),
      ),
    );
  }
}
