import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_store.dart';
import 'package:test/test.dart';

void main() {
  final ReadQrStore _readQrStore = ReadQrStore();

  group('Test start, increment, decrement', () {
    test('Testando métodos de loading', () {
      _readQrStore.startLoading();

      expect(_readQrStore.load, true);

      _readQrStore.stopLoading();

      expect(_readQrStore.load, false);
    });

    test('Testando métodos de código lido', () {
      _readQrStore.setCodigoLido('testando codigoLido');
      expect(_readQrStore.codigoLido, 'testando codigoLido');
    });
    test('Testando métodos de seleção de index', () {
      _readQrStore.setSelectedIndex(10);
      expect(_readQrStore.selectedIndex, 10);
    });
  });
}
