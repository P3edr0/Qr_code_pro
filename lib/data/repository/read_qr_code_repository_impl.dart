import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/read_qr_code_datasource.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/repositories/read_qr_code_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

class FetchQrCodeRepositoryImpl implements IFetchAllQrCodeRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      IFetchAllReadQrCodeDatasource datasource) async {
    try {
      var result = await datasource.call();
      return result.fold((l) => Left(l), (r) {
        return Right(r);
      });
    } catch (e) {
      return Left(FetchUsercaseException());
    }
  }
}

class InsertQrcodeRepositoryImpl implements IInsertReadQrCodeRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, int>> call(
      IInsertReadQrCodeDatasource datasource, QrCodeEntity qrcode) async {
    try {
      var result = await datasource.call(qrcode);
      return result.fold((l) => Left(l), (r) => Right(r));
    } catch (e) {
      return Left(NotFoundQrCodeException());
    }
  }
}
