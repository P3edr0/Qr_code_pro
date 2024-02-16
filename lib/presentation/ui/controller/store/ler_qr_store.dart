import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/data/datasources/sqlite/read_qr_code_sqlite_datasources/fetch_read_qr_code_sqlite.dart';
import 'package:qr_code_pro/data/datasources/sqlite/read_qr_code_sqlite_datasources/insert_read_qr_code_sqlite.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/fetch_read_qrcode_usecase.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/insert_read_qrcode_usecase.dart';
import 'package:qr_code_pro/presentation/utils/qr_code_functions.dart';

part "ler_qr_store.g.dart";

class LerQrStore = _LerQrStoreBase with _$LerQrStore;

abstract class _LerQrStoreBase with Store {
  final InsertQrCodeUsecase _insertQrCodeUsecase = InsertQrCodeUsecase();
  final InsertReadQrCodeSqlite _insertReadQrCodeSqlite =
      InsertReadQrCodeSqlite();
  final FetcReadQrCodeSqlite _fetcReadQrCodeSqlite = FetcReadQrCodeSqlite();

  ObservableList<String> listaQr = ObservableList();
  @observable
  String codigoLido = 'Leia um código...';

  @observable
  int selectedIndex = -1;

  @observable
  bool load = false;

  @observable
  double tamanho = 0;

  @action
  setTamanho() {
    tamanho = listaQr.length * 50;
    tamanho > 200 ? tamanho = 200 : null;
  }

  @action
  String setCodigoLido(String value) => codigoLido = value;

  @action
  Future setListaQr() async {
    if (codigoLido == '-1') {
      codigoLido = 'Leia um código...';
    } else if (codigoLido != "" && codigoLido != "-1") {
      QrCodeEntity qrCodeEntity = QrCodeEntity(
          codigoLido, QrCodeTypes.readCode, DateTime.now().toString());
      var result = await _insertQrCodeUsecase.call(
          _insertReadQrCodeSqlite, qrCodeEntity);
      result.fold((l) => log(l.toString()), (r) => log(r.toString()));
      listaQr.insert(0, codigoLido);
    }
  }

  @action
  Future readQrCodeFunction(
    BuildContext context,
  ) async {
    setCodigoLido(await QrCodeFunctions(context).scanQRCode());
    startLoading();

    setTamanho();
    setSelectedIndex(-1);
    Future.delayed(const Duration(seconds: 2), () {
      setListaQr().then((value) => stopLoading());
    });
  }

  @action
  void setSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  @action
  Future<void> fetchList() async {
    var response = await FetchQrCodeUsecase().call(_fetcReadQrCodeSqlite);

    response.fold((l) => log(l.toString()), (r) {
      listaQr.clear();
      for (var element in r) {
        listaQr.insert(0, element.code!);
      }
      setTamanho();
      log(listaQr.toString(), name: 'finalList');
    });
  }

  @action
  void startLoading() {
    load = true;
  }

  @action
  void stopLoading() {
    load = false;
  }
}
