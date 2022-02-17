import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeFunctions {
  BuildContext context;
  QrCodeFunctions(this.context);

  String qrCode = "";

  setQrCode(value) => qrCode = value;

  Future scanQRCode() async {
    try {
      //  var ok = Colors.blue.shade700,
      qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff1976D2',
        'Cancelar',
        true,
        ScanMode.DEFAULT,
      );

      //    print("Qr Code >>> $qrCode");
      // if (!mounted) return;

      // setState(() {
      //   this.qrCode = qrCode;
      // });
      return qrCode;
    } catch (_) {
      return -1;
      //  qrCode = 'Failed to get platform version.';
    }
  }

  abrirUrl(url) async {
    print("URL >>> $url");
    // const url = 'https://flutterando.com.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Nao conseguiu acessar o Site");
    }
  }
}
