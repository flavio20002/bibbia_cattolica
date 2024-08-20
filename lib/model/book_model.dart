import 'dart:convert';

class BookModel {
  final String codBook;
  final String desBook;
  final int category;
  final int chapters;
  BookModel(this.codBook, this.desBook, this.category, this.chapters);
  @override
  bool operator ==(o) => o is BookModel && codBook == o.codBook;
  @override
  int get hashCode => codBook.hashCode;

  @override
  String toString() {
    return const JsonEncoder.withIndent('  ').convert(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'codBook': codBook,
      'desBook': desBook,
      'category': category,
      'chapters': chapters
    };
  }
}
