import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

abstract class IFetchAllQrCodeImageDatasource {
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call();
}

abstract class IInsertQrCodeImageDatasource {
  Future<Either<IQrCodeUsecaseExceptions, int>> call(QrCodeEntity qrCode);
}
