import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/create_qr_code_datasource.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/repositories/create_qr_code_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

class FetchCreateQrCodeRepositoryImpl
    implements IFetchAllCreateQrCodeRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      IFetchAllCreateQrCodeDatasource datasource) async {
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

class InsertCreateQrcodeRepositoryImpl
    implements IInsertCreateQrCodeRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, int>> call(
      IInsertCreateQrCodeDatasource datasource, QrCodeEntity qrcode) async {
    try {
      var result = await datasource.call(qrcode);
      return result.fold((l) => Left(l), (r) => Right(r));
    } catch (e) {
      return Left(NotFoundQrCodeException());
    }
  }
}
