import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class sqldb{


  static Database? _db;
  Future<Database?> get db async{
    if(_db == null){
     _db =  await initialdb();
     return _db;
    }else{
      return _db;
    }

  }
  initialdb  () async{

    String dbPath = await getDatabasesPath();
    String path = join(dbPath,'old_res.db');
    Database my_db = await openDatabase(path,onCreate: _oncreate,version: 1,onUpgrade: _onupgrade);
    return my_db;
  }
  _onupgrade(Database db , int old_version,int ne_version){



  print("on upgrade ==========================================");

  }
_oncreate(Database db , int ver)async{
await db.execute('''
CREATE TABLE poets (id INTEGER PRIMARY KEY, first TEXT, second text)
''');
print("create databse =========================================");

}

  readdata(String sql) async{
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
}

  Future<int> insertdata(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
  updatedata(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
  deletedata(String sql) async{
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

}