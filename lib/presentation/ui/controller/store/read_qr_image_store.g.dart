// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_qr_image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReadQrImageStore on _ReadQrImageStoreBase, Store {
  late final _$listViewSizeAtom =
      Atom(name: '_ReadQrImageStoreBase.listViewSize', context: context);

  @override
  double get listViewSize {
    _$listViewSizeAtom.reportRead();
    return super.listViewSize;
  }

  @override
  set listViewSize(double value) {
    _$listViewSizeAtom.reportWrite(value, super.listViewSize, () {
      super.listViewSize = value;
    });
  }

  late final _$capturedCodeMirrorAtom =
      Atom(name: '_ReadQrImageStoreBase.capturedCodeMirror', context: context);

  @override
  String get capturedCodeMirror {
    _$capturedCodeMirrorAtom.reportRead();
    return super.capturedCodeMirror;
  }

  @override
  set capturedCodeMirror(String value) {
    _$capturedCodeMirrorAtom.reportWrite(value, super.capturedCodeMirror, () {
      super.capturedCodeMirror = value;
    });
  }

  late final _$codigoCapturadoAtom =
      Atom(name: '_ReadQrImageStoreBase.codigoCapturado', context: context);

  @override
  String get codigoCapturado {
    _$codigoCapturadoAtom.reportRead();
    return super.codigoCapturado;
  }

  @override
  set codigoCapturado(String value) {
    _$codigoCapturadoAtom.reportWrite(value, super.codigoCapturado, () {
      super.codigoCapturado = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_ReadQrImageStoreBase.selectedIndex', context: context);

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

  late final _$loadAtom =
      Atom(name: '_ReadQrImageStoreBase.load', context: context);

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

  late final _$readImageAsyncAction =
      AsyncAction('_ReadQrImageStoreBase.readImage', context: context);

  @override
  Future<dynamic> readImage() {
    return _$readImageAsyncAction.run(() => super.readImage());
  }

  late final _$_ReadQrImageStoreBaseActionController =
      ActionController(name: '_ReadQrImageStoreBase', context: context);

  @override
  dynamic setListaQr() {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.setListaQr');
    try {
      return super.setListaQr();
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setlistViewSize() {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.setlistViewSize');
    try {
      return super.setlistViewSize();
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int newIndex) {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(newIndex);
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCodigoCapturado(String newCodigo) {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.setCodigoCapturado');
    try {
      return super.setCodigoCapturado(newCodigo);
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setcapturedCodeMirror(String newCodigo) {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.setcapturedCodeMirror');
    try {
      return super.setcapturedCodeMirror(newCodigo);
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startLoading() {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_ReadQrImageStoreBaseActionController.startAction(
        name: '_ReadQrImageStoreBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_ReadQrImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listViewSize: ${listViewSize},
capturedCodeMirror: ${capturedCodeMirror},
codigoCapturado: ${codigoCapturado},
selectedIndex: ${selectedIndex},
load: ${load}
    ''';
  }
}
