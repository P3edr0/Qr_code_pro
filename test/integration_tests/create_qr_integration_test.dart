import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
  group('Teste de integração do create_qr', () {
    test('Teste do método Fetch', () async {
      initInjection();

      sqfliteFfiInit();
      final CreateQrStore _createQrStore = CreateQrStore();

      databaseFactory = databaseFactoryFfi;

      _createQrStore.createdCodeMirror = "";

      await _createQrStore.fetchList(null);
      expect(_createQrStore.createdQrList, []);
    });

    test('Teste do método insert', () async {
      initInjection();

      sqfliteFfiInit();
      final CreateQrStore _createQrStore = CreateQrStore();

      databaseFactory = databaseFactoryFfi;

      _createQrStore.setCreatedCode("tudo certo");
      int listLenght = _createQrStore.createdQrList.length;
      await _createQrStore.insertCreatedQrCode(null);

      expect(_createQrStore.createdQrList.length, (++listLenght));
    });
  });
}
