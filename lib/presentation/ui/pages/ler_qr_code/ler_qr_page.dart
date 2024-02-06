import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/ler_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/qr_code_functions.dart';
import 'package:qr_code_pro/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';
  final LerQrStore lerQrStore = LerQrStore();
  bool _load = false;

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(
          context,
          'LER QR CODE',
          ProjectColors.darkblue,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Observer(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  lerQrStore.codigoLido == 'Leia um código...'
                      ? const SizedBox()
                      : const Text(
                          'QR CODE LIDO',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  const SizedBox(height: 14),
                  Observer(builder: (_) {
                    return lerQrStore.codigoLido == 'Leia um código...'
                        ? const Icon(
                            Icons.search,
                            size: 150,
                            color: Colors.grey,
                          )
                        : _load
                            ? Container(
                                height: 150,
                                width: 150,
                                color: Colors.white,
                                child: Image.asset(ImageProjectPath.loadQrcode))
                            : Container(
                                height: 150,
                                width: 150,
                                color: Colors.white,
                                child: QrImageView(
                                  data: lerQrStore.codigoLido,
                                  version: QrVersions.auto,
                                  size: 320,
                                  gapless: false,
                                  embeddedImageStyle:
                                      const QrEmbeddedImageStyle(
                                    size: Size(80, 80),
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
                                  color: ProjectColors.darkblue,
                                  border: Border.all(width: 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              padding: const EdgeInsets.only(left: 20),
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                color: ProjectColors.darkblue,
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
                                  FontAwesomeIcons.qrcode,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 30),
                                Text(
                                  'Leia um código...',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () async {
                            _load = true;
                            lerQrStore.setCodigoLido(
                                await QrCodeFunctions(context).scanQRCode());
                            lerQrStore.setListaQr();
                            lerQrStore.setTamanho();
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                _load = false;
                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ProjectColors.lightblue,
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
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: lerQrStore.codigoLido != 'Leia um código...'
                              ? () async {
                                  try {
                                    ByteData? byteData = await QrPainter(
                                            data: lerQrStore.codigoLido,
                                            dataModuleStyle: QrDataModuleStyle(
                                                color: ProjectColors.darkblue,
                                                dataModuleShape:
                                                    QrDataModuleShape.square),
                                            gapless: true,
                                            version: QrVersions.auto,
                                            eyeStyle: QrEyeStyle(
                                                color: ProjectColors.darkblue,
                                                eyeShape: QrEyeShape.square))
                                        .toImageData(878);

                                    final Uint8List pngBytes =
                                        byteData!.buffer.asUint8List();

                                    final directory =
                                        await getApplicationDocumentsDirectory();
                                    final imagePath = await File(
                                            '${directory.path}/image.png')
                                        .create();
                                    await imagePath.writeAsBytes(pngBytes);
                                    await Share.shareFiles([imagePath.path],
                                            subject: pngBytes.toString(),
                                            text: lerQrStore.codigoLido)
                                        .then((value) async => Future.delayed(
                                                const Duration(seconds: 2))
                                            .whenComplete(() =>
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'QR Code compartilhado com sucesso')),
                                                )));
                                  } catch (e) {
                                    // Lidar com erros ao compartilhar a imagem
                                    log('Erro ao compartilhar imagem: $e');
                                  }
                                }
                              : null,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ProjectColors.darkblue,
                                border: Border.all(width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            child: const Icon(
                              FontAwesomeIcons.share,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 3),
                                        decoration: BoxDecoration(
                                            color: ProjectColors.darkblue,
                                            border: Border.all(width: 1),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            )),
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
                                        await QrCodeFunctions(context).abrirUrl(
                                            lerQrStore.listaQr[index]);
                                      },
                                    );
                                  }),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 120,
                              child: const Text("nenhum código lido...",
                                  style: TextStyle(color: Colors.blue)),
                            );
                    });
                  }),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
