import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/data/datasources/sqlite/insert_image_sqlite_datasources/fetch_qr_code_image_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/insert_image_sqlite_datasources/insert_qr_code_image_sqlite.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/qr_code_image_usecases/fetch_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/qr_code_image_usecases/insert_qr_code_image_usecase.dart';
import 'package:scan/scan.dart';

part 'qr_code_image_store.g.dart';

class QrCodeImageStore = _QrCodeImageStoreBase with _$QrCodeImageStore;

abstract class _QrCodeImageStoreBase with Store {
  ObservableList<QrCodeEntity> capturedQrList = ObservableList();
  final InsertQrCodeImageUsecase _insertQrCodeImageUsecase =
      InsertQrCodeImageUsecase();
  final InsertQrCodeImageSqlite _insertQrCodeImageSqlite =
      InsertQrCodeImageSqlite();

  final FetcQrCodeImageSqlite _fetchQrCodeImageSqlite = FetcQrCodeImageSqlite();
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
  Future<void> setListaQr() async {
    if (codigoCapturado == '-1') {
      codigoCapturado = "Código capturado...";
      capturedCodeMirror = "Código capturado...";
    } else if (codigoCapturado != "Código capturado..." &&
        codigoCapturado != "") {
      QrCodeEntity qrCodeEntity = QrCodeEntity(
          codigoCapturado, QrCodeTypes.imageCode, DateTime.now().toString());
      var result = await _insertQrCodeImageUsecase.call(
          _insertQrCodeImageSqlite, qrCodeEntity);
      result.fold((l) => log(l.toString()), (r) => log(r.toString()));
      capturedQrList.insert(0, qrCodeEntity);
      listViewSize = capturedQrList.length * 50;
      listViewSize > 200 ? listViewSize = 200 : null;
    }
  }

  @action
  Future readImage() async {
    startLoading();
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

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
        });
        // .then((value) => setlistViewSize());
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

  @action
  Future<void> fetchList() async {
    var response =
        await FetchReadQrImageCodeUsecase().call(_fetchQrCodeImageSqlite);

    response.fold((l) => log(l.toString()), (r) {
      capturedQrList.clear();
      for (var element in r) {
        capturedQrList.insert(0, element);
      }
      setlistViewSize();
      log(capturedQrList.toString(), name: 'finalList');
    });
  }
}
