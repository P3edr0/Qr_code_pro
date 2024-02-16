enum QrCodeTypes { readCode, createCode, imageCode }

class QrCodeEntity {
  String? code;
  QrCodeTypes? type;
  String? createAt;

  QrCodeEntity(String this.code, QrCodeTypes this.type, String this.createAt);
}
