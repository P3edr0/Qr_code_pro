import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/datasources/qrcode_image_datasource.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/repositories/qr_code_image_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

class FetchQrCodeImageRepositoryImpl implements IFetchAllQrCodeImageRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      IFetchAllQrCodeImageDatasource datasource) async {
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

class InsertQrcodeImageRepositoryImpl implements IInsertQrCodeImageRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, int>> call(
      IInsertQrCodeImageDatasource datasource, QrCodeEntity qrcode) async {
    try {
      var result = await datasource.call(qrcode);
      return result.fold((l) => Left(l), (r) => Right(r));
    } catch (e) {
      return Left(NotFoundQrCodeException());
    }
  }
}
