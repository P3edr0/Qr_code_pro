import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final LerQrStore lerQrStore = LerQrStore();

  @override
  void initState() {
    lerQrStore.listaQr.addAll([
      'https://meusgastos.com.brhubuhbhubhbhbhbhbhb',
      'https://meusgastos.com.brhubuhbhubhbhbhbhbhb',
      'https://meusgastos.com.brhubuhbhubhbhbhbhbhb',
      'https://meusgastos.com.brhubuhbhubhbhbhbhbhb',
      'https://meusgastos.com.brhubuhbhubhbhbhbhbhb',
      'https://meusgastos.com.brhubuhbhubhbhbhbhbhb',
      'https://meusgastos.com.br'
    ]);
    lerQrStore.setTamanho();

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'QR CODE LIDO',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
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
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                          padding: const EdgeInsets.only(left: 20),
                          height: 40,
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
                                "VAZIO",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                }),
                const SizedBox(height: 40),
                InkWell(
                    onTap: () async {
                      lerQrStore.setCodigoLido(
                          await QrCodeFunctions(context).scanQRCode());
                      lerQrStore.setListaQr();
                      lerQrStore.setTamanho();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade500,
                          border: Border.all(width: 1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                      padding: const EdgeInsets.only(left: 20),
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.plusCircle,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "LER QR CODE",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 50),
                const Text(
                  "Códigos lidos ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Observer(builder: (_) {
                  return Observer(builder: (_) {
                    return lerQrStore.tamanho != 0.0
                        ? Container(
                            color: Colors.white,
                            height: lerQrStore.tamanho,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: ListView.builder(
                                itemCount: lerQrStore.listaQr.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade700,
                                          border: Border.all(width: 1),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          )),
                                      padding: const EdgeInsets.only(left: 20),
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.qrcode,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${index + 1} - ",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 228,
                                            child: Text(
                                              lerQrStore.listaQr[index],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      await QrCodeFunctions(context)
                                          .abrirUrl(lerQrStore.listaQr[index]);
                                    },
                                  );
                                }),
                          )
                        : const Text("Vazio",
                            style: TextStyle(color: Colors.blue));
                  });
                }),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
