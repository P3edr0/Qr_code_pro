import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/read_qr_code_datasource.dart';
import 'package:qr_code_pro/data/datasources/sqlite/sqlite_provider.dart';
import 'package:qr_code_pro/data/dto/qr_code_dto.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/read_qr_code_exceptions.dart';
import 'package:sqflite/sqflite.dart';

class FetcReadQrCodeSqlite implements IFetchAllQrCodeDatasource {
  @override
  Future<Either<IReadQrCodeUsercaseExceptions, List<QrCodeEntity>>>
      call() async {
    Database db = await SqlfliteProvider().database;
    try {
      List<Map> tempQrCodeList = await db
          .rawQuery('SELECT * FROM qrcodes WHERE type =?', ['readCode']);
      List<QrCodeEntity> lister =
          tempQrCodeList.map((qrCode) => QrCodeDto.fromMap(qrCode)).toList();
      return Right(lister);
    } catch (e) {
      return Left(NotFoundQrCodeException());
    }
  }
}
