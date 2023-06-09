import 'package:get/get.dart';
import 'package:isilir/src/models/ProductDetails.dart';
import 'package:isilir/src/pages/signup_page.dart';
import '../pages/favorites_page.dart';
import '../pages/home_page.dart';
import '../pages/presentation_page.dart';
import '../pages/information_page.dart';
import '../pages/list_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/scan_page.dart';


Product test = {} as Product;

class Routes {
  static String homePage = '/home';
  static String presentationPage = '/presentation';
  static String informationPage = '/information';
  static String listPage = '/list';
  static String favoritesPage = '/favorites';
  static String profilePage = '/profile';
  static String scanPage = '/scan';
  static String loginPage = '/login';
  static String signupPage = '/signup';
}

final appPages = [
  GetPage(name: Routes.homePage, page: () => HomePage()),
  GetPage(name: Routes.presentationPage, page: () => PresentationPage()),
  GetPage(name: Routes.informationPage, page: () => InformationPage(product: test,)),
  GetPage(name: Routes.listPage, page: () => ListPage()),
  GetPage(name: Routes.favoritesPage, page: () => FavoritesPage()),
  GetPage(name: Routes.profilePage, page: () => ProfilePage()),
  GetPage(name: Routes.scanPage, page: () => const ScanPage()),
  GetPage(name: Routes.loginPage, page: () => LoginPage()),
  GetPage(name: Routes.signupPage, page: () => SignupPage())
];
