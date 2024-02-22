import 'package:qr_code_pro/presentation/ui/controller/store/read_qr_store.dart';
import 'package:test/test.dart';

import 'sqlflite_integration_tests/test_sqflite_provider.dart';

void main() {
  final ReadQrStore _readQrStore = ReadQrStore();
  group('Teste de integração do read_qr', () async {
    await TestSqfliteProvider().starTestDatabase();

    test('Teste do método ', () async {
      await _readQrStore.setListaQr();
    });
  });
}
