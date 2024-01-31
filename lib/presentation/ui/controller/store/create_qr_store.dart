import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'create_qr_store.g.dart';

class CreateQrStore = _CreateQrStoreBase with _$CreateQrStore;

abstract class _CreateQrStoreBase with Store {
  ObservableList listadelete = ObservableList();
  @observable
  TextEditingController codigoCriado =
      TextEditingController(text: "Crie um Qr Code...");
}
