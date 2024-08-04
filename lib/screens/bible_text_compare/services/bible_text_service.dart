import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BibleTextService {
  static Future<String> getText(String id, String bibleVersion) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, '$bibleVersion.db');
    var db = await openDatabase(path, readOnly: true);
    List<Map> list =
        await db.rawQuery('SELECT * FROM testi where id =  ?', [id]);
    return list.isEmpty ? '' : list[0]['testo'];
  }
}
