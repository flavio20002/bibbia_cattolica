class BibleBookModel {
  final String codBook;
  final String desBook;
  final String codTestamento;
  final int numeroCapitoli;
  final int category;

  BibleBookModel({
    required this.codTestamento,
    required this.numeroCapitoli,
    required this.codBook,
    required this.desBook,
    required this.category,
  });
}
