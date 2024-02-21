import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:test/test.dart';

void main() {
  final CreateQrStore _createQrStore = CreateQrStore();

  group('Teste de funcionalidades do módulo create_qr', () {
    test('Testando métodos de loading', () {
      _createQrStore.startLoading();

      expect(_createQrStore.load, true);

      _createQrStore.stopLoading();

      expect(_createQrStore.load, false);
    });

    test('Testando métodos de código lido', () {
      _createQrStore.setCreatedCode('testando createdCode');
      expect(_createQrStore.createdCode.text, 'testando createdCode');
    });
    test('Testando métodos de seleção de index', () {
      _createQrStore.setSelectedIndex(10);
      expect(_createQrStore.selectedIndex, 10);
    });

    test('Testando método de setCreatedMirror', () {
      _createQrStore.setCreatedCodeMirror('mirror');
      expect(_createQrStore.createdCodeMirror, 'mirror');
    });
  });
}
