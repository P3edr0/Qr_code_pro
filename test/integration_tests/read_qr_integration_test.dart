import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_store.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';
// import 'package:sqflite_common/sqlite_api.dart';

void main() {
  group('Teste de integração do read_qr', () {
    test('Teste do método ', () async {
      sqfliteFfiInit();

      // Configure a fábrica de banco de dados
      databaseFactory = databaseFactoryFfi;

      initInjection();
      // await SqlfliteProvider().starDatabase();

      final ReadQrStore _readQrStore = ReadQrStore();
      // await TestSqfliteProvider().starTestDatabase();
      _readQrStore.codigoLido = "tudo certo";

      await _readQrStore.setListaQr();

      expect(_readQrStore.readQrList[0].code, "tudo certo");
      // expect(_readQrStore.readQrList.length, 2);

      await _readQrStore.fetchList();
      expect(_readQrStore.readQrList[0].code, "tudo certo");
      expect(_readQrStore.readQrList.length, 10);
    });
  });
}
