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

  late final _$actionButtonColorAtom =
      Atom(name: '_CreateQrStoreBase.actionButtonColor', context: context);

  @override
  Color get actionButtonColor {
    _$actionButtonColorAtom.reportRead();
    return super.actionButtonColor;
  }

  @override
  set actionButtonColor(Color value) {
    _$actionButtonColorAtom.reportWrite(value, super.actionButtonColor, () {
      super.actionButtonColor = value;
    });
  }

  late final _$sharedButtonColorAtom =
      Atom(name: '_CreateQrStoreBase.sharedButtonColor', context: context);

  @override
  Color get sharedButtonColor {
    _$sharedButtonColorAtom.reportRead();
    return super.sharedButtonColor;
  }

  @override
  set sharedButtonColor(Color value) {
    _$sharedButtonColorAtom.reportWrite(value, super.sharedButtonColor, () {
      super.sharedButtonColor = value;
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

  late final _$createdCodeAtom =
      Atom(name: '_CreateQrStoreBase.createdCode', context: context);

  @override
  TextEditingController get createdCode {
    _$createdCodeAtom.reportRead();
    return super.createdCode;
  }

  @override
  set createdCode(TextEditingController value) {
    _$createdCodeAtom.reportWrite(value, super.createdCode, () {
      super.createdCode = value;
    });
  }

  late final _$createdCodeMirrorAtom =
      Atom(name: '_CreateQrStoreBase.createdCodeMirror', context: context);

  @override
  String get createdCodeMirror {
    _$createdCodeMirrorAtom.reportRead();
    return super.createdCodeMirror;
  }

  @override
  set createdCodeMirror(String value) {
    _$createdCodeMirrorAtom.reportWrite(value, super.createdCodeMirror, () {
      super.createdCodeMirror = value;
    });
  }

  late final _$insertCreatedQrCodeAsyncAction =
      AsyncAction('_CreateQrStoreBase.insertCreatedQrCode', context: context);

  @override
  Future<void> insertCreatedQrCode() {
    return _$insertCreatedQrCodeAsyncAction
        .run(() => super.insertCreatedQrCode());
  }

  late final _$createQrButtonAsyncAction =
      AsyncAction('_CreateQrStoreBase.createQrButton', context: context);

  @override
  Future<dynamic> createQrButton() {
    return _$createQrButtonAsyncAction.run(() => super.createQrButton());
  }

  late final _$fetchListAsyncAction =
      AsyncAction('_CreateQrStoreBase.fetchList', context: context);

  @override
  Future<void> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  late final _$_CreateQrStoreBaseActionController =
      ActionController(name: '_CreateQrStoreBase', context: context);

  @override
  dynamic setActionButtonColor(Color newColor) {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setActionButtonColor');
    try {
      return super.setActionButtonColor(newColor);
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCreatedCode(String newCode) {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setCreatedCode');
    try {
      return super.setCreatedCode(newCode);
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCreatedCodeMirror(String value) {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setCreatedCodeMirror');
    try {
      return super.setCreatedCodeMirror(value);
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
  void setSharedButtonColor() {
    final _$actionInfo = _$_CreateQrStoreBaseActionController.startAction(
        name: '_CreateQrStoreBase.setSharedButtonColor');
    try {
      return super.setSharedButtonColor();
    } finally {
      _$_CreateQrStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
load: ${load},
actionButtonColor: ${actionButtonColor},
sharedButtonColor: ${sharedButtonColor},
listViewSize: ${listViewSize},
selectedIndex: ${selectedIndex},
createdCode: ${createdCode},
createdCodeMirror: ${createdCodeMirror}
    ''';
  }
}
