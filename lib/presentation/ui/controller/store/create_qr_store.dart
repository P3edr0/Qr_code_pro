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
  TextEditingController createdCode =
      TextEditingController(text: 'Inserir texto...');
  @observable
  String createdCodeMirror = 'Inserir texto...';

  @action
  Future<void> setListaQr() async {
    if (createdCode.text != '' && createdCode.text != 'Inserir texto...') {
      createdCodeMirror = createdCode.text;
      QrCodeEntity qrCodeEntity = QrCodeEntity(
          createdCodeMirror, QrCodeTypes.createCode, DateTime.now().toString());
      var result = await _insertCreateQrCodeUsecase.call(
          _insertCreateQrCodeSqlite, qrCodeEntity);
      result.fold((l) => log(l.toString()), (r) => log(r.toString()));
      createdQrList.insert(0, qrCodeEntity);
      listViewSize = createdQrList.length * 50;
      listViewSize > 200 ? listViewSize = 200 : null;
    }
  }

  @action
  setCreatedCode(String newCode) {
    if (newCode == '-1') {
      newCode = 'Inserir texto...';
    }

    createdCode.text = newCode;
    createdCodeMirror = newCode;
  }

  @action
  setCreatedCodeMirror(String value) {
    createdCodeMirror = value;
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
    if (createdCode.text != "Inserir texto..." && createdCode.text != "") {
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
