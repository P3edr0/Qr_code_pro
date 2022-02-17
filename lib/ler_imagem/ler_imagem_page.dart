import 'package:flutter/material.dart';
import 'package:qr_code_pro/ler_imagem/ler_imagem_widgets.dart';
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
