import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';

class QrCodeDto extends QrCodeEntity {
  QrCodeDto({String? code, QrCodeTypes? type, String? createAt})
      : super('', QrCodeTypes.readCode, '');

  Map toMap() {
    return {
      'code': code,
      'type': type,
      'create_at': createAt,
    };
  }

  QrCodeDto fromMap(Map map) {
    return QrCodeDto(
        code: map['code'],
        type: convertStringToEnum(map['type']),
        createAt: map['createAt']);
  }

  QrCodeTypes convertStringToEnum(String input) {
    return QrCodeTypes.values.firstWhere(
      (e) => e.toString().split('.').last == input,
      orElse: () => QrCodeTypes.readCode,
    );
  }
}
