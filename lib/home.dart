import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'criar_qr_code/criar_qr_page.dart';
import 'ler_qr_code/ler_qr_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'QR Code Scanner';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => QRCreatePage()));
                  },
                  child: Text("Criar Qr Code")),

              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => QRScanPage(),
                    ));
                  },
                  child: Text("Ler Qr Code"))
              // ButtonWidget(
              //   text: 'Create QR Code',
              //   onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => QRCreatePage(),
              //   )),
              // ),
              // const SizedBox(height: 32),
              // ButtonWidget(
              //   text: 'Scan QR Code',
              //   onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => QRScanPage(),
              //   )),
              // ),
            ],
          ),
        ),
      );
}
