import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_pro/presentation/ui/pages/ler_qr_code/store/ler_qr_store.dart';
import 'package:qr_code_pro/qr_code_functions.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    final lerQrStore = Provider.of<LerQrStore>(context, listen: false);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(actions: [
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: const Text(
                  "LER QR CODE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                alignment: Alignment.center,
                color: Colors.blue.shade700,
              )
            ]),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'QR CODE LIDO',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Observer(builder: (_) {
                    return Container(
                      height: 150,
                      width: 150,
                      color: Colors.white,
                      child: QrImage(
                        data: lerQrStore.codigoLido,
                        version: QrVersions.auto,
                        size: 320,
                        gapless: false,
                        // embeddedImage:  //AssetImage('assets/images/logo.png'),
                        embeddedImageStyle: QrEmbeddedImageStyle(
                          size: const Size(80, 80),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 14),
                  Observer(builder: (_) {
                    return lerQrStore.codigoLido != ""
                        ? GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  border: Border.all(width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              padding: const EdgeInsets.only(left: 20),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.qrcode,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 30),
                                  Flexible(
                                    child: Text(
                                      lerQrStore.codigoLido,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              await QrCodeFunctions(context)
                                  .abrirUrl(lerQrStore.codigoLido);
                            },
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700,
                                border: Border.all(width: 4),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            padding: const EdgeInsets.only(left: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.qrcode,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 30),
                                Text(
                                  "Vazio",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
                  const SizedBox(height: 72),
                  ElevatedButton(
                      onPressed: () async {
                        //   print("Codigo Lido >>>> ${lerQrStore.codigoLido}");
                        lerQrStore.setCodigoLido(
                            await QrCodeFunctions(context).scanQRCode());
                        lerQrStore.setListaQr();
                        lerQrStore.setTamanho();
                        // print("Codigo Lido 2222 >>>> ${lerQrStore.codigoLido}");
                      },
                      child: const Text("ler Qr Code")),
                  const SizedBox(height: 50),
                  const Text("Histórico",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  Observer(builder: (_) {
                    return Observer(builder: (_) {
                      return lerQrStore.tamanho != 0.0
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              color: Colors.white,
                              height: lerQrStore.tamanho,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  itemCount: lerQrStore.listaQr.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: Text("${index + 1} - "),
                                          ),
                                          SizedBox(
                                            height: 50,
                                            child:
                                                Text(lerQrStore.listaQr[index]),
                                          ),
                                        ],
                                      ),
                                      onTap: () async {
                                        await QrCodeFunctions(context).abrirUrl(
                                            lerQrStore.listaQr[index]);
//qrCodeFunctions(context).
                                      },
                                    );
                                  }),
                            )
                          : const Text("Vazio",
                              style: TextStyle(color: Colors.white));
                    });
                  }),
                ],
              ),
            )));
    // LerQrWidgets(context).widgetsPrincipal()));
  }
}
