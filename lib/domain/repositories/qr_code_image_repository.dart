import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/qrcode_image_datasource.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

abstract class IFetchAllQrCodeImageRepository {
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      IFetchAllQrCodeImageDatasource datasource);
}

abstract class IInsertQrCodeImageRepository {
  Future<Either<IQrCodeUsecaseExceptions, int>> call(
      IInsertQrCodeImageDatasource datasource, QrCodeEntity qrcode);
}
