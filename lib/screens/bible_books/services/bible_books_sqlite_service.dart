import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BibleBooksSqliteService {
  Future<List<Map<String, dynamic>>> queryBooks(String language) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');
    var db = await openDatabase(path, readOnly: true);
    List<Map<String, dynamic>> list = await db.rawQuery(
        'SELECT l.codice, l.numero_capitoli, d.des_libro, l.id_categoria FROM libri l, libri_des d where d.id_libro=l.codice and d.lingua = ? order by l.id',
        [language]);
    await db.close();
    return list;
  }

  Future<List<Map<String, dynamic>>> queryCategories(
      String testament, String language) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');
    var db = await openDatabase(path, readOnly: true);
    List<Map<String, dynamic>> list = await db.rawQuery(
        'SELECT id, descrizione FROM categorie where cod_testamento =  ? and lingua = ? order by id',
        [testament, language]);
    await db.close();
    return list;
  }
}
