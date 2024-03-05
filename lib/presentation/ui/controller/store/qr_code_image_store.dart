import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_pro/data/datasources/qrcode_image_datasource.dart';
import 'package:qr_code_pro/data/datasources/sqlite/insert_image_sqlite_datasources/insert_qr_code_image_sqlite.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/usecases/qr_code_image_usecases/fetch_qr_code_image_usecase.dart';
import 'package:qr_code_pro/domain/usecases/qr_code_image_usecases/insert_qr_code_image_usecase.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/alerts.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';
import 'package:scan/scan.dart';

part 'qr_code_image_store.g.dart';

class QrCodeImageStore = _QrCodeImageStoreBase with _$QrCodeImageStore;

abstract class _QrCodeImageStoreBase with Store {
  ObservableList<QrCodeEntity> capturedQrList = ObservableList();
  final _insertQrCodeImageUsecase = GetIt.instance<InsertQrCodeImageUsecase>();
  final _fetchQrCodeImageSqlite =
      GetIt.instance<IFetchAllQrCodeImageDatasource>();
  final _fetchQrImageCodeUsecase = GetIt.instance<FetchQrImageCodeUsecase>();
  final _insertQrCodeImageSqlite = GetIt.instance<InsertQrCodeImageSqlite>();

  Exception? currentFetchException;

  Exception? currentInsertException;

  @observable
  double listViewSize = 0;

  @observable
  String capturedCodeMirror = "Código capturado...";

  @observable
  String capturedCode = "Código capturado...";

  @observable
  int selectedIndex = -1;

  @observable
  bool load = false;

  @observable
  Color actionButtonColor = ProjectColors.lightGreen;

  @observable
  Color sharedButtonColor = ProjectColors.lightGreen;

  @observable
  Color copyButtonColor = ProjectColors.lightGreen;
  @observable
  Color internetButtonColor = ProjectColors.lightGreen;
  @action
  void setActionButtonColor(Color newColor) => actionButtonColor = newColor;
  @action
  void setCopyButtonColor(Color newColor) => copyButtonColor = newColor;
  @action
  void setInternetButtonColor(Color newColor) => internetButtonColor = newColor;

  @action
  Future<void> insertQrCodeImage(BuildContext? context) async {
    if (capturedCode == '-1') {
      capturedCode = "Código capturado...";
      capturedCodeMirror = "Código capturado...";
    } else if (capturedCode != "Código capturado..." && capturedCode != "") {
      QrCodeEntity qrCodeEntity = QrCodeEntity(
          capturedCode, QrCodeTypes.imageCode, DateTime.now().toString());
      var result = await _insertQrCodeImageUsecase.call(
          _insertQrCodeImageSqlite, qrCodeEntity);
      result.fold((l) async {
        if (context != null) {
          await Alerts(
            context: context,
            message: l.message,
            title: 'ERRO!',
            type: AlertType.error,
          ).dialog();
        } else {
          currentInsertException = l;
        }
      }, (r) {
        currentInsertException = null;
        capturedQrList.insert(0, qrCodeEntity);
        listViewSize = capturedQrList.length * 50;
        listViewSize > 200 ? listViewSize = 200 : null;
      });
    }
  }

  @action
  void setSharedButtonColor() {
    if (sharedButtonColor == ProjectColors.lightGreen) {
      sharedButtonColor = ProjectColors.darkGreen;
    } else {
      sharedButtonColor = ProjectColors.lightGreen;
    }
  }

  @action
  Future readImage(BuildContext? context) async {
    startLoading();
    setActionButtonColor(ProjectColors.darkGreen);

    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      String? result = await Scan.parse(pickedFile.path);

      if (result == null) {
        setCapturedCode('Código não lido');
        setcapturedCodeMirror('Código não lido');
      } else {
        setcapturedCodeMirror(result);
        Future.delayed(const Duration(seconds: 2), () {
          stopLoading();
          setCapturedCode(result);

          insertQrCodeImage(context);
        });
      }
      setActionButtonColor(ProjectColors.lightGreen);
    } else {
      stopLoading();
      setActionButtonColor(ProjectColors.lightGreen);
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
  void setCapturedCode(String newCode) {
    capturedCode = newCode;
    capturedCodeMirror = newCode;
  }

  @action
  void setcapturedCodeMirror(String newCode) => capturedCodeMirror = newCode;

  @action
  void startLoading() {
    load = true;
  }

  @action
  void stopLoading() {
    load = false;
  }

  @action
  Future<void> fetchList(BuildContext? context) async {
    var response = await _fetchQrImageCodeUsecase(_fetchQrCodeImageSqlite);

    response.fold((l) async {
      if (context != null) {
        await Alerts(
          context: context,
          message: l.message,
          title: 'ERRO!',
          type: AlertType.error,
        ).dialog();
      } else {
        currentFetchException = l;
      }
    }, (r) {
      currentFetchException = null;
      capturedQrList.clear();
      for (var element in r) {
        capturedQrList.insert(0, element);
      }
      setlistViewSize();
      log(capturedQrList.toString(), name: 'finalList');
    });
  }
}
