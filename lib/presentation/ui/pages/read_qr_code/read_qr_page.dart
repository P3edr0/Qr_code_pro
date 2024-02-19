import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';
import 'package:qr_code_pro/presentation/utils/qr_code_functions.dart';

class ReadQrCodePage extends StatefulWidget {
  const ReadQrCodePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReadQrCodePageState();
}

class _ReadQrCodePageState extends State<ReadQrCodePage> {
  String qrCode = 'Unknown';
  final ReadQrStore lerQrStore = ReadQrStore();

  @override
  void initState() {
    lerQrStore.fetchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(
          context,
          'LER QR CODE',
          ProjectColors.darkblue,
        ),
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                lerQrStore.codigoLido == 'Leia um código...'
                    ? const SizedBox()
                    : const Text(
                        'QR CODE LIDO',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const SizedBox(height: 14),
                Observer(builder: (context) {
                  return QrCodePreview(
                      firstValidation:
                          (lerQrStore.codigoLido == 'Leia um código...'),
                      secondvalidation: lerQrStore.load,
                      qrData: lerQrStore.codigoLido);
                }),
                const SizedBox(height: 14),
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors.lightblue,
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 45,
                          child: const Icon(
                            FontAwesomeIcons.copy,
                            color: Colors.white,
                          ),
                        ),
                        onTap: lerQrStore.codigoLido != 'Leia um código...'
                            ? () async {
                                Clipboard.setData(ClipboardData(
                                        text: lerQrStore.codigoLido))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              ProjectColors.darkGreen,
                                          content: const Text(
                                            "Código QR copiado.",
                                            textAlign: TextAlign.center,
                                          )));
                                });
                              }
                            : null,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors.lightblue,
                              border: Border.all(width: 1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 45,
                          child: const Icon(
                            FontAwesomeIcons.globe,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () async {
                          bool launch = await QrCodeFunctions(context)
                              .abrirUrl(lerQrStore.codigoLido);
                          if (!launch) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ProjectColors.darkRed,
                                content: const Text(
                                  "Não foi possível acessar o site",
                                  textAlign: TextAlign.center,
                                )));
                          }
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ProjectColors.darkblue,
                            border: Border.all(width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            )),
                        padding: const EdgeInsets.only(left: 20),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.6,
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
                              child: SelectableText(
                                lerQrStore.codigoLido,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                        actionFunction: (() async =>
                            await lerQrStore.readQrCodeFunction(context)),
                        buttonText: 'LER QR CODE',
                        iconbutton: FontAwesomeIcons.plusCircle,
                        buttonColor: ProjectColors.lightblue),
                    const SizedBox(width: 20),
                    Observer(builder: (_) {
                      return SharedQrCodeButton(
                          validation:
                              (lerQrStore.codigoLido != 'Leia um código...'),
                          qrCodeData: lerQrStore.codigoLido,
                          sharedButtonColor: ProjectColors.lightblue);
                    })
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "Códigos lidos ",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Observer(builder: (_) {
                  return lerQrStore.listviewHeight != 0.0
                      ? LinksListview(
                          currentList: lerQrStore.readQrList,
                          listColor: ProjectColors.darkblue,
                          listHeight: lerQrStore.listviewHeight,
                          listItemCount: lerQrStore.readQrList.length,
                          selectedIndex: lerQrStore.selectedIndex,
                          setCodigoLido: lerQrStore.setCodigoLido,
                          setListaQr: lerQrStore.setListaQr,
                          setselectedIndex: lerQrStore.setSelectedIndex,
                          startLoading: lerQrStore.startLoading,
                          stopLoading: lerQrStore.stopLoading)
                      : Container(
                          alignment: Alignment.center,
                          height: 120,
                          child: const Text("nenhum código lido",
                              style: TextStyle(color: Colors.blue)),
                        );
                }),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
