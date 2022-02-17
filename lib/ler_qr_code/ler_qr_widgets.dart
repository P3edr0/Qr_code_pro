import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_pro/ler_qr_code/store/ler_qr_store.dart';
import 'package:qr_code_pro/qr_code_functions.dart';
//import 'package:mobx/mobx.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';

class LerQrWidgets {
  BuildContext context;
  LerQrWidgets(this.context);

  Widget widgetsPrincipal() {
    return Column(children: [
      _appBar(),
      _body(),
    ]);
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 20),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: const Text(
        "Qr Code Pro | Ler Qr Code",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      color: Colors.blue.shade700,
    );
  }

  Widget _body() {
    final qrCodeFunctions =
        Provider.of<QrCodeFunctions>(context, listen: false);
    final lerQrStore = Provider.of<LerQrStore>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            'Qr Code Lido',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Observer(builder: (_) {
            return lerQrStore.codigoLido != ""
                ? GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          border: Border.all(width: 4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          )),
                      padding: const EdgeInsets.only(left: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.qrcode,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 30),
                          Flexible(
                            child: Text(
                              lerQrStore.codigoLido,
                              style: const TextStyle(
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      await QrCodeFunctions(context)
                          .abrirUrl(lerQrStore.codigoLido);
                    },
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        border: Border.all(width: 4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    padding: const EdgeInsets.only(left: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          FontAwesomeIcons.qrcode,
                          color: Colors.white,
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Vazio",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
          }),
          const SizedBox(height: 72),
          ElevatedButton(
              onPressed: () async {
                //   print("Codigo Lido >>>> ${lerQrStore.codigoLido}");
                lerQrStore
                    .setCodigoLido(await QrCodeFunctions(context).scanQRCode());
                lerQrStore.setListaQr();
                print("Lista >>>> ${lerQrStore.listaQr}");
                // print("Codigo Lido 2222 >>>> ${lerQrStore.codigoLido}");
              },
              child: const Text("ler Qr Code"))
        ],
      ),
    );
  }
}
