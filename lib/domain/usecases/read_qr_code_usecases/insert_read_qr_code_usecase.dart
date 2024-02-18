import 'package:dartz/dartz.dart';
import 'package:qr_code_pro/data/repository/read_qr_code_repository_impl.dart';
import 'package:qr_code_pro/domain/repositories/read_qr_code_repository.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_exceptions.dart';

class InsertReadQrCodeUsecase implements IInsertReadQrCodeRepository {
  @override
  Future<Either<IQrCodeUsecaseExceptions, int>> call(datasource, qrCode) async {
    if (qrCode.code == null) {
      return Left(DataQrCodeException('O código não pode ser nulo'));
    }
    if (qrCode.type == null) {
      return Left(DataQrCodeException('O tipo do código não pode ser nulo'));
    }
    if (qrCode.createAt == null) {
      return Left(DataQrCodeException('A data de criação não pode ser nulo'));
    }
    if (qrCode.code!.isEmpty || qrCode.code! == '') {
      return Left(DataQrCodeException('O código não pode ser vazio'));
    }

    if (qrCode.createAt!.isEmpty || qrCode.createAt! == '') {
      return Left(DataQrCodeException('A data de criação não pode ser vazio'));
    }

    return InsertQrcodeRepositoryImpl().call(datasource, qrCode);
  }
}
