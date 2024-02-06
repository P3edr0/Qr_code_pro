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
  String toString() {
    return '''
listViewSize: ${listViewSize},
codigoCapturado: ${codigoCapturado}
    ''';
  }
}
