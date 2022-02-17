import 'package:mobx/mobx.dart';
part 'ler_qr_store.g.dart';

class LerQrStore = _LerQrStoreBase with _$LerQrStore;

abstract class _LerQrStoreBase with Store {
  ObservableList listaQr = ObservableList();
  @observable
  String codigoLido = "";

  @action
  String setCodigoLido(value) => codigoLido = value;

  @action
  setListaQr() {
    if (codigoLido != "" && codigoLido != "-1") {
      listaQr.add(codigoLido);
    }
  }
}
