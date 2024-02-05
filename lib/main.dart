import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/ui/pages/criar_qr_code/criar_qr_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/ler_imagem/ler_imagem_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/ler_qr_code/ler_qr_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Qr Code Pro",
      theme: ThemeData(
        // primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  const Home({Key? key}) : super(key: key);
}

class _HomeState extends State<Home> {
  final PageController controller = PageController();

  int _indiceAtual = 0;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
      controller.jumpToPage(_indiceAtual);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          showUnselectedLabels: false,
          iconSize: 30,
          selectedFontSize: 18,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _indiceAtual,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.qrcode,
                  color: Colors.blue.shade700,
                ),
                label: ("Ler")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.qrcode, color: Colors.red.shade700),
                label: ("Criar")),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.qrcode, color: Colors.green.shade700),
              label: ("Imagem"),
            ),
          ],
        ),
        body: PageView(
          onPageChanged: onTabTapped,
          controller: controller,
          children: const <Widget>[
            QRScanPage(),
            CriarQrPage(),
            LerImagemPage(),
          ],
        ));
  }
}
