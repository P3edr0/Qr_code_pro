import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/data/datasources/read_qr_code_datasource.dart';
import 'package:qr_code_pro/data/datasources/sqlite/read_qr_code_sqlite_datasources/fetch_read_qr_code_sqlite.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/fetch_read_qr_code_usecase.dart';
import 'package:qr_code_pro/domain/usecases/read_qr_code_usecases/insert_read_qr_code_usecase.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';
import 'package:qr_code_pro/presentation/utils/qr_code_functions.dart';

part "read_qr_store.g.dart";

class ReadQrStore = _ReadQrStoreBase with _$ReadQrStore;

abstract class _ReadQrStoreBase with Store {
  final _insertQrCodeUsecase = GetIt.instance<InsertReadQrCodeUsecase>();
  final _fetchReadQrCodeUsecase = GetIt.instance<FetchReadQrCodeUsecase>();
  final _insertReadQrCodeSqlite = GetIt.instance<IInsertReadQrCodeDatasource>();
  final _fetcReadQrCodeSqlite = GetIt.instance<FetcReadQrCodeSqlite>();
  ObservableList<QrCodeEntity> readQrList = ObservableList();
  @observable
  String codigoLido = 'Leia um código...';

  @observable
  int selectedIndex = -1;

  @observable
  bool load = false;

  @observable
  double listviewHeight = 0;
  @observable
  Color copyButtonColor = ProjectColors.lightblue;

  @observable
  Color internetButtonColor = ProjectColors.lightblue;

  @observable
  Color actionButtonColor = ProjectColors.lightblue;

  @observable
  Color sharedButtonColor = ProjectColors.lightblue;

  @action
  setListviewHeight() {
    listviewHeight = readQrList.length * 50;
    listviewHeight > 200 ? listviewHeight = 200 : null;
  }

  @action
  String setCodigoLido(String value) => codigoLido = value;

  @action
  void setCopyButtonColor(Color newColor) => copyButtonColor = newColor;
  @action
  void setInternetButtonColor(Color newColor) => internetButtonColor = newColor;

  @action
  void setActionButtonColor(Color newColor) => actionButtonColor = newColor;

  @action
  void setSharedButtonColor() {
    if (sharedButtonColor == ProjectColors.lightblue) {
      sharedButtonColor = ProjectColors.darkblue;
    } else {
      sharedButtonColor = ProjectColors.lightblue;
    }
  }

  @action
  Future<void> insertQrCodeReadQrList() async {
    if (codigoLido == '-1' || codigoLido == "") {
      codigoLido = 'Leia um código...';
    } else if (codigoLido != "") {
      QrCodeEntity qrCodeEntity = QrCodeEntity(
          codigoLido, QrCodeTypes.readCode, DateTime.now().toString());
      var result =
          await _insertQrCodeUsecase(_insertReadQrCodeSqlite, qrCodeEntity);
      result.fold((l) => log(l.toString()), (r) {
        readQrList.insert(0, qrCodeEntity);
        listviewHeight = readQrList.length * 50;
        listviewHeight > 200 ? listviewHeight = 200 : null;
      });
    }
  }

  @action
  Future readQrCodeFunction(
    BuildContext context,
  ) async {
    setActionButtonColor(ProjectColors.darkblue);
    setCodigoLido(await QrCodeFunctions(context).scanQRCode());
    startLoading();

    setListviewHeight();
    setSelectedIndex(-1);
    Future.delayed(const Duration(seconds: 2), () {
      insertQrCodeReadQrList().then((value) => stopLoading());
      setActionButtonColor(ProjectColors.lightblue);
    });
  }

  @action
  void setSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
  }

  @action
  Future<void> fetchList() async {
    var response = await _fetchReadQrCodeUsecase(_fetcReadQrCodeSqlite);

    response.fold((l) => log(l.toString()), (r) {
      readQrList.clear();
      for (var element in r) {
        readQrList.insert(0, element);
      }
      setListviewHeight();
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
