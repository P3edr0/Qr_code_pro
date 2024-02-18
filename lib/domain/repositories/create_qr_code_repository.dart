import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/create_qr_code_datasource.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

abstract class IFetchAllCreateQrCodeRepository {
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      IFetchAllCreateQrCodeDatasource datasource);
}

abstract class IInsertCreateQrCodeRepository {
  Future<Either<IQrCodeUsecaseExceptions, int>> call(
      IInsertCreateQrCodeDatasource datasource, QrCodeEntity qrcode);
}
