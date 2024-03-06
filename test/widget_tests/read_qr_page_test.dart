import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/create_qr_code/create_qr_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';

// Mock da classe CreateQrStore
class MockCreateQrStore extends Mock implements CreateQrStore {}

void main() {
  group('CreateQrPage UI Test', () {
    late MockCreateQrStore mockCreateQrStore;
    initInjection();

    setUp(() {
      mockCreateQrStore = MockCreateQrStore();
    });

    testWidgets('Displays app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreateQrPage(),
        ),
      );

      expect(find.text('CRIAR QR CODE'), findsOneWidget);
      expect(find.byType(QrCodePreview), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });
    testWidgets('Qr Code Preview', (WidgetTester tester) async {
      // await tester.pumpWidget(
      //   const MaterialApp(
      //     home: CreateQrPage(),
      //   ),
      // );
      await tester.pumpWidget(const QrCodePreview(
        firstValidation: true,
        qrData: 'Teste',
        secondvalidation: false,
      ));

      // expect(find.text('CRIAR QR CODE'), findsOneWidget);
    });

    testWidgets('Generates QR code on button tap', (WidgetTester tester) async {
      when(mockCreateQrStore.createQrButton(any))
          .thenAnswer((_) => Future.value());

      await tester.pumpWidget(
        const MaterialApp(
          home: CreateQrPage(),
        ),
      );

      await tester.tap(find.text('GERAR QR CODE'));
      await tester.pump();

      expect(find.byType(QrCodePreview), findsOneWidget);
    });

    testWidgets('Displays error message on failed QR code generation',
        (WidgetTester tester) async {
      when(mockCreateQrStore.createQrButton(any))
          .thenAnswer((_) => Future.error('Failed to generate QR code'));

      await tester.pumpWidget(
        const MaterialApp(
          home: CreateQrPage(),
        ),
      );

      await tester.tap(find.text('GERAR QR CODE'));
      await tester.pump();

      expect(find.text('Failed to generate QR code'), findsOneWidget);
    });

    // Add more tests as needed...
  });
}
