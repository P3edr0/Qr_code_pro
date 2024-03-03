import 'package:flutter/material.dart';
import 'package:qr_code_pro/presentation/ui/controller/store/home_store.dart';
import 'package:qr_code_pro/presentation/ui/pages/create_qr_code/create_qr_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/home_page/home_widgets.dart';
import 'package:qr_code_pro/presentation/ui/pages/insert_image/insert_image_page.dart';
import 'package:qr_code_pro/presentation/ui/pages/read_qr_code/read_qr_page.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  const Home({Key? key}) : super(key: key);
}

class _HomeState extends State<Home> {
  final PageController controller = PageController(initialPage: 1);
  final HomeStore _homeStore = HomeStore();

  void onTabTapped(int index) {
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors.lightGrey,
        bottomNavigationBar: CustomNavBar(
          ontap: onTabTapped,
          homeStore: _homeStore,
        ),
        body: PageView(
          onPageChanged: _homeStore.onPageChanged,
          controller: controller,
          children: const <Widget>[
            CreateQrPage(),
            ReadQrCodePage(),
            InsertImagePage(),
          ],
        ));
  }
}
