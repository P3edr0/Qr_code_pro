import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'create_qr_store.g.dart';

class CreateQrStore = _CreateQrStoreBase with _$CreateQrStore;

abstract class _CreateQrStoreBase with Store {
  ObservableList createdQrList = ObservableList();
  @observable
  double listViewSize = 0;

  @observable
  TextEditingController codigoCriado =
      TextEditingController(text: "Inserir texto...");

  @action
  setListaQr() {
    if (codigoCriado.text != "Inserir texto..." && codigoCriado.text != "") {
      createdQrList.insert(0, codigoCriado.text);
    }
  }

  @action
  setlistViewSize() {
    listViewSize = createdQrList.length * 50;
    listViewSize > 200 ? listViewSize = 200 : null;
  }
}
