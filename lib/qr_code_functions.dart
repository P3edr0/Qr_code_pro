import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
    try {
      await launch(url);
    } catch (_) {
      print("Nao conseguiu acessar o Site");
    }
  }

  // Future<void> _captureAndSharePng() async {
  //   try {
  //     RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
  //     var image = await boundary.toImage();
  //     ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
  //   //  Uint8List pngBytes = byteData.buffer.asUint8List();

  //    // final tempDir = await getTemporaryDirectory();
  //     final file = await new File('${tempDir.path}/image.png').create();
  //     await file.writeAsBytes(pngBytes);

  //     final channel = const MethodChannel('channel:me.alfian.share/share');
  //     channel.invokeMethod('shareFile', 'image.png');

  //   } catch(e) {
  //     print(e.toString());
  //   }
  // }

}
