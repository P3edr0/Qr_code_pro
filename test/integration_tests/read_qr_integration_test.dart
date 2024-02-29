import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_store.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

// import 'package:sqflite_common/sqlite_api.dart';

void main() {
  group('Teste de integração do read_qr', () {
    test('Teste do método Fetch', () async {
      initInjection();

      final ReadQrStore _readQrStore = ReadQrStore();

      sqfliteFfiInit();

      databaseFactory = databaseFactoryFfi;

      _readQrStore.codigoLido = "";

      await _readQrStore.fetchList();
      expect(_readQrStore.readQrList, isNotEmpty);
    });

    test('Teste do método insert', () async {
      initInjection();

      final ReadQrStore _readQrStore = ReadQrStore();

      sqfliteFfiInit();

      databaseFactory = databaseFactoryFfi;

      initInjection();
      _readQrStore.codigoLido = "tudo certo";
      int listLenght = _readQrStore.readQrList.length;
      await _readQrStore.InsertQrCodeReadQrList();

      expect(_readQrStore.readQrList[0].code, "tudo certo");
      expect(_readQrStore.readQrList.length, (++listLenght));
    });
  });
}
