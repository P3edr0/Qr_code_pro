abstract class IQrCodeUsecaseExceptions implements Exception {
  String message = "Falha ao buscar código qr.";
  IQrCodeUsecaseExceptions([message = "Falha ao buscar código qr."]);
}

class FetchUsercaseException extends IQrCodeUsecaseExceptions {
  @override
  FetchUsercaseException(
      [String message = "Erro ao fazer a busca dos códigos."])
      : super(message);
}

class InsertQrCodecaseException extends IQrCodeUsecaseExceptions {
  @override
  InsertQrCodecaseException(
      [String message = "Erro ao fazer a inserção do código."])
      : super(message);
}

class DataQrCodeException extends IQrCodeUsecaseExceptions {
  @override
  DataQrCodeException([String message = "Dado inválido."]) : super(message);
}

class BadRequestQrCodeException extends IQrCodeUsecaseExceptions {
  @override
  BadRequestQrCodeException(
      [String message = "Falha ao tentar acessar banco de dados."])
      : super(message);
}

class NotFoundQrCodeException extends IQrCodeUsecaseExceptions {
  @override
  NotFoundQrCodeException([String message = "Códigos não encontrados"])
      : super(message);
}
