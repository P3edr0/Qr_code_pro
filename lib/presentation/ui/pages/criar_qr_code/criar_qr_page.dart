import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/utils/constants.dart';
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
    return SafeArea(
      child: Scaffold(
          appBar: customAppbar(
            context,
            "CRIAR QR CODE",
            ProjectColors.lightRed,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Observer(builder: (context) {
                    return QrCodePreview(
                        firstValidation: (createQrStore.codigoCriadoMirror ==
                            'Inserir texto...'),
                        secondvalidation: createQrStore.load,
                        qrData: createQrStore.codigoCriadoMirror);
                  }),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                        color: ProjectColors.lightRed,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.qrcode,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 30),
                        Flexible(
                            child: Form(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                          actionFunction: (() async =>
                              await createQrStore.createQrButton()),
                          buttonText: "GERAR QR CODE",
                          iconbutton: FontAwesomeIcons.arrowCircleUp,
                          buttonColor: ProjectColors.lightRed),
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: createQrStore.codigoCriadoMirror !=
                                  'Inserir texto...'
                              ? () async {
                                  try {
                                    ByteData? byteData = await QrPainter(
                                            data:
                                                createQrStore.codigoCriado.text,
                                            dataModuleStyle:
                                                const QrDataModuleStyle(
                                                    color: Colors.red,
                                                    dataModuleShape:
                                                        QrDataModuleShape
                                                            .square),
                                            gapless: true,
                                            version: QrVersions.auto,
                                            eyeStyle: const QrEyeStyle(
                                                color: Colors.red,
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
                                            text: 'Compartilhamento do QR Code')
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
                                    log('Erro ao compartilhar imagem: $e');
                                  }
                                }
                              : null,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ProjectColors.lightRed,
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
                  Text(
                    "Códigos gerados",
                    style: TextStyle(
                        fontSize: 16,
                        color: ProjectColors.lightRed,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Observer(builder: (_) {
                    return Observer(builder: (_) {
                      return createQrStore.listViewSize != 0.0
                          ? LinksListview(
                              currentList: createQrStore.createdQrList,
                              listColor: ProjectColors.darkRed,
                              listHeight: createQrStore.listViewSize,
                              listItemCount: createQrStore.createdQrList.length,
                              selectedIndex: createQrStore.selectedIndex,
                              setCodigoLido: createQrStore.setCodigoCriado,
                              setListaQr: createQrStore.setListaQr,
                              setselectedIndex: createQrStore.setSelectedIndex,
                              startLoading: createQrStore.startLoading,
                              stopLoading: createQrStore.stopLoading)
                          : Container(
                              alignment: Alignment.center,
                              height: 120,
                              child: Text("nenhum código gerado...",
                                  style:
                                      TextStyle(color: ProjectColors.lightRed)),
                            );
                    });
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
