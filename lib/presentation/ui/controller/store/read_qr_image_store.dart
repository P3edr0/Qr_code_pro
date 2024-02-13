import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:scan/scan.dart';

part 'read_qr_image_store.g.dart';

class ReadQrImageStore = _ReadQrImageStoreBase with _$ReadQrImageStore;

abstract class _ReadQrImageStoreBase with Store {
  ObservableList capturedQrList = ObservableList();
  @observable
  double listViewSize = 0;

  @observable
  String capturedCodeMirror = "Código capturado...";
  @observable
  String codigoCapturado = "Código capturado...";

  @observable
  int selectedIndex = -1;

  @observable
  bool load = false;

  @action
  setListaQr() {
    if (codigoCapturado == '-1') {
      codigoCapturado = "Código capturado...";
      capturedCodeMirror = "Código capturado...";
    } else if (codigoCapturado != "Código capturado..." &&
        codigoCapturado != "") {
      capturedQrList.insert(0, codigoCapturado);
    }
  }

  @action
  Future readImage() async {
    startLoading();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String? result = await Scan.parse(pickedFile.path);

      if (result == null) {
        setCodigoCapturado('Código não lido');
        setcapturedCodeMirror('Código não lido');
      } else {
        setcapturedCodeMirror(result);
        Future.delayed(const Duration(seconds: 2), () {
          stopLoading();
          setCodigoCapturado(result);

          setListaQr();
          setlistViewSize();
        });
      }
    } else {
      stopLoading();
    }
  }

  @action
  setlistViewSize() {
    listViewSize = capturedQrList.length * 50;
    listViewSize > 200 ? listViewSize = 200 : null;
  }

  @action
  void setSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  @action
  void setCodigoCapturado(String newCodigo) {
    codigoCapturado = newCodigo;
    capturedCodeMirror = newCodigo;
  }

  @action
  void setcapturedCodeMirror(String newCodigo) =>
      capturedCodeMirror = newCodigo;

  @action
  void startLoading() {
    load = true;
  }

  @action
  void stopLoading() {
    load = false;
  }
}
