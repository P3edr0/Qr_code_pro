import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/repository/create_qr_code_repository_impl.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/repositories/create_qr_code_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

class FetchCreateQrCodeUsecase implements IFetchAllCreateQrCodeRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, List<QrCodeEntity>>> call(
      datasource) async {
    return FetchCreateQrCodeRepositoryImpl().call(datasource);
  }
}
