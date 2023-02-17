import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:workmanager_example/data/models/location/location_model.dart';

class LocalDatabase {
  static String tableName = "Location";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("location.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        String intType = "REAL";

        await db.execute('''
        CREATE TABLE $tableName (
            ${LocationFields.id} $idType,
            ${LocationFields.lat} $textType,
            ${LocationFields.long} $textType,
            ${LocationFields.createdAt} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<LocationModel> insertToDatabase(
      {required LocationModel locationModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, locationModel.toJson());
    debugPrint("HAMMASI YAXSHI DATABASEGA MA'LUMOT QO'SHILDI");
    return locationModel.copyWith(id: id);
  }

  static Future<LocationModel> updateTaskById(
      {required LocationModel updatedContact}) async {
    var database = await getInstance.getDb();
    int id = await database.update(
      tableName,
      updatedContact.toJson(),
      where: 'id = ?',
      whereArgs: [updatedContact.id],
    );
    debugPrint("HAMMASI YAXSHI DATABASEGA MA'LUMOT YANGILANDI");
    return updatedContact.copyWith(id: id);
  }

  static Future<List<LocationModel>> getList() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tableName, columns: [
      LocationFields.id,
      LocationFields.lat,
      LocationFields.long,
      LocationFields.createdAt,
    ]);

    var list = listOfTodos.map((e) => LocationModel.fromJson(e)).toList();

    return list;
  }

  static Future<List<LocationModel>> getTaskByTitle({String title = ''}) async {
    var database = await getInstance.getDb();

    if (title.isNotEmpty) {
      var listOfTodos = await database.query(
        tableName,
        where: 'title LIKE ?',
        whereArgs: ['%$title%'],
      );
      var list = listOfTodos.map((e) => LocationModel.fromJson(e)).toList();
      return list;
    } else {
      var listOfTodos = await database.query(tableName, columns: [
        LocationFields.id,
        LocationFields.lat,
        LocationFields.long,
        LocationFields.createdAt,
      ]);

      var list = listOfTodos.map((e) => LocationModel.fromJson(e)).toList();
      return list;
    }
  }

  static Future<int> deleteLocationById({required int id}) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }
}
