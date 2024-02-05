import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
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
  final CreateQrStore createQrStore = CreateQrStore();
  final bool _load = false;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppbar(
            context,
            "LER IMAGEM",
            Colors.green.shade700,
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
                        color: Colors.green.shade700,
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
                            final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);

                            if (pickedFile != null) {
                              // Aqui, você pode usar pickedFile.path para obter o caminho da imagem
                              // File imageFile = File(pickedFile.path);
                              String? result =
                                  await Scan.parse(pickedFile.path);

                              // imagePath: pickedFile.path,
                              log("Imagem correta !");
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                              // // Converta a imagem em bytes
                              // Uint8List bytes = imageFile.readAsBytesSync();

                              // // Converta os bytes em uma string base64
                              // String base64Image = base64Encode(bytes);

                              // // Use a string base64 como conteúdo do QR code
                              log(result!, name: "Conteudo do qr code");

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            } else {
                              // Usuário cancelou a seleção
                            }
                            // _load = true;
                            // setState(() {});
                            // createQrStore.setListaQr();
                            // createQrStore.setlistViewSize();
                            // Future.delayed(const Duration(seconds: 2), () {
                            //   _load = false;
                            //   setState(() {});
                            // });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green.shade700,
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
                          onTap: () async {
                            try {
                              ByteData? byteData = await QrPainter(
                                      data: createQrStore.codigoCriado.text,
                                      dataModuleStyle: const QrDataModuleStyle(
                                          color: Colors.green,
                                          dataModuleShape:
                                              QrDataModuleShape.square),
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
                                color: Colors.green.shade500,
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
                        color: Colors.green.shade700,
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
                                            color: Colors.green.shade400,
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
                                  style:
                                      TextStyle(color: Colors.green.shade700)),
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