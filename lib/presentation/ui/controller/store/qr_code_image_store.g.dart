// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrCodeImageStore on _QrCodeImageStoreBase, Store {
  late final _$listViewSizeAtom =
      Atom(name: '_QrCodeImageStoreBase.listViewSize', context: context);

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
      Atom(name: '_QrCodeImageStoreBase.capturedCodeMirror', context: context);

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

  late final _$capturedCodeAtom =
      Atom(name: '_QrCodeImageStoreBase.capturedCode', context: context);

  @override
  String get capturedCode {
    _$capturedCodeAtom.reportRead();
    return super.capturedCode;
  }

  @override
  set capturedCode(String value) {
    _$capturedCodeAtom.reportWrite(value, super.capturedCode, () {
      super.capturedCode = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_QrCodeImageStoreBase.selectedIndex', context: context);

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
      Atom(name: '_QrCodeImageStoreBase.load', context: context);

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
      Atom(name: '_QrCodeImageStoreBase.actionButtonColor', context: context);

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
      Atom(name: '_QrCodeImageStoreBase.sharedButtonColor', context: context);

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

  late final _$copyButtonColorAtom =
      Atom(name: '_QrCodeImageStoreBase.copyButtonColor', context: context);

  @override
  Color get copyButtonColor {
    _$copyButtonColorAtom.reportRead();
    return super.copyButtonColor;
  }

  @override
  set copyButtonColor(Color value) {
    _$copyButtonColorAtom.reportWrite(value, super.copyButtonColor, () {
      super.copyButtonColor = value;
    });
  }

  late final _$internetButtonColorAtom =
      Atom(name: '_QrCodeImageStoreBase.internetButtonColor', context: context);

  @override
  Color get internetButtonColor {
    _$internetButtonColorAtom.reportRead();
    return super.internetButtonColor;
  }

  @override
  set internetButtonColor(Color value) {
    _$internetButtonColorAtom.reportWrite(value, super.internetButtonColor, () {
      super.internetButtonColor = value;
    });
  }

  late final _$insertQrCodeImageAsyncAction =
      AsyncAction('_QrCodeImageStoreBase.insertQrCodeImage', context: context);

  @override
  Future<void> insertQrCodeImage(BuildContext? context) {
    return _$insertQrCodeImageAsyncAction
        .run(() => super.insertQrCodeImage(context));
  }

  late final _$readImageAsyncAction =
      AsyncAction('_QrCodeImageStoreBase.readImage', context: context);

  @override
  Future<dynamic> readImage(BuildContext? context) {
    return _$readImageAsyncAction.run(() => super.readImage(context));
  }

  late final _$fetchListAsyncAction =
      AsyncAction('_QrCodeImageStoreBase.fetchList', context: context);

  @override
  Future<void> fetchList(BuildContext? context) {
    return _$fetchListAsyncAction.run(() => super.fetchList(context));
  }

  late final _$_QrCodeImageStoreBaseActionController =
      ActionController(name: '_QrCodeImageStoreBase', context: context);

  @override
  void setActionButtonColor(Color newColor) {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setActionButtonColor');
    try {
      return super.setActionButtonColor(newColor);
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCopyButtonColor(Color newColor) {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setCopyButtonColor');
    try {
      return super.setCopyButtonColor(newColor);
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInternetButtonColor(Color newColor) {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setInternetButtonColor');
    try {
      return super.setInternetButtonColor(newColor);
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSharedButtonColor() {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setSharedButtonColor');
    try {
      return super.setSharedButtonColor();
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setlistViewSize() {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setlistViewSize');
    try {
      return super.setlistViewSize();
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int newIndex) {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(newIndex);
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCapturedCode(String newCode) {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setCapturedCode');
    try {
      return super.setCapturedCode(newCode);
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setcapturedCodeMirror(String newCode) {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.setcapturedCodeMirror');
    try {
      return super.setcapturedCodeMirror(newCode);
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startLoading() {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoading() {
    final _$actionInfo = _$_QrCodeImageStoreBaseActionController.startAction(
        name: '_QrCodeImageStoreBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_QrCodeImageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listViewSize: ${listViewSize},
capturedCodeMirror: ${capturedCodeMirror},
capturedCode: ${capturedCode},
selectedIndex: ${selectedIndex},
load: ${load},
actionButtonColor: ${actionButtonColor},
sharedButtonColor: ${sharedButtonColor},
copyButtonColor: ${copyButtonColor},
internetButtonColor: ${internetButtonColor}
    ''';
  }
}
