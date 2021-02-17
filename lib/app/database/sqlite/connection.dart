import 'package:path/path.dart';
import 'package:primeiro_pro/app/database/script.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';

class Connection{
  static Database _db;

  static Future<Database>get() async{
    if(_db == null){
      var path = join(await getDatabasesPath(),'banco_contatos');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate:(db, v){
          db.execute(createTable);
          db.execute(insert1);
        },
        
        );
    }
    return _db;

  }
}