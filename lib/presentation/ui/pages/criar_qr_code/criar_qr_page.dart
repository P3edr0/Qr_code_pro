import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/qr_code_functions.dart';
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
  bool _load = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppbar(
            context,
            "CRIAR QR CODE",
            Colors.red.shade700,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Observer(builder: (_) {
                    return createQrStore.codigoCriado.text == 'Inserir texto...'
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
                                  data: createQrStore.codigoCriado.text,
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
                      InkWell(
                          onTap: () async {
                            _load = true;
                            setState(() {});
                            createQrStore.setListaQr();
                            createQrStore.setlistViewSize();
                            Future.delayed(const Duration(seconds: 2), () {
                              _load = false;
                              setState(() {});
                            });
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
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: () async {
                            try {
                              ByteData? byteData = await QrPainter(
                                      data: createQrStore.codigoCriado.text,
                                      dataModuleStyle: const QrDataModuleStyle(
                                          color: Colors.red,
                                          dataModuleShape:
                                              QrDataModuleShape.square),
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
                              final imagePath =
                                  await File('${directory.path}/image.png')
                                      .create();
                              await imagePath.writeAsBytes(pngBytes);
                              await Share.shareFiles([imagePath.path],
                                      subject: pngBytes.toString(),
                                      text: 'Compartilhamento do QR Code')
                                  .then((value) async =>
                                      Future.delayed(const Duration(seconds: 2))
                                          .whenComplete(() =>
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'QR Code compartilhado com sucesso')),
                                              )));

                              // Mostre algum feedback para o usuário
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            // width: MediaQuery.of(context).size.width * 0.5,
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
                        color: Colors.red.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Observer(builder: (_) {
                    return Observer(builder: (_) {
                      return createQrStore.listViewSize != 0.0
                          ? Container(
                              color: Colors.white,
                              height: createQrStore.listViewSize,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ListView.builder(
                                  itemCount: createQrStore.createdQrList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 3),
                                        decoration: BoxDecoration(
                                            color: Colors.red.shade400,
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
                                                createQrStore
                                                    .createdQrList[index],
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
                                            createQrStore.createdQrList[index]);
                                      },
                                    );
                                  }),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 120,
                              child: Text("nenhum código gerado...",
                                  style: TextStyle(color: Colors.red.shade700)),
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
