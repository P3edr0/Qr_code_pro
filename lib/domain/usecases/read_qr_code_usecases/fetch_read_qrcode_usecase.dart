import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/repository/read_qr_code_repository_impl.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/repositories/read_qrcode_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/read_qr_code_exceptions.dart';

class FetchQrCodeUsecase implements IFetchAllQrCodeRepository {
  @override
  Future<Either<IReadQrCodeUsercaseExceptions, List<QrCodeEntity>>> call(
      datasource) async {
    return FetchQrCodeRepositoryImpl().call(datasource);
  }
}
