import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/qr_code_image_store.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  group('Teste de integração do qr_code_image', () {
    test('Teste do método Fetch', () async {
      initInjection();

      final QrCodeImageStore _qrCodeImageStore = QrCodeImageStore();

      sqfliteFfiInit();

      databaseFactory = databaseFactoryFfi;

      _qrCodeImageStore.capturedCode = "";

      await _qrCodeImageStore.fetchList();
      expect(_qrCodeImageStore.capturedQrList, []);
    });

    test('Teste do método insert', () async {
      initInjection();

      final QrCodeImageStore _qrCodeImageStore = QrCodeImageStore();

      sqfliteFfiInit();

      databaseFactory = databaseFactoryFfi;

      _qrCodeImageStore.capturedCode = "tudo certo";
      int listLenght = _qrCodeImageStore.capturedQrList.length;
      await _qrCodeImageStore.InsertQrCodeImage();

      expect(_qrCodeImageStore.capturedQrList[0].code, "tudo certo");
      expect(_qrCodeImageStore.capturedQrList.length, (++listLenght));
    });
  });
}
