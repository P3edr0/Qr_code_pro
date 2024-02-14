import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_image_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/utils/constants.dart';

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
            "INSERIR IMAGEM",
            ProjectColors.darkGreen,
          ),
          backgroundColor: ProjectColors.lightGrey,
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
                          buttonText: 'INSERIR',
                          iconbutton: FontAwesomeIcons.image,
                          buttonColor: ProjectColors.lightGreen),
                      const SizedBox(width: 20),
                      SharedQrCodeButton(
                          validation: (_readQrImageStore.capturedCodeMirror !=
                                  'Código capturado...' &&
                              _readQrImageStore.capturedCodeMirror !=
                                  'Código não lido'),
                          qrCodeData: _readQrImageStore.codigoCapturado,
                          sharedButtonColor: ProjectColors.lightGreen)
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
                            child: Text("nenhum código gerado",
                                style:
                                    TextStyle(color: ProjectColors.darkGreen)));
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
