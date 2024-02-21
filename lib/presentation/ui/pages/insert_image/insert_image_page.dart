import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/qr_code_image_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

class InsertImagePage extends StatefulWidget {
  const InsertImagePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InsertImageState();
}

class _InsertImageState extends State<InsertImagePage> {
  final QrCodeImageStore _qrCodeImageStore = QrCodeImageStore();
  final picker = ImagePicker();
  @override
  void initState() {
    _qrCodeImageStore.fetchList();
    super.initState();
  }

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
                            (_qrCodeImageStore.capturedCodeMirror ==
                                    'Código capturado...' ||
                                _qrCodeImageStore.capturedCodeMirror ==
                                    'Código não lido'),
                        secondvalidation: _qrCodeImageStore.load,
                        qrData: _qrCodeImageStore.capturedCode);
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
                            _qrCodeImageStore.capturedCode,
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
                              await _qrCodeImageStore.readImage()),
                          buttonText: 'INSERIR',
                          iconbutton: FontAwesomeIcons.image,
                          buttonColor: ProjectColors.lightGreen),
                      const SizedBox(width: 20),
                      Observer(builder: (_) {
                        return SharedQrCodeButton(
                            validation: (_qrCodeImageStore.capturedCodeMirror !=
                                    'Código capturado...' &&
                                _qrCodeImageStore.capturedCodeMirror !=
                                    'Código não lido'),
                            qrCodeData: _qrCodeImageStore.capturedCode,
                            sharedButtonColor: ProjectColors.lightGreen);
                      })
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
                    return _qrCodeImageStore.listViewSize != 0.0
                        ? LinksListview(
                            currentList: _qrCodeImageStore.capturedQrList,
                            listColor: ProjectColors.darkGreen,
                            listHeight: _qrCodeImageStore.listViewSize,
                            listItemCount:
                                _qrCodeImageStore.capturedQrList.length,
                            selectedIndex: _qrCodeImageStore.selectedIndex,
                            setCodigoLido: _qrCodeImageStore.setCapturedCode,
                            setListaQr: _qrCodeImageStore.setListaQr,
                            setselectedIndex:
                                _qrCodeImageStore.setSelectedIndex,
                            startLoading: _qrCodeImageStore.startLoading,
                            stopLoading: _qrCodeImageStore.stopLoading)
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
