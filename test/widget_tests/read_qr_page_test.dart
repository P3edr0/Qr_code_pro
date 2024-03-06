import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/create_qr_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/create_qr_code/create_qr_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

// Mock da classe CreateQrStore
class MockCreateQrStore extends Mock implements CreateQrStore {}

void main() {
  group('Testes da página ReadQrPage', () {
    // late MockCreateQrStore mockCreateQrStore;
    initInjection();

    setUp(() {
      // mockCreateQrStore = MockCreateQrStore();
    });

    testWidgets('Teste  ReadQrPage', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CreateQrPage(),
        ),
      );

      expect(find.text('CRIAR QR CODE'), findsOneWidget);
      expect(find.byType(QrCodePreview), findsOneWidget);
      expect(find.byType(ActionButton), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text("Códigos gerados"), findsOneWidget);
    });

    testWidgets('Teste Shared Button', (WidgetTester tester) async {
      Color sharedColor = ProjectColors.darkRed;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SharedQrCodeButton(
              validation: true,
              sharedButtonColor: sharedColor,
              qrCodeData: 'Test Shared',
              changeSharedButtonColor: () {
                sharedColor = ProjectColors.lightRed;
              },
            ),
          ),
        ),
      );

      // Encontre o botão pelo texto
      final buttonFinder = find.byType(SharedQrCodeButton);

      // Acione um toque no botão
      await tester.tap(buttonFinder);

      // Aguarde a reconstrução do widget
      await tester.pump();

      // Verifique se a função foi acionada
      expect(sharedColor, ProjectColors.lightRed);
    });

    testWidgets('Teste Action Button', (WidgetTester tester) async {
      bool functionTriggered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ActionButton(
              actionFunction: () {
                functionTriggered = true;
              },
              buttonText: 'Test ActionButton',
              iconbutton: Icons.ac_unit,
              buttonColor: Colors.blue,
            ),
          ),
        ),
      );

      // Encontre o botão pelo texto
      final buttonFinder = find.text('Test ActionButton');

      // Acione um toque no botão
      await tester.tap(buttonFinder);

      // Aguarde a reconstrução do widget
      await tester.pump();

      // Verifique se a função foi acionada
      expect(functionTriggered, true);
    });

    testWidgets('Teste LinksListview', (WidgetTester tester) async {
      bool functionTriggered = false;
      final testList = ObservableList<QrCodeEntity>.of(
          [QrCodeEntity('teste', QrCodeTypes.createCode, "22/01/2024")]);
      String codigoCriado = 'teste codigo';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LinksListview(
                currentList: testList,
                listColor: ProjectColors.darkRed,
                listHeight: 200,
                listItemCount: 1,
                selectedIndex: -1,
                setCodigoLido: (String value) {
                  codigoCriado = "codigo alterado";
                },
                setListaQr: (BuildContext context) {
                  testList.add(QrCodeEntity(
                      'Inserido', QrCodeTypes.createCode, "22/01/2024"));
                },
                setselectedIndex: ((index) => index = 1),
                startLoading: () {},
                stopLoading: () {}),
          ),
        ),
      );

      // Encontre o botão pelo texto
      final buttonFinder = find.byType(LinksListview);

      // // Acione um toque no botão
      // await tester.tap(buttonFinder);

      // // Aguarde a reconstrução do widget
      // await tester.pump();

      // // Verifique se a função foi acionada
      expect(buttonFinder, LinksListview);
    });
  });
}
