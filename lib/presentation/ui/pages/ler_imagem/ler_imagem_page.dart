import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_image_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/qr_code_functions.dart';
import 'package:qr_code_pro/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scan/scan.dart';
import 'package:share/share.dart';

class LerImagemPage extends StatefulWidget {
  const LerImagemPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LerImagemState();
}

class _LerImagemState extends State<LerImagemPage> {
  final ReadQrImageStore _readQrImageStore = ReadQrImageStore();
  bool _load = false;
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
                  QrCodePreview(
                      firstValidation: (_readQrImageStore.codigoCapturado ==
                              'Código capturado...' ||
                          _readQrImageStore.codigoCapturado ==
                              'Código não lido'),
                      secondvalidation: _load,
                      qrData: _readQrImageStore.codigoCapturado),
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
                            child: Form(
                          child: Text(
                            _readQrImageStore.codigoCapturado,
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
                            setState(() {});
                            _load = true;
                            final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (pickedFile != null) {
                              String? result =
                                  await Scan.parse(pickedFile.path);

                              if (result == null) {
                                _readQrImageStore.codigoCapturado =
                                    'Código não lido';
                                _load = false;
                                setState(() {});
                              } else {
                                _readQrImageStore.codigoCapturado = result;
                                Future.delayed(const Duration(seconds: 2), () {
                                  _load = false;
                                  _readQrImageStore.setListaQr();
                                  _readQrImageStore.setlistViewSize();
                                  setState(() {});
                                });
                              }

                              log(result!, name: "Conteudo do qr code");
                            } else {
                              _load = false;
                              setState(() {});
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ProjectColors.darkGreen,
                                border: Border.all(width: 1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            padding: const EdgeInsets.only(left: 20),
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.image,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Inserir imagem..',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(width: 20),
                      InkWell(
                          onTap: _readQrImageStore.codigoCapturado !=
                                      'Código capturado...' &&
                                  _readQrImageStore.codigoCapturado !=
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
                    return Observer(builder: (_) {
                      return _readQrImageStore.listViewSize != 0.0
                          ? Container(
                              color: Colors.white,
                              height: _readQrImageStore.listViewSize,
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ListView.builder(
                                  itemCount:
                                      _readQrImageStore.capturedQrList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 3),
                                        decoration: BoxDecoration(
                                            color: ProjectColors.lightGreen,
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
                                                _readQrImageStore
                                                    .capturedQrList[index],
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
                                            _readQrImageStore
                                                .capturedQrList[index]);
                                      },
                                    );
                                  }),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: 120,
                              child: Text("nenhum código gerado...",
                                  style: TextStyle(
                                      color: ProjectColors.darkGreen)),
                            );
                    });
                  }),
                ],
              ),
            ),
          )),
    );
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: Scaffold(body: LerImagemWidgets(context).widgetPrincipal()));
  // }
}
/*
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:barcode_scan/barcode_scan.dart';


Future<void> readQRCodeFromImage() async {
  // TODO: Aqui você deve implementar a lógica para escolher uma imagem da galeria

  File imageFile = ...;  // Substitua isso com a lógica para escolher uma imagem

  // Carregue a imagem usando a biblioteca image
  Uint8List bytes = await imageFile.readAsBytes();
  img.Image image = img.decodeImage(bytes);

  // Converta a imagem para uma lista de pixels
  List<List<int>> pixelData = [];
  for (int y = 0; y < image.height; y++) {
    List<int> row = [];
    for (int x = 0; x < image.width; x++) {
      int pixel = image.getPixel(x, y);
      row.add(pixel);
    }
    pixelData.add(row);
  }

  // Converta a lista de pixels em uma string
  String imageData = pixelData.toString();

  // Faça a leitura do QR code usando a biblioteca barcode_scan
  String result = await BarcodeScanner.scan(imageData);

  // Aqui você recebe os dados do QR code lido
  print('QR Code: $result');
}*/