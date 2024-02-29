// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_qr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReadQrStore on _ReadQrStoreBase, Store {
  late final _$codigoLidoAtom =
      Atom(name: '_ReadQrStoreBase.codigoLido', context: context);

  @override
  String get codigoLido {
    _$codigoLidoAtom.reportRead();
    return super.codigoLido;
  }

  @override
  set codigoLido(String value) {
    _$codigoLidoAtom.reportWrite(value, super.codigoLido, () {
      super.codigoLido = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_ReadQrStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$loadAtom = Atom(name: '_ReadQrStoreBase.load', context: context);

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  late final _$listviewHeightAtom =
      Atom(name: '_ReadQrStoreBase.listviewHeight', context: context);

  @override
  double get listviewHeight {
    _$listviewHeightAtom.reportRead();
    return super.listviewHeight;
  }

  @override
  set listviewHeight(double value) {
    _$listviewHeightAtom.reportWrite(value, super.listviewHeight, () {
      super.listviewHeight = value;
    });
  }

  late final _$setListaQrAsyncAction =
      AsyncAction('_ReadQrStoreBase.setListaQr', context: context);

  @override
  Future<void> InsertQrCodeReadQrList() {
    return _$setListaQrAsyncAction.run(() => super.InsertQrCodeReadQrList());
  }

  late final _$readQrCodeFunctionAsyncAction =
      AsyncAction('_ReadQrStoreBase.readQrCodeFunction', context: context);

  @override
  Future<dynamic> readQrCodeFunction(BuildContext context) {
    return _$readQrCodeFunctionAsyncAction
        .run(() => super.readQrCodeFunction(context));
  }

  late final _$fetchListAsyncAction =
      AsyncAction('_ReadQrStoreBase.fetchList', context: context);

  @override
  Future<void> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  late final _$_ReadQrStoreBaseActionController =
      ActionController(name: '_ReadQrStoreBase', context: context);

  @override
  dynamic setListviewHeight() {
    final _$actionInfo = _$_ReadQrStoreBaseActionController.startAction(
        name: '_ReadQrStoreBase.setListviewHeight');
    try {
      return super.setListviewHeight();
    } finally {
      _$_ReadQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setCodigoLido(String value) {
    final _$actionInfo = _$_ReadQrStoreBaseActionController.startAction(
        name: '_ReadQrStoreBase.setCodigoLido');
    try {
      return super.setCodigoLido(value);
    } finally {
      _$_ReadQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int newIndex) {
    final _$actionInfo = _$_ReadQrStoreBaseActionController.startAction(
        name: '_ReadQrStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(newIndex);
    } finally {
      _$_ReadQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startLoading() {
    final _$actionInfo = _$_ReadQrStoreBaseActionController.startAction(
        name: '_ReadQrStoreBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_ReadQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_ReadQrStoreBaseActionController.startAction(
        name: '_ReadQrStoreBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_ReadQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
codigoLido: ${codigoLido},
selectedIndex: ${selectedIndex},
load: ${load},
listviewHeight: ${listviewHeight}
    ''';
  }
}
