// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_qr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateQrStore on _CreateQrStoreBase, Store {
  late final _$loadAtom =
      Atom(name: '_CreateQrStoreBase.load', context: context);

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

  late final _$listViewSizeAtom =
      Atom(name: '_CreateQrStoreBase.listViewSize', context: context);

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

  late final _$selectedIndexAtom =
      Atom(name: '_CreateQrStoreBase.selectedIndex', context: context);

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

  late final _$codigoCriadoAtom =
      Atom(name: '_CreateQrStoreBase.codigoCriado', context: context);

  @override
  TextEditingController get codigoCriado {
    _$codigoCriadoAtom.reportRead();
    return super.codigoCriado;
  }

  @override
  set codigoCriado(TextEditingController value) {
    _$codigoCriadoAtom.reportWrite(value, super.codigoCriado, () {
      super.codigoCriado = value;
    });
  }

  late final _$codigoCriadoMirrorAtom =
      Atom(name: '_CreateQrStoreBase.codigoCriadoMirror', context: context);

  @override
  String get codigoCriadoMirror {
    _$codigoCriadoMirrorAtom.reportRead();
    return super.codigoCriadoMirror;
  }

  @override
  set codigoCriadoMirror(String value) {
    _$codigoCriadoMirrorAtom.reportWrite(value, super.codigoCriadoMirror, () {
      super.codigoCriadoMirror = value;
    });
  }

  late final _$createQrButtonAsyncAction =
      AsyncAction('_CreateQrStoreBase.createQrButton', context: context);

  @override
  Future<dynamic> createQrButton() {
    return _$createQrButtonAsyncAction.run(() => super.createQrButton());
  }

  late final _$_CreateQrStoreBaseActionController =
      ActionController(name: '_CreateQrStoreBase', context: context);

  @override
  dynamic setListaQr() {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setListaQr');
    try {
      return super.setListaQr();
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCodigoCriado(String newCodigo) {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setCodigoCriado');
    try {
      return super.setCodigoCriado(newCodigo);
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCodigoMirrorCriado(String value) {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setCodigoMirrorCriado');
    try {
      return super.setCodigoMirrorCriado(value);
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setlistViewSize() {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setlistViewSize');
    try {
      return super.setlistViewSize();
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedIndex(int newIndex) {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(newIndex);
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startLoading() {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
load: ${load},
listViewSize: ${listViewSize},
selectedIndex: ${selectedIndex},
codigoCriado: ${codigoCriado},
codigoCriadoMirror: ${codigoCriadoMirror}
    ''';
  }
}
