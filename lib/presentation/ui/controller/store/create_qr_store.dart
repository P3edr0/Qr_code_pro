import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/data/datasources/sqlite/create_qr_code_sqlite_datasources/fetch_create_qr_code_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/create_qr_code_sqlite_datasources/insert_create_qr_code_sqlite.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/create_qr_code_image_usecases/fetch_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/create_qr_code_image_usecases/insert_qr_code_image_usecase.dart';

part 'create_qr_store.g.dart';

class CreateQrStore = _CreateQrStoreBase with _$CreateQrStore;

abstract class _CreateQrStoreBase with Store {
  ObservableList<QrCodeEntity> createdQrList = ObservableList();
  final FetchCreateQrCodeUsecase _fetchCreateQrCodeUsecase =
      FetchCreateQrCodeUsecase();
  final InsertCreateQrCodeUsecase _insertCreateQrCodeUsecase =
      InsertCreateQrCodeUsecase();
  final InsertCreateQrCodeSqlite _insertCreateQrCodeSqlite =
      InsertCreateQrCodeSqlite();
  final FetchCreateQrCodeSqlite _fetchCreateQrCodeSqlite =
      FetchCreateQrCodeSqlite();

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
  Future<void> setListaQr() async {
    if (codigoCriado.text != '' && codigoCriado.text != 'Inserir texto...') {
      codigoCriadoMirror = codigoCriado.text;
      QrCodeEntity qrCodeEntity = QrCodeEntity(codigoCriadoMirror,
          QrCodeTypes.createCode, DateTime.now().toString());
      var result = await _insertCreateQrCodeUsecase.call(
          _insertCreateQrCodeSqlite, qrCodeEntity);
      result.fold((l) => log(l.toString()), (r) => log(r.toString()));
      createdQrList.insert(0, qrCodeEntity);
      listViewSize = createdQrList.length * 50;
      listViewSize > 200 ? listViewSize = 200 : null;
    }
  }

  @action
  setCodigoCriado(String newCodigo) {
    if (newCodigo == '-1') {
      newCodigo = 'Inserir texto...';
    }

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
        // setlistViewSize();
        stopLoading();
      });
    }
  }

  @action
  Future<void> fetchList() async {
    var response =
        await _fetchCreateQrCodeUsecase.call(_fetchCreateQrCodeSqlite);

    response.fold((l) => log(l.toString()), (r) {
      createdQrList.clear();
      for (var element in r) {
        createdQrList.insert(0, element);
      }
      setlistViewSize();
      // log(readQrList.toString(), name: 'finalList');
    });
  }
}
