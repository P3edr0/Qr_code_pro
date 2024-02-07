import 'package:flutter/material.dart';
import 'package:qr_code_pro/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePreview extends StatefulWidget {
  const QrCodePreview(
      {Key? key,
      required this.firstValidation,
      required this.secondvalidation,
      required this.qrData})
      : super(
          key: key,
        );
  final bool firstValidation;
  final bool secondvalidation;
  final String qrData;

  @override
  State<QrCodePreview> createState() => _QrCodePreviewState();
}

class _QrCodePreviewState extends State<QrCodePreview> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return widget.firstValidation
        ? const Icon(
            Icons.search,
            size: 150,
            color: Colors.grey,
          )
        : widget.secondvalidation
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
                  data: widget.qrData,
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                ),
              );
  }
}
