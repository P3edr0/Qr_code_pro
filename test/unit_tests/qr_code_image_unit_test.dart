import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/qr_code_image_store.dart';
import 'package:test/test.dart';

void main() {
  group('Teste de funcionalidades do módulo qr_code_image', () {
    initInjection();
    final QrCodeImageStore _qrCodeImageStore = QrCodeImageStore();

    test('Testando métodos de loading', () {
      _qrCodeImageStore.startLoading();

      expect(_qrCodeImageStore.load, true);

      _qrCodeImageStore.stopLoading();

      expect(_qrCodeImageStore.load, false);
    });

    test('Testando métodos de código lido', () {
      _qrCodeImageStore.setCapturedCode('testando capturedCode');
      expect(_qrCodeImageStore.capturedCode, 'testando capturedCode');
    });
    test('Testando métodos de seleção de index', () {
      _qrCodeImageStore.setSelectedIndex(10);
      expect(_qrCodeImageStore.selectedIndex, 10);
    });
  });
}
