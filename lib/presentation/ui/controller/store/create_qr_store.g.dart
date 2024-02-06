// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_qr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateQrStore on _CreateQrStoreBase, Store {
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
  String toString() {
    return '''
listViewSize: ${listViewSize},
codigoCriado: ${codigoCriado}
    ''';
  }
}
