import 'package:flutter_movie_code_test/constants/app_const.dart';
import 'package:flutter_movie_code_test/database/movies/popular_movies_operations.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DbConfig {
  static final DbConfig _instance = DbConfig._internal();
  static Database? _database;

  factory DbConfig() {
    return _instance;
  }

  DbConfig._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, AppConst.dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await PopularMoviesOperations(db: db).createTable();
  }
}
