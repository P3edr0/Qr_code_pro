import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        "Qr Code Pro | Ler Imagem",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      color: Colors.green.shade800,
    );
  }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height - 139,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'Ler Imagem',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
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
