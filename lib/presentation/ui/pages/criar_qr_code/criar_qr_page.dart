import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CriarQrPage extends StatefulWidget {
  const CriarQrPage({Key? key}) : super(key: key);
  @override
  _CriarQrPageState createState() => _CriarQrPageState();
}

class _CriarQrPageState extends State<CriarQrPage> {
  // final controller = TextEditingController();

  final CreateQrStore createQrStore = CreateQrStore();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.black,
        home: Scaffold(
            appBar: customAppbar(
              context,
              "CRIAR QR CODE",
              Colors.red.shade700,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      return Container(
                        height: 150,
                        width: 150,
                        color: Colors.white,
                        child: QrImageView(
                          data: createQrStore.codigoCriado.text,
                          version: QrVersions.auto,
                          size: 320,
                          gapless: false,
                          // embeddedImage:  //AssetImage('assets/images/logo.png'),
                          embeddedImageStyle: const QrEmbeddedImageStyle(
                            size: Size(80, 80),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        // Expanded(child: buildTextField(context)),
                        const SizedBox(width: 12),
                        FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: const Icon(Icons.done, size: 30),
                          onPressed: () {
                            // print("Criado = ${lerQrStore.codigoCriado.text}");
                          }, // setState(() {}),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
