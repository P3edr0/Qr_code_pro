import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'create_qr_store.g.dart';

class CreateQrStore = _CreateQrStoreBase with _$CreateQrStore;

abstract class _CreateQrStoreBase with Store {
  ObservableList createdQrList = ObservableList();

  @observable
  bool load = false;

  @observable
  double listViewSize = 0;

  @observable
  int selectedIndex = -1;

  @observable
  TextEditingController codigoCriado =
      TextEditingController(text: 'Inserir texto...');
  @observable
  String codigoCriadoMirror = 'Inserir texto...';

  @action
  setListaQr() {
    if (codigoCriado.text != '' && codigoCriado.text != 'Inserir texto...') {
      codigoCriadoMirror = codigoCriado.text;
      createdQrList.insert(0, codigoCriadoMirror);
    }
  }

  @action
  setCodigoCriado(String newCodigo) {
    if (newCodigo == '-1') {
      newCodigo = 'Inserir texto...';
    }
    log(newCodigo);

    codigoCriado.text = newCodigo;
    codigoCriadoMirror = newCodigo;
  }

  @action
  setCodigoMirrorCriado(String value) {
    codigoCriadoMirror = value;
  }

  @action
  setlistViewSize() {
    listViewSize = createdQrList.length * 50;
    listViewSize > 200 ? listViewSize = 200 : null;
  }

  @action
  setSelectedIndex(int newIndex) => selectedIndex = newIndex;

  @action
  void startLoading() => load = true;

  @action
  void stopLoading() => load = false;

  @action
  Future createQrButton() async {
    if (codigoCriado.text != "Inserir texto..." && codigoCriado.text != "") {
      startLoading();
      Future.delayed(const Duration(seconds: 2), () {
        setListaQr();
        setlistViewSize();
        stopLoading();
      });
    }
  }
}
