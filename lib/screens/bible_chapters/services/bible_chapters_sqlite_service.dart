import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BibleChaptersSqliteService {
  Future<List<Map<String, dynamic>>> queryChapters(
      String bookCode, String language, String bibleVersion) async {
    final query = '''
    select c.id, d.titolo, c.numero_capitolo, t.testo_breve
    from capitoli c, capitoli_des d, testi_brevi t
    where c.id = d.id
    and t.id = c.id
    and c.cod_libro = ?
    and d.lingua = ?
    and t.cod_versione = ?
    order by c.numero_capitolo
  ''';
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database.db');
    var db = await openDatabase(path, readOnly: true);
    List<Map> list =
        await db.rawQuery(query, [bookCode, language, bibleVersion]);
    await db.close();
    return list;
  }
}
