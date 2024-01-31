import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class CriarQrPage extends StatefulWidget {
  const CriarQrPage({Key? key}) : super(key: key);
  @override
  _CriarQrPageState createState() => _CriarQrPageState();
}

class _CriarQrPageState extends State<CriarQrPage> {
  final CreateQrStore createQrStore = CreateQrStore();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.red.shade700,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          embeddedImageStyle: const QrEmbeddedImageStyle(
                            size: Size(80, 80),
                          ),
                        ),
                      );
                    }),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red.shade700,
                          border: Border.all(width: 1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      height: 45,
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
                              child: Form(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              controller: createQrStore.codigoCriado,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                        onTap: () async {
// QrImageView.withQr(qr: qr)
                          setState(() {});
                          // lerQrStore.setCodigoLido(
                          //     await QrCodeFunctions(context).scanQRCode());
                          // lerQrStore.setListaQr();
                          // lerQrStore.setTamanho();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
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
                                FontAwesomeIcons.arrowCircleUp,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "GERAR QR CODE",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                    InkWell(
                        onTap: () async {
                          try {
                            final image = QrImageView(
                              data: createQrStore.codigoCriado.text,
                              version: QrVersions.auto,
                              size: 200.0,
                            );
                            ByteData? byteData = await QrPainter(
                              data: "http://www.google.com",
                              // topLeftRadius: 10,
                              // bottomLeftRadius: 10,
                              // topRightRadius: 10,
                              // bottomRightRadius: 10,
                              gapless: true,
                              version: QrVersions.auto,
                              // color: const Color.fromRGBO(0, 118, 191, 1),
                              // emptyColor: Colors.white,
                            ).toImageData(878);
                            // final ByteData byteData = await image.toByteData(
                            //     format: ImageByteFormat.png);
                            final Uint8List pngBytes =
                                byteData!.buffer.asUint8List();

                            // Compartilhe a imagem usando o pacote 'share'
                            await Share.shareFiles(['qr_code.png'],
                                subject: pngBytes.toString(),
                                // {'qr_code.png': pngBytes},
                                text: 'Compartilhamento do QR Code');

                            // Mostre algum feedback para o usuário
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'QR Code compartilhado com sucesso')),
                            );
                          } catch (e) {
                            // Lidar com erros ao compartilhar a imagem
                            log('Erro ao compartilhar imagem: $e');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red.shade500,
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
                                FontAwesomeIcons.arrowCircleUp,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "ENVIAR QR CODE",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )));
  }
}
