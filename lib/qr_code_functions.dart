import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeFunctions {
  BuildContext context;
  QrCodeFunctions(this.context);

  String qrCode = "";

  setQrCode(value) => qrCode = value;

  Future scanQRCode() async {
    try {
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff1976D2',
        'Cancelar',
        true,
        ScanMode.DEFAULT,
      );

      return qrCode;
    } catch (_) {
      return -1;
      //  qrCode = 'Failed to get platform version.';
    }
  }

  abrirUrl(url) async {
    print("URL >>> $url");
    // const url = 'https://flutterando.com.br/';
    try {
      await launch(url);
    } catch (_) {
      print("Nao conseguiu acessar o Site");
    }
  }
}
