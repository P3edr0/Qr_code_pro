import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/qr_code_functions.dart';

part "ler_qr_store.g.dart";

class LerQrStore = _LerQrStoreBase with _$LerQrStore;

abstract class _LerQrStoreBase with Store {
  ObservableList listaQr = ObservableList();
  @observable
  String codigoLido = 'Leia um código...';

  @observable
  int selectedIndex = -1;

  @observable
  bool load = false;

  @observable
  TextEditingController codigoCriado = TextEditingController();

  @observable
  double tamanho = 0;

  @action
  setTamanho() {
    tamanho = listaQr.length * 50;
    tamanho > 200 ? tamanho = 200 : null;
  }

  @action
  String setCodigoLido(String value) => codigoLido = value;

  @action
  setListaQr() {
    if (codigoLido == '-1') {
      codigoLido = 'Leia um código...';
    } else if (codigoLido != "" && codigoLido != "-1") {
      listaQr.insert(0, codigoLido);
    }
  }

  @action
  Future readQrCodeFunction(
    BuildContext context,
  ) async {
    setCodigoLido(await QrCodeFunctions(context).scanQRCode());
    startLoading();

    setListaQr();
    setTamanho();
    setSelectedIndex(-1);
    Future.delayed(const Duration(seconds: 2), () {
      stopLoading();
    });
  }

  @action
  void setSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  @action
  void startLoading() {
    load = true;
  }

  @action
  void stopLoading() {
    load = false;
  }
}
