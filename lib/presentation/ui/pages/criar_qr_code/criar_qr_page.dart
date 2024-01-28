import 'package:flutter/material.dart';
import 'package:qr_code_pro/presentation/ui/pages/criar_qr_code/criar_qr_widgets.dart';

class CriarQrPage extends StatefulWidget {
  const CriarQrPage({Key? key}) : super(key: key);
  @override
  _CriarQrPageState createState() => _CriarQrPageState();
}

class _CriarQrPageState extends State<CriarQrPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.black,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: CriarQrWidgets(context).widgetPrincipal(),
        ));
  }
}
