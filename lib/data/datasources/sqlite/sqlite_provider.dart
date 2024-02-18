import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlfliteProvider {
  static Database? _database;

  static final SqlfliteProvider _instance = SqlfliteProvider._internal();

  factory SqlfliteProvider() {
    return _instance;
  }

  SqlfliteProvider._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await starDatabase();
    return _database!;
  }

  Future<Database> starDatabase() async {
    if (_database != null) {
      return _database!;
    }
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'qrcodepro.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('DROP TABLE IF EXISTS qrcodes');

      await db.execute('''
          CREATE TABLE IF NOT EXISTS qrcodes (
            id INTEGER PRIMARY KEY,
            code TEXT,
            type TEXT,
            createAt TEXT
          )
        ''');
    });
    log("Database Criado");
    return _database!;
  }
}
