import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';

class QrCodeDto extends QrCodeEntity {
  QrCodeDto(String? code, QrCodeTypes? type, String? createAt)
      : super(code!, type!, createAt!);

  Map toMap() {
    return {
      'code': code,
      'type': type,
      'create_at': createAt,
    };
  }

  factory QrCodeDto.fromMap(Map<dynamic, dynamic> map) {
    return QrCodeDto(map['code'] ?? '', convertStringToEnum(map['type'] ?? ''),
        map['createAt'] ?? '');
  }

  static QrCodeTypes convertStringToEnum(String input) {
    return QrCodeTypes.values.firstWhere(
      (e) => e.toString().split('.').last == input,
      orElse: () => QrCodeTypes.readCode,
    );
  }
}
