import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_pro/ler_qr_code/ler_qr_widgets.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: LerQrWidgets(context).widgetsPrincipal()));
  }

  // Future<void> scanQRCode() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666',
  //       'Cancel',
  //       true,
  //       ScanMode.QR,
  //     );

  //     print("Qr Code >>> $qrCode");
  //     if (!mounted) return;

  //     setState(() {
  //       this.qrCode = qrCode;
  //     });
  //   } on PlatformException {
  //     qrCode = 'Failed to get platform version.';
  //   }
  // }
}
