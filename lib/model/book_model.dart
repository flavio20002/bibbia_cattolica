import 'dart:convert';

class BookModel {
  final String codBook;
  final String desBook;
  final int category;
  final int chapters;
  BookModel(this.codBook, this.desBook, this.category, this.chapters);
  bool operator ==(o) => o is BookModel && codBook == o.codBook;
  int get hashCode => codBook.hashCode;

  @override
  String toString() {
    return JsonEncoder.withIndent('  ').convert(this.toMap());
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
