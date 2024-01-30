import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/ler_qr_store.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CriarQrWidgets {
  BuildContext context;
  CriarQrWidgets(this.context);

  Widget widgetPrincipal() {
    return Column(children: <Widget>[
      // _appBar(),
      _body(),
    ]);
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 20),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: const Text(
        "CRIAR QR CODE",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      color: Colors.red.shade700,
    );
  }

  Widget _body() {
    final LerQrStore lerQrStore = LerQrStore();
    //final controller = TextEditingController();
    return Center(
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
                  data: lerQrStore.codigoCriado.text,
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
                Expanded(child: buildTextField(context)),
                const SizedBox(width: 12),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.done, size: 30),
                  onPressed: () {
                    print("Criado = ${lerQrStore.codigoCriado.text}");
                  }, // setState(() {}),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    final lerQrStore = Provider.of<LerQrStore>(context, listen: false);
    // final controller = TextEditingController();
    return TextField(
      controller: lerQrStore.codigoCriado,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: 'Enter the data',
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
