import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/read_qr_code_datasource.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/read_qr_code_exceptions.dart';

abstract class IFetchAllQrCodeRepository {
  Future<Either<IReadQrCodeUsercaseExceptions, List<QrCodeEntity>>> call(
      IFetchAllQrCodeDatasource datasource);
}

abstract class IInsertQrCodeRepository {
  Future<Either<IReadQrCodeUsercaseExceptions, int>> call(
      IInsertQrCodeDatasource datasource, QrCodeEntity qrcode);
}
