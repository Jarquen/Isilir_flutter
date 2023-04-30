import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final List<String> pagesName = [
    "Home",
    "List",
    "History",
    "Profile"
  ];

  RxInt selectedTab = 0.obs;
  RxString pageName = "Home".obs;
  PageController pageController = PageController();

  void changeTabIndex(int index) {
    selectedTab.value = index;
    pageName.value = pagesName[index];
    pageController.jumpToPage(index);
  }
}