// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ler_qr_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LerQrStore on _LerQrStoreBase, Store {
  final _$codigoLidoAtom = Atom(name: '_LerQrStoreBase.codigoLido');

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

  final _$codigoCriadoAtom = Atom(name: '_LerQrStoreBase.codigoCriado');

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

  final _$tamanhoAtom = Atom(name: '_LerQrStoreBase.tamanho');

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

  final _$_LerQrStoreBaseActionController =
      ActionController(name: '_LerQrStoreBase');

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
  String setCodigoLido(dynamic value) {
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
  String toString() {
    return '''
codigoLido: ${codigoLido},
codigoCriado: ${codigoCriado},
tamanho: ${tamanho}
    ''';
  }
}
