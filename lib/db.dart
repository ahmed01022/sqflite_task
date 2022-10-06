import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHealper{
  static Database? _dbbb;
  static const int _version = 1;
  static const String _tabelName = 'tassks';

  static Future<void> initDb() async {
    if (_dbbb != null) {
      debugPrint("not null db");
    } else {
      try {
        String _Path = await getDatabasesPath() + 'task.db';
        _dbbb = await openDatabase(_Path, version: _version,
            onCreate: (Database db, int version) async {
              await db.execute(
                'CREATE TABLE $_tabelName ('
                    'id INTEGER PRIMARY KEY AUTOINCREMENT ,'
                    'name TEXT ,age REAL ,gender INTEGER )'
              );
            },
            onOpen: (Database dbb){ }
            );


         // await deleteDatabase(_Path);
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert({required String name ,required double age ,required int gen})async{
   return await _dbbb!.rawInsert(
        'INSERT INTO $_tabelName(name, age, gender) VALUES(?, ?, ?)',[name, age, gen]);
  }
  static Future<List<Map<String, Object?>>> getdata()async{
    return await _dbbb!.rawQuery('SELECT * FROM $_tabelName');
  }
}