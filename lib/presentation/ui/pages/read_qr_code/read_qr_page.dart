import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/alerts.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/custom_appbar.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';
import 'package:qr_code_pro/presentation/utils/functions.dart';

class ReadQrCodePage extends StatefulWidget {
  const ReadQrCodePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ReadQrCodePageState();
}

class _ReadQrCodePageState extends State<ReadQrCodePage> {
  String qrCode = 'Unknown';
  final ReadQrStore readQrStore = ReadQrStore();

  @override
  void initState() {
    readQrStore.fetchList();
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
                readQrStore.codigoLido == 'Leia um código...'
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
                          (readQrStore.codigoLido == 'Leia um código...'),
                      secondvalidation: readQrStore.load,
                      qrData: readQrStore.codigoLido);
                }),
                const SizedBox(height: 14),
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: readQrStore.copyButtonColor,
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
                        onTap: readQrStore.codigoLido != 'Leia um código...'
                            ? () async {
                                readQrStore
                                    .setCopyButtonColor(ProjectColors.darkblue);
                                await Clipboard.setData(ClipboardData(
                                        text: readQrStore.codigoLido))
                                    .then((_) {
                                  Alerts(
                                          context: context,
                                          message: "Código QR copiado",
                                          title: 'Sucesso!',
                                          type: AlertType.sucess)
                                      .dialog();
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    readQrStore.setCopyButtonColor(
                                        ProjectColors.lightblue);
                                  });
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
                              color: readQrStore.internetButtonColor,
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
                        onTap: readQrStore.codigoLido != 'Leia um código...'
                            ? () async {
                                readQrStore.setInternetButtonColor(
                                    ProjectColors.darkblue);
                                bool launch = await ProjectFunctions(context)
                                    .abrirUrl(readQrStore.codigoLido);
                                if (!launch) {
                                  Alerts(
                                          context: context,
                                          message:
                                              "Não foi possível acessar o site",
                                          title: 'ERRO!',
                                          type: AlertType.error)
                                      .dialog();
                                }
                                Future.delayed(const Duration(seconds: 2), () {
                                  readQrStore.setInternetButtonColor(
                                      ProjectColors.lightblue);
                                });
                              }
                            : null,
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
                                readQrStore.codigoLido,
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
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                          actionFunction: (() async =>
                              await readQrStore.readQrCodeFunction(context)),
                          buttonText: 'LER QR CODE',
                          iconbutton: FontAwesomeIcons.plusCircle,
                          buttonColor: readQrStore.actionButtonColor),
                      const SizedBox(width: 20),
                      SharedQrCodeButton(
                          validation:
                              (readQrStore.codigoLido != 'Leia um código...'),
                          qrCodeData: readQrStore.codigoLido,
                          sharedButtonColor: readQrStore.sharedButtonColor,
                          changeSharedButtonColor:
                              readQrStore.setSharedButtonColor)
                    ],
                  );
                }),
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
                  return readQrStore.listviewHeight != 0.0
                      ? LinksListview(
                          currentList: readQrStore.readQrList,
                          listColor: ProjectColors.darkblue,
                          listHeight: readQrStore.listviewHeight,
                          listItemCount: readQrStore.readQrList.length,
                          selectedIndex: readQrStore.selectedIndex,
                          setCodigoLido: readQrStore.setCodigoLido,
                          setListaQr: readQrStore.insertQrCodeReadQrList,
                          setselectedIndex: readQrStore.setSelectedIndex,
                          startLoading: readQrStore.startLoading,
                          stopLoading: readQrStore.stopLoading)
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
