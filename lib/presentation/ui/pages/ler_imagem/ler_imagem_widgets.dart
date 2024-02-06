import 'package:flutter/material.dart';
import 'package:qr_code_pro/utils/constants.dart';

class LerImagemWidgets {
  BuildContext context;
  LerImagemWidgets(this.context);

  Widget widgetPrincipal() {
    return Column(children: <Widget>[
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
        "LER IMAGEM",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      color: ProjectColors.darkGreen,
    );
  }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height - 139,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'LER IMAGEM',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            "Qr code",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 72),
        ],
      ),
    );
  }
}
