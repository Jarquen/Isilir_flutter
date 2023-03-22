import 'package:get/get.dart';
import 'package:isilir/src/pages/signup_page.dart';
import '../pages/history_page.dart';
import '../pages/home_page.dart';
import '../pages/information_page.dart';
import '../pages/list_page.dart';
import '../pages/login_page.dart';
import '../pages/profile_page.dart';
import '../pages/scan_page.dart';

class Routes {
  static String homePage = '/home';
  static String informationPage = '/information';
  static String listPage = '/list';
  static String historyPage = '/history';
  static String profilePage = '/profile';
  static String scanPage = '/scan';
  static String loginPage = '/login';
  static String signupPage = '/signup';
}

final appPages = [
  GetPage(name: Routes.homePage, page: () => const HomePage()),
  GetPage(name: Routes.informationPage, page: () => const InformationPage()),
  GetPage(name: Routes.listPage, page: () => const ListPage()),
  GetPage(name: Routes.historyPage, page: () => const HistoryPage()),
  GetPage(name: Routes.profilePage, page: () => const ProfilePage()),
  GetPage(name: Routes.scanPage, page: () => const ScanPage()),
  GetPage(name: Routes.loginPage, page: () => LoginPage()),
  GetPage(name: Routes.signupPage, page: () => SignupPage())
];