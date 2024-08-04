import 'dart:async';
import 'dart:io';

import 'package:bibbia_cattolica/model/book_model.dart';
import 'package:bibbia_cattolica/model/chapter_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Future<void> init(
      Context context, PackageInfo packageInfo, String bibleVersion) async {
    await deleteDbs();
    await initDb('database.db');
    await initDb('$bibleVersion.db');
  }

  static Future<bool> dbExists(dbName) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);
    return await databaseExists(path);
  }

  static Future<void> copyDb(dbName) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}
    ByteData data = await rootBundle.load(join('assets', 'db', dbName));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);
    print('Copied $dbName');
  }

  static Future<void> deleteDbs() async {
    Directory directory = new Directory(await getDatabasesPath());
    List<FileSystemEntity> files = directory.listSync();
    for (var file in files) {
      print(file.path);
    }
  }

  static Future<bool> shouldInitDb(context, dbName) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);
    var exists = await databaseExists(path);
    return !exists || !kReleaseMode;
  }

  static Future<void> initDb(dbName) async {
    WidgetsFlutterBinding.ensureInitialized();
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);
    var exists = await databaseExists(path);
    if (!exists || !kReleaseMode) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join('assets', 'db', dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print('Replaced $dbName');
    }
  }

  static final queryAllChapters = '''
    select
        l.codice,
        l.numero_capitoli,
        ld.des_libro,
        l.id_categoria,
        c.id,
        d.titolo,
        c.numero_capitolo,
        t.testo_breve
    from
        capitoli c,
        capitoli_des d,
        testi_brevi t,
        libri l,
        libri_des ld
    where
        c.id = d.id
        and c.cod_libro = l.codice
        and ld.id_libro = l.codice
        and ld.lingua = d.lingua
        and t.id = c.id
        and d.lingua = ?
        and t.cod_versione = ?
    order by
        c.idn
  ''';

  static final queryAllBooks = '''
    select
        l.codice,
        l.numero_capitoli,
        ld.des_libro,
        l.id_categoria
    from
        libri l,
        libri_des ld
    where
        ld.id_libro = l.codice
        and ld.lingua = ?
    order by
        l.id
  ''';

  static getAllChapters(String language, String bibleVersion) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');
    var db = await openDatabase(path, readOnly: true);
    List<Map> list =
        await db.rawQuery(queryAllChapters, [language, bibleVersion]);
    await db.close();
    List<ChapterModel> result = [];
    for (var elem in list) {
      result.add(
        ChapterModel(
          elem['id'],
          elem['titolo'],
          elem['numero_capitolo'],
          elem['testo_breve'],
          BookModel(elem['codice'], elem['des_libro'], elem['id_categoria'],
              elem['numero_capitoli']),
        ),
      );
    }
    return result;
  }

  static getAllBooks(String language) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');
    var db = await openDatabase(path, readOnly: true);
    List<Map> list = await db.rawQuery(queryAllBooks, [language]);
    await db.close();
    List<BookModel> result = [];
    for (var elem in list) {
      result.add(
        BookModel(elem['codice'], elem['des_libro'], elem['id_categoria'],
            elem['numero_capitoli']),
      );
    }
    return result;
  }
}
