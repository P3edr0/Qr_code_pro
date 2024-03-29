import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/read_qr_code_datasource.dart';
import 'package:qr_code_pro/data/datasources/sqlite/sqlite_provider.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';
import 'package:sqflite/sqflite.dart';

class InsertReadQrCodeSqlite implements IInsertReadQrCodeDatasource {
  @override
  Future<Either<IQrCodeUsecaseExceptions, int>> call(
      QrCodeEntity qrCode) async {
    Database db = await SqlfliteProvider().database;
    try {
      // List<Map<String, dynamic>> columns =
      //     await db.rawQuery('PRAGMA table_info(qrcodes)');

      // for (var column in columns) {
      //   log('Column: ${column['name']} - Type: ${column['type']}');
      // }

      int id = await db.rawInsert(
          'INSERT INTO qrcodes(code, type,createAt) VALUES("${qrCode.code}", "${qrCode.type.toString().split('.').last}","${qrCode.createAt}")');
      log(id.toString(), name: 'Id Save');

      return Right(id);
    } catch (e) {
      log('Falhou');

      return Left(NotFoundQrCodeException());
    }
  }
}
