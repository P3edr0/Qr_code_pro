import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/repository/qr_code_image_repository_impl.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/repositories/qr_code_image_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

class FetchReadQrImageCodeUsecase implements IFetchAllQrCodeImageRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      datasource) async {
    return FetchQrCodeImageRepositoryImpl().call(datasource);
  }
}
