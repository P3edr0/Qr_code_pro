import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectFunctions {
  BuildContext context;
  ProjectFunctions(this.context);

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
    }
  }

  Future<bool> abrirUrl(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);

      return true;
    } else {
      return false;
    }
  }
}
