import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TestSqfliteProvider {
  static Database? _testDatabase;

  static final TestSqfliteProvider _instance = TestSqfliteProvider._internal();

  factory TestSqfliteProvider() {
    return _instance;
  }

  TestSqfliteProvider._internal();

  Future<Database> get database async {
    if (_testDatabase != null) {
      return _testDatabase!;
    }

    _testDatabase = await starTestDatabase();
    return _testDatabase!;
  }

  Future<Database> starTestDatabase() async {
    if (_testDatabase != null) {
      return _testDatabase!;
    }
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'testdatabase.db');
    _testDatabase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS qrcodes (
            id INTEGER PRIMARY KEY,
            code TEXT,
            type TEXT,
            createAt TEXT
          )
        ''');
    });
    log("Teste Database Criado");
    return _testDatabase!;
  }
}
