import 'package:mobx/mobx.dart';
part "qr_code_store.g.dart";

class QrCodeStore = _QrCodeBaseStore with _$QrCodeStore;

abstract class _QrCodeBaseStore with Store {
  @observable
  String teste = "";
}
