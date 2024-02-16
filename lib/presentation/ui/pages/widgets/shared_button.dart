import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

class SharedQrCodeButton extends StatelessWidget {
  const SharedQrCodeButton(
      {Key? key,
      required this.validation,
      required this.qrCodeData,
      required this.sharedButtonColor})
      : super(key: key);
  final bool validation;
  final String qrCodeData;
  final Color sharedButtonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: sharedButtonColor,
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
      ),
      onTap: validation
          ? () async {
              log('Pertado e é');
              try {
                ByteData? byteData = await QrPainter(
                        data: qrCodeData,
                        dataModuleStyle: const QrDataModuleStyle(
                            color: ProjectColors.white,
                            dataModuleShape: QrDataModuleShape.square),
                        gapless: true,
                        version: QrVersions.auto,
                        eyeStyle: const QrEyeStyle(
                            color: ProjectColors.white,
                            eyeShape: QrEyeShape.square))
                    .toImageData(878);

                final Uint8List pngBytes = byteData!.buffer.asUint8List();

                final directory = await getApplicationDocumentsDirectory();
                final imagePath =
                    await File('${directory.path}/image.png').create();
                await imagePath.writeAsBytes(pngBytes);
                await Share.shareFiles([imagePath.path],
                        subject: pngBytes.toString(),
                        text:
                            'Conteúdo do qr code: \n\n$qrCodeData \n\n Gerado por Qr Code Pro.')
                    .then((value) async =>
                        Future.delayed(const Duration(seconds: 4)).whenComplete(
                            () => ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'QR Code compartilhado com sucesso')),
                                )));
              } catch (e) {
                log('Erro ao compartilhar imagem: $e');
              }
            }
          : null,
    );
  }
}
