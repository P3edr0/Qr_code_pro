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

  late final _$codigoCriadoAtom =
      Atom(name: '_LerQrStoreBase.codigoCriado', context: context);

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
