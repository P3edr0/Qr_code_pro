import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_pro/domain/entities/qr_code_entity.dart';
import 'package:qr_code_pro/domain/injection/injection_container.dart';
import 'package:qr_code_pro/presentation/ui/pages/read_qr_code/read_qr_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/action_button.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/links_listview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/qr_code_preview.dart';
import 'package:qr_code_pro/presentation/ui/pages/widgets/shared_button.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

class MockCallbackFunction extends Mock {
  void call(BuildContext context) {}
}

class MockSetCodigoQRCapturadoFunction extends Mock {
  String readCode = '';
  String readCodeMirror = '';
  void call(String value) {
    if (value == '-1') {
      value = 'Inserir texto...';
    }
    readCode = value;
    readCodeMirror = value;
  }
}

class MockSetQrCodeListFunction extends Mock {
  void call(int value) {}
}

class MockSetSelectedIndexFunction extends Mock {
  void call(int value) {}
}

// Mock da função de startLoading
class MockStartLoadingFunction extends Mock {
  void call() {}
}

// Mock da função de stopLoading
class MockStopLoadingFunction extends Mock {
  void call() {}
}

void main() {
  group('Testes da página ReadQrPage', () {
    initInjection();
    late ObservableList<QrCodeEntity> mockList;
    int selectedIndex = -1;

    setUp(() {
      mockList = ObservableList<QrCodeEntity>();
      for (int i = 0; i < 3; i++) {
        mockList.add((QrCodeEntity(
            'item ${i + 1}', QrCodeTypes.createCode, "22/01/2024")));
      }
    });

    testWidgets('Teste  ReadQrPage Resume', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ReadQrCodePage(),
        ),
      );

      expect(find.text('LER QR CODE'), findsWidgets);
      expect(find.byType(QrCodePreview), findsOneWidget);
      expect(find.byType(ActionButton), findsOneWidget);
      expect(find.byType(SharedQrCodeButton), findsOneWidget);
      expect(find.byType(InkWell), findsWidgets);
      expect(find.text("Códigos lidos"), findsOneWidget);
    });

    testWidgets('Teste Shared Button', (WidgetTester tester) async {
      Color sharedColor = ProjectColors.darkblue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SharedQrCodeButton(
              validation: true,
              sharedButtonColor: sharedColor,
              qrCodeData: 'Test Shared',
              changeSharedButtonColor: () {
                sharedColor = ProjectColors.lightblue;
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
      expect(sharedColor, ProjectColors.lightblue);
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
      dynamic mockSetListQRFunction(BuildContext? code) {
        mockList.add(
            QrCodeEntity("Inserido", QrCodeTypes.createCode, '22/01/2024'));
      }

      dynamic mockSetreadCode(String value) {
        if (value == '-1') {
          value = 'Inserir texto...';
        }
      }

      dynamic mockSetSelectedIndexFunction(int value) {
        selectedIndex = value;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: LinksListview(
            currentList: mockList,
            listColor: Colors.red,
            listHeight: 200,
            listItemCount: mockList.length,
            selectedIndex: selectedIndex,
            setCodigoLido: mockSetreadCode,
            setListaQr: mockSetListQRFunction,
            setselectedIndex: mockSetSelectedIndexFunction,
            startLoading: MockStartLoadingFunction(),
            stopLoading: MockStopLoadingFunction(),
          ),
        ),
      );

      expect(find.text('item 1'), findsOneWidget);
      expect(find.text('item 2'), findsOneWidget);
      expect(find.text('item 3'), findsOneWidget);
    });
  });
}
