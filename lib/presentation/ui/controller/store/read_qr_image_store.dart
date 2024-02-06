import 'package:mobx/mobx.dart';

part 'read_qr_image_store.g.dart';

class ReadQrImageStore = _ReadQrImageStoreBase with _$ReadQrImageStore;

abstract class _ReadQrImageStoreBase with Store {
  ObservableList capturedQrList = ObservableList();
  @observable
  double listViewSize = 0;

  @observable
  String codigoCapturado = "Código capturado...";

  @action
  setListaQr() {
    if (codigoCapturado != "Código capturado..." && codigoCapturado != "") {
      capturedQrList.insert(0, codigoCapturado);
    }
  }

  @action
  setlistViewSize() {
    listViewSize = capturedQrList.length * 50;
    listViewSize > 200 ? listViewSize = 200 : null;
  }
}
