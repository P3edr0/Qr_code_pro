import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

class CreateQrPage extends StatefulWidget {
  const CreateQrPage({Key? key}) : super(key: key);
  @override
  _CreateQrPageState createState() => _CreateQrPageState();
}

class _CreateQrPageState extends State<CreateQrPage> {
  final CreateQrStore createQrStore = CreateQrStore();

  @override
  void initState() {
    createQrStore.fetchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppbar(
            context,
            "CRIAR QR CODE",
            ProjectColors.darkRed,
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
                        firstValidation: (createQrStore.codigoCriadoMirror ==
                            'Inserir texto...'),
                        secondvalidation: createQrStore.load,
                        qrData: createQrStore.codigoCriadoMirror);
                  }),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                        color: ProjectColors.darkRed,
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
                          actionFunction: (() async {
                            createQrStore.setCodigoMirrorCriado(
                                createQrStore.codigoCriado.text);

                            await createQrStore.createQrButton();
                          }),
                          buttonText: "GERAR QR CODE",
                          iconbutton: FontAwesomeIcons.arrowCircleUp,
                          buttonColor: ProjectColors.lightRed),
                      const SizedBox(width: 20),
                      Observer(builder: (_) {
                        return SharedQrCodeButton(
                            validation: (createQrStore.codigoCriadoMirror !=
                                'Inserir texto...'),
                            qrCodeData: createQrStore.codigoCriadoMirror,
                            sharedButtonColor: ProjectColors.lightRed);
                      })
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
                            child: Text("nenhum código gerado",
                                style:
                                    TextStyle(color: ProjectColors.lightRed)),
                          );
                  })
                ],
              ),
            ),
          )),
    );
  }
}
