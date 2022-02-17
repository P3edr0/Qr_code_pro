// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QrCodeStore on _QrCodeBaseStore, Store {
  final _$testeAtom = Atom(name: '_QrCodeBaseStore.teste');

  @override
  String get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(String value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  @override
  String toString() {
    return '''
teste: ${teste}
    ''';
  }
}
