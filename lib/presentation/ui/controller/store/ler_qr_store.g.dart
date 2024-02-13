// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ler_qr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LerQrStore on _LerQrStoreBase, Store {
  late final _$codigoLidoAtom =
      Atom(name: '_LerQrStoreBase.codigoLido', context: context);

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
      Atom(name: '_LerQrStoreBase.selectedIndex', context: context);

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

  late final _$loadAtom = Atom(name: '_LerQrStoreBase.load', context: context);

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

  late final _$tamanhoAtom =
      Atom(name: '_LerQrStoreBase.tamanho', context: context);

  @override
  double get tamanho {
    _$tamanhoAtom.reportRead();
    return super.tamanho;
  }

  @override
  set tamanho(double value) {
    _$tamanhoAtom.reportWrite(value, super.tamanho, () {
      super.tamanho = value;
    });
  }

  late final _$readQrCodeFunctionAsyncAction =
      AsyncAction('_LerQrStoreBase.readQrCodeFunction', context: context);

  @override
  Future<dynamic> readQrCodeFunction(BuildContext context) {
    return _$readQrCodeFunctionAsyncAction
        .run(() => super.readQrCodeFunction(context));
  }

  late final _$_LerQrStoreBaseActionController =
      ActionController(name: '_LerQrStoreBase', context: context);

  @override
  dynamic setTamanho() {
    final _$actionInfo = _$_LerQrStoreBaseActionController.startAction(
        name: '_LerQrStoreBase.setTamanho');
    try {
      return super.setTamanho();
    } finally {
      _$_LerQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setCodigoLido(String value) {
    final _$actionInfo = _$_LerQrStoreBaseActionController.startAction(
        name: '_LerQrStoreBase.setCodigoLido');
    try {
      return super.setCodigoLido(value);
    } finally {
      _$_LerQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListaQr() {
    final _$actionInfo = _$_LerQrStoreBaseActionController.startAction(
        name: '_LerQrStoreBase.setListaQr');
    try {
      return super.setListaQr();
    } finally {
      _$_LerQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int newIndex) {
    final _$actionInfo = _$_LerQrStoreBaseActionController.startAction(
        name: '_LerQrStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(newIndex);
    } finally {
      _$_LerQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startLoading() {
    final _$actionInfo = _$_LerQrStoreBaseActionController.startAction(
        name: '_LerQrStoreBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_LerQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_LerQrStoreBaseActionController.startAction(
        name: '_LerQrStoreBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_LerQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
codigoLido: ${codigoLido},
selectedIndex: ${selectedIndex},
load: ${load},
tamanho: ${tamanho}
    ''';
  }
}
