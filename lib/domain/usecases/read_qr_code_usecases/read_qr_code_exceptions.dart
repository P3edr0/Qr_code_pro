abstract class IReadQrCodeUsercaseExceptions implements Exception {
  IReadQrCodeUsercaseExceptions(
      [String message = "Falha ao buscar código qr."]);
}

class FetchUsercaseException extends IReadQrCodeUsercaseExceptions {
  @override
  FetchUsercaseException(
      [String message = "Erro ao fazer a busca dos códigos."])
      : super(message);
}

class InsertQrCodecaseException extends IReadQrCodeUsercaseExceptions {
  @override
  InsertQrCodecaseException(
      [String message = "Erro ao fazer a inserção do código."])
      : super(message);
}

class DataQrCodeException extends IReadQrCodeUsercaseExceptions {
  @override
  DataQrCodeException([String message = "Dado inválido."]) : super(message);
}

class BadRequestQrCodeException extends IReadQrCodeUsercaseExceptions {
  @override
  BadRequestQrCodeException(
      [String message = "Falha ao tentar acessar banco de dados."])
      : super(message);
}

class NotFoundQrCodeException extends IReadQrCodeUsercaseExceptions {
  @override
  NotFoundQrCodeException([String message = "Códigos não encontrados"])
      : super(message);
}
