import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final List cardsList;

  const CardList({super.key, required this.cardsList});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: cardsList.length,
          itemBuilder: (context, position) {
            bool last = cardsList.length == (position + 1);
            return Container(
                padding: last
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: cardsList[position]);
          },
        ),
      ),
    );
  }
}
