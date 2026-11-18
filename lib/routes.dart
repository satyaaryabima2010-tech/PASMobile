import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_flutter/pages/login_page.dart';
import 'package:pas_flutter/pages/mainmenu_page.dart';


class Routes {
  static const String loginPage = '/login';
  static const String bolaPage = '/bola';
  static const String homePage = '/home';
 static const String detailProduk = '/detail-produk';

  static final pages = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: homePage,
      page: () => const MainMenuPage(),
    ),
  ];

}