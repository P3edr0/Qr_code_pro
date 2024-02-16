import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/read_qr_code_exceptions.dart';

abstract class IFetchAllQrCodeDatasource {
  Future<Either<IReadQrCodeUsercaseExceptions, List<QrCodeEntity>>> call();
}

abstract class IInsertQrCodeDatasource {
  Future<Either<IReadQrCodeUsercaseExceptions, int>> call(QrCodeEntity qrCode);
}
