import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isilir/src/pages/home_page.dart';
import 'package:isilir/src/widgets/navbartest.dart';

class NavbarController extends GetxController {
  RxInt selectedTab = 0.obs;
  PageController pageController = PageController();

  void changeTabIndex(int index) {
    selectedTab.value = index;
    pageController.jumpToPage(index);
  }
}