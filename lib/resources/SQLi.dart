
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:portalkiwi/model/User.dart';
import 'package:portalkiwi/resources/Config.dart';

class SQLi {

  static Future<sqflite.Database> _getDb() async {

    final path  = await sqflite.getDatabasesPath();
    final local = join(path, "db_portal_kiwi.db");
    return await sqflite.openDatabase(local, version: 1, onCreate: gerarTabelas);

  }

  static void gerarTabelas(db, dbversion){

    String sql = "CREATE TABLE "+Config.TABELA_USUARIOS+" "
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        " nome VARCHAR, device_key VARCHAR, token VARCHAR)";
    db.execute(sql);

  }

  static Future<User> getUser(Function callback) async {

    sqflite.Database database = await _getDb();
    List usuariosDB = await database.rawQuery("SELECT * FROM "+Config.TABELA_USUARIOS);

    User user;

    if(usuariosDB.length > 0){
      user = User(usuariosDB[0]['nome'], usuariosDB[0]['device_key'], usuariosDB[0]['token']);
    }

    callback(user);

  }

  static Future<int> setUser(User user) async {

    sqflite.Database database = await _getDb();

    Map<String, String> userToSave = {
      "nome":user.nome,
      "device_key":user.device_key
    };

    return await database.insert(Config.TABELA_USUARIOS, userToSave);

  }

}