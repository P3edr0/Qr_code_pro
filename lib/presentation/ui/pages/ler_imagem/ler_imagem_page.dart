import 'package:flutter/material.dart';
import 'package:qr_code_pro/presentation/ui/pages/ler_imagem/ler_imagem_widgets.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import '../main.dart';

class LerImagemPage extends StatefulWidget {
  const LerImagemPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LerImagemState();
}

class _LerImagemState extends State<LerImagemPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: LerImagemWidgets(context).widgetPrincipal()));
  }
}
/*
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:barcode_scan/barcode_scan.dart';


Future<void> readQRCodeFromImage() async {
  // TODO: Aqui você deve implementar a lógica para escolher uma imagem da galeria

  File imageFile = ...;  // Substitua isso com a lógica para escolher uma imagem

  // Carregue a imagem usando a biblioteca image
  Uint8List bytes = await imageFile.readAsBytes();
  img.Image image = img.decodeImage(bytes);

  // Converta a imagem para uma lista de pixels
  List<List<int>> pixelData = [];
  for (int y = 0; y < image.height; y++) {
    List<int> row = [];
    for (int x = 0; x < image.width; x++) {
      int pixel = image.getPixel(x, y);
      row.add(pixel);
    }
    pixelData.add(row);
  }

  // Converta a lista de pixels em uma string
  String imageData = pixelData.toString();

  // Faça a leitura do QR code usando a biblioteca barcode_scan
  String result = await BarcodeScanner.scan(imageData);

  // Aqui você recebe os dados do QR code lido
  print('QR Code: $result');
}*/