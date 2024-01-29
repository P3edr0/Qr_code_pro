import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'ler_qr_store.g.dart';

class LerQrStore = _LerQrStoreBase with _$LerQrStore;

abstract class _LerQrStoreBase with Store {
  ObservableList listaQr = ObservableList();
  @observable
  String codigoLido = "";

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
  String setCodigoLido(value) => codigoLido = value;

  @action
  setListaQr() {
    if (codigoLido == '-1') {
      codigoLido = 'Leia um código';
    } else if (codigoLido != "" && codigoLido != "-1") {
      listaQr.insert(0, codigoLido);
    }
  }
}
