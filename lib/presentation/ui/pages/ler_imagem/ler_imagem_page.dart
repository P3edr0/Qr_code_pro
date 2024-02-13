import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_image_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class LerImagemPage extends StatefulWidget {
  const LerImagemPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LerImagemState();
}

class _LerImagemState extends State<LerImagemPage> {
  final ReadQrImageStore _readQrImageStore = ReadQrImageStore();
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppbar(
            context,
            "LER IMAGEM",
            ProjectColors.darkGreen,
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
                        firstValidation:
                            (_readQrImageStore.capturedCodeMirror ==
                                    'Código capturado...' ||
                                _readQrImageStore.capturedCodeMirror ==
                                    'Código não lido'),
                        secondvalidation: _readQrImageStore.load,
                        qrData: _readQrImageStore.codigoCapturado);
                  }),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                        color: ProjectColors.darkGreen,
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Observer(builder: (context) {
                      return Row(
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
                            _readQrImageStore.codigoCapturado,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                          actionFunction: (() async =>
                              await _readQrImageStore.readImage()),
                          buttonText: 'INSERIR..',
                          iconbutton: FontAwesomeIcons.image,
                          buttonColor: ProjectColors.lightGreen),
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: _readQrImageStore.capturedCodeMirror !=
                                      'Código capturado...' &&
                                  _readQrImageStore.capturedCodeMirror !=
                                      'Código não lido'
                              ? () async {
                                  try {
                                    ByteData? byteData = await QrPainter(
                                            data: _readQrImageStore
                                                .codigoCapturado,
                                            dataModuleStyle:
                                                const QrDataModuleStyle(
                                                    color: Colors.green,
                                                    dataModuleShape:
                                                        QrDataModuleShape
                                                            .square),
                                            gapless: true,
                                            version: QrVersions.auto,
                                            eyeStyle: const QrEyeStyle(
                                                color: Colors.green,
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
                                                const Duration(seconds: 4))
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
                                color: ProjectColors.lightGreen,
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
                    "Códigos capturados",
                    style: TextStyle(
                        fontSize: 16,
                        color: ProjectColors.darkGreen,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  Observer(builder: (_) {
                    return _readQrImageStore.listViewSize != 0.0
                        ? LinksListview(
                            currentList: _readQrImageStore.capturedQrList,
                            listColor: ProjectColors.darkGreen,
                            listHeight: _readQrImageStore.listViewSize,
                            listItemCount:
                                _readQrImageStore.capturedQrList.length,
                            selectedIndex: _readQrImageStore.selectedIndex,
                            setCodigoLido: _readQrImageStore.setCodigoCapturado,
                            setListaQr: _readQrImageStore.setListaQr,
                            setselectedIndex:
                                _readQrImageStore.setSelectedIndex,
                            startLoading: _readQrImageStore.startLoading,
                            stopLoading: _readQrImageStore.stopLoading)
                        : Container(
                            alignment: Alignment.center,
                            height: 120,
                            child: Text("nenhum código gerado...",
                                style:
                                    TextStyle(color: ProjectColors.darkGreen)));
                  }),
                  // Observer(builder: (_) {
                  //   return

                  //   _readQrImageStore.listViewSize != 0.0
                  //       ? Container(
                  //           color: Colors.white,
                  //           height: _readQrImageStore.listViewSize,
                  //           width: MediaQuery.of(context).size.width * 0.85,
                  //           child: ListView.builder(
                  //               itemCount:
                  //                   _readQrImageStore.capturedQrList.length,
                  //               itemBuilder: (BuildContext context, int index) {
                  //                 return GestureDetector(
                  //                   child: Container(
                  //                     margin: const EdgeInsets.symmetric(
                  //                         vertical: 3),
                  //                     decoration: BoxDecoration(
                  //                         color: ProjectColors.lightGreen,
                  //                         border: Border.all(width: 1),
                  //                         borderRadius: const BorderRadius.all(
                  //                           Radius.circular(10),
                  //                         )),
                  //                     padding: const EdgeInsets.only(left: 20),
                  //                     height: 40,
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.start,
                  //                       children: [
                  //                         const Icon(
                  //                           FontAwesomeIcons.qrcode,
                  //                           color: Colors.white,
                  //                         ),
                  //                         const SizedBox(
                  //                           width: 10,
                  //                         ),
                  //                         Text(
                  //                           "${index + 1} - ",
                  //                           style: const TextStyle(
                  //                             fontSize: 16,
                  //                             color: Colors.white,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 228,
                  //                           child: Text(
                  //                             _readQrImageStore
                  //                                 .capturedQrList[index],
                  //                             style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 color: Colors.white,
                  //                                 overflow:
                  //                                     TextOverflow.ellipsis),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   onTap: () async {
                  //                     await QrCodeFunctions(context).abrirUrl(
                  //                         _readQrImageStore
                  //                             .capturedQrList[index]);
                  //                   },
                  //                 );
                  //               }),
                  //         )
                  //       : Container(
                  //           alignment: Alignment.center,
                  //           height: 120,
                  //           child: Text("nenhum código gerado...",
                  //               style:
                  //                   TextStyle(color: ProjectColors.darkGreen)),
                  //         );
                  // }),
                ],
              ),
            ),
          )),
    );
  }
}
