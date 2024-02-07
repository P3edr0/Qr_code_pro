import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/ler_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
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
            child: Column(
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
                Observer(builder: (context) {
                  return QrCodePreview(
                      firstValidation:
                          (lerQrStore.codigoLido == 'Leia um código...'),
                      secondvalidation: lerQrStore.load,
                      qrData: lerQrStore.codigoLido);
                }),
                const SizedBox(height: 14),
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors.lightblue,
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 45,
                          child: const Icon(
                            FontAwesomeIcons.copy,
                            color: Colors.white,
                          ),
                        ),
                        onTap: lerQrStore.codigoLido != 'Leia um código...'
                            ? () async {
                                Clipboard.setData(ClipboardData(
                                        text: lerQrStore.codigoLido))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              ProjectColors.darkGreen,
                                          content: const Text(
                                            "Código QR copiado.",
                                            textAlign: TextAlign.center,
                                          )));
                                });
                              }
                            : null,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors.lightblue,
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 45,
                          child: const Icon(
                            FontAwesomeIcons.globe,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () async {
                          bool launch = await QrCodeFunctions(context)
                              .abrirUrl(lerQrStore.codigoLido);
                          if (!launch) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ProjectColors.darkRed,
                                content: const Text(
                                  "Não foi possível acessar o site",
                                  textAlign: TextAlign.center,
                                )));
                          }
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ProjectColors.darkblue,
                            border: Border.all(width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            )),
                        padding: const EdgeInsets.only(left: 20),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.6,
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
                              child: SelectableText(
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
                    ],
                  );
                }),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                        actionFunction: (() async =>
                            await lerQrStore.readQrCodeFunction(context)),
                        buttonText: 'LER QR CODE',
                        iconbutton: FontAwesomeIcons.plusCircle),
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
                                  final imagePath =
                                      await File('${directory.path}/image.png')
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              ProjectColors.darkRed,
                                          content: const Text(
                                            "Não foi possível compartilhar QR Code",
                                            textAlign: TextAlign.center,
                                          )));
                                }
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors.lightblue,
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
                  return lerQrStore.tamanho != 0.0
                      ? Container(
                          color: Colors.white,
                          height: lerQrStore.tamanho,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Observer(builder: (context) {
                            return ListView.builder(
                                itemCount: lerQrStore.listaQr.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    child: Observer(builder: (context) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 3),
                                        decoration: BoxDecoration(
                                            color: lerQrStore.selectedIndex !=
                                                    index
                                                ? Colors.white
                                                : ProjectColors.darkblue,
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    lerQrStore.selectedIndex !=
                                                            index
                                                        ? ProjectColors.darkblue
                                                        : Colors.black),
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
                                            Icon(
                                              lerQrStore.selectedIndex == index
                                                  ? FontAwesomeIcons
                                                      .arrowAltCircleRight
                                                  : FontAwesomeIcons.qrcode,
                                              color: lerQrStore.selectedIndex !=
                                                      index
                                                  ? ProjectColors.darkblue
                                                  : Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${index + 1} - ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    lerQrStore.selectedIndex !=
                                                            index
                                                        ? ProjectColors.darkblue
                                                        : Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 228,
                                              child: Text(
                                                lerQrStore.listaQr[index],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: lerQrStore
                                                                .selectedIndex !=
                                                            index
                                                        ? ProjectColors.darkblue
                                                        : Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    onTap: () async {
                                      if (lerQrStore.selectedIndex == index) {
                                        lerQrStore.selectedIndex = -1;
                                        lerQrStore.setCodigoLido('-1');
                                        lerQrStore.setListaQr();
                                      } else {
                                        lerQrStore.startLoading();
                                        lerQrStore.setCodigoLido(
                                            lerQrStore.listaQr[index]);
                                        lerQrStore.setSelectedIndex(index);
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          lerQrStore.stopLoading();
                                        });
                                      }
                                    },
                                  );
                                });
                          }),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: 120,
                          child: const Text("nenhum código lido...",
                              style: TextStyle(color: Colors.blue)),
                        );
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
