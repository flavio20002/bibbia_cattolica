import 'package:csv/csv.dart';

import '../assets.dart';
import '../model/bible_book.dart';
import '../model/bible_category.dart';
import '../model/bible_chapter.dart';

class BibleService {
  static Future<List<BibleCategoryModel>> getCategories(
      String testament, String language) async {
    final String csvData = await loadTextFromAsset(kAssetTextBibleCategorie);
    final List<List<dynamic>> csvTable = const CsvToListConverter()
        .convert(csvData, fieldDelimiter: ",", eol: "\r\n");

    // Rimuovi la prima riga (header) dal CSV
    if (csvTable.isNotEmpty) {
      csvTable.removeAt(0);
    }

    List<BibleCategoryModel> categories = [];

    for (var row in csvTable) {
      List<BibleBookModel> books = await getBooksByCategory(category: row[2]);
      if (row[1] == language && row[3] == testament) {
        categories.add(BibleCategoryModel(categoryTitle: row[2], books: books));
      }
    }

    return categories;
  }

  static Future<List<BibleBookModel>> getBooksByCategory(
      {required int category}) async {
    final String csvData = await loadTextFromAsset(kAssetTextBibleLibri);
    final List<List<dynamic>> csvTable = const CsvToListConverter()
        .convert(csvData, fieldDelimiter: ",", eol: "\n");

    // Rimuovi la prima riga (header) dal CSV
    if (csvTable.isNotEmpty) {
      csvTable.removeAt(0);
    }

    final bookList = csvTable
        .map((row) {
          return BibleBookModel(
            codBook: row[1],
            desBook: row[6],
            codTestamento: row[2],
            numeroCapitoli: row[4],
            category: row[3],
          );
        })
        .where((element) => element.category == category)
        .toList();

    return bookList;
  }

  static Future<List<BibleBookModel>> getBooksByTestament(
      {required String testament}) async {
    final String csvData = await loadTextFromAsset(kAssetTextBibleLibri);
    final List<List<dynamic>> csvTable = const CsvToListConverter()
        .convert(csvData, fieldDelimiter: ",", eol: "\n");

    // Rimuovi la prima riga (header) dal CSV
    if (csvTable.isNotEmpty) {
      csvTable.removeAt(0);
    }

    final bookList = csvTable
        .map((row) {
          return BibleBookModel(
            codBook: row[1],
            desBook: row[6],
            codTestamento: row[2],
            numeroCapitoli: row[4],
            category: row[3],
          );
        })
        .where((element) => element.codTestamento == testament)
        .toList();

    return bookList;
  }

  static Future<List<BibleChapterModel>> getAllChapters(
      String language, String bibleVersion) async {
    final String csvData = await loadTextFromAsset(kAssetTextBibleCapitoli);
    final List<List<dynamic>> csvTable = const CsvToListConverter()
        .convert(csvData, fieldDelimiter: ",", eol: "\n");

    // Rimuovi la prima riga (header) dal CSV
    if (csvTable.isNotEmpty) {
      csvTable.removeAt(0);
    }

    final bookList = csvTable
        .map((row) {
          return BibleChapterModel(
            codChapter: row[0],
            codBook: row[2],
            numChapter: row[4],
            desBook: 'aaaa',
            language: row[5],
            title: row[6],
            shortText: 'aaa',
          );
        })
        .where((element) => element.language == language)
        .toList();

    return bookList;
  }

  static Future<List<BibleBookModel>> getAllBooks(String language) async {
    final String csvData = await loadTextFromAsset(kAssetTextBibleLibri);
    final List<List<dynamic>> csvTable = const CsvToListConverter()
        .convert(csvData, fieldDelimiter: ",", eol: "\n");

    // Rimuovi la prima riga (header) dal CSV
    if (csvTable.isNotEmpty) {
      csvTable.removeAt(0);
    }

    final bookList = csvTable.map((row) {
      return BibleBookModel(
        codBook: row[1],
        desBook: row[6],
        codTestamento: row[2],
        numeroCapitoli: row[4],
        category: row[3],
      );
    }).toList();

    return bookList;
  }

  static Future<List<BibleChapterModel>> getChapters(
      {required String book,
      required String language,
      required String bibleVersion}) async {
    final String csvData = await loadTextFromAsset(kAssetTextBibleCapitoli);
    final List<List<dynamic>> csvTable = const CsvToListConverter()
        .convert(csvData, fieldDelimiter: ",", eol: "\n");

    // Rimuovi la prima riga (header) dal CSV
    if (csvTable.isNotEmpty) {
      csvTable.removeAt(0);
    }

    final bookList = csvTable
        .map((row) {
          return BibleChapterModel(
            codChapter: row[0],
            codBook: row[2],
            numChapter: row[4],
            desBook: 'aaaa',
            language: row[5],
            title: row[6],
            shortText: 'aaa',
          );
        })
        .where((element) => element.codBook == book)
        .toList();

    return bookList;
  }

  static Future<String> getChapter(String chapter, String bibleVersion) async {
    final String chapterText = await loadTextFromAsset(assetTextBible(chapter));
    return chapterText;
  }
}
