import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String tableUser = 'user';
const String colId = 'id';
const String colUsername = 'username';
const String colPassword = 'password';

final String databaseName = 'User.db';
final int databaseVersion = 1;

class User {
  int? id;
  String? username;
  String? password;

  User();

  User.fromMap(Map<dynamic, dynamic> map) {
    id = map[colId];
    username = map[colUsername];
    password = map[colPassword];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colUsername: username,
      colPassword: password,
    };
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}

class UserProvider {
  UserProvider._privateConstructor();

  static final UserProvider instance =
  UserProvider._privateConstructor();

  late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await _initDatabase();
      return _db;
    }
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    print(path);
    return await openDatabase(path, version: databaseVersion, onCreate: _open);
  }

  Future _open(Database db, int version) async {
    await db.execute(''' 
     create table $tableUser ( 
     $colId integer primary key autoincrement, 
     $colUsername text, 
     $colPassword text) 
     ''');
  }

  Future<int> insert(User user) async {
    Database db = await instance.db;
    int id = await db.insert(tableUser, user.toMap());
    return id;
  }

  Future<User?> getUser(int id) async {
    Database db = await instance.db;
    List<Map> maps = await db.query(tableUser,
        columns: [colId, colUsername, colPassword],
        where: '$colId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    Database db = await instance.db;
    return await db
        .delete(tableUser, where: '$colId = ?', whereArgs: [id]);
  }

  Future close() async => _db.close();
}