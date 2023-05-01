import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isilir/src/controllers/navbar_controller.dart';
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/pages/history_page.dart';
import 'package:isilir/src/pages/list_page.dart';
import 'package:isilir/src/pages/presentation_page.dart';
import 'package:isilir/src/pages/profile_page.dart';
import 'package:isilir/src/widgets/navbar.dart';

import '../widgets/appbar.dart';
import '../widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(NavbarController());

  final List<Widget> pages = [
    PresentationPage(),
    ListPage(),
    const HistoryPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(
              text: Get.find<NavbarController>().pageName.value),
          body: PageView(
            controller: Get.find<NavbarController>().pageController,
            children: pages,
          ),
          bottomNavigationBar: Navbar(),
          floatingActionButton: ScanButton(onPressed: () {
            Get.toNamed(Routes.scanPage);
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
    // return Scaffold(
    //   appBar: CustomAppBar(text: Get.find<NavbarController>().selectedTab.string),
    //   body: PageView(
    //     controller: Get.find<NavbarController>().pageController,
    //     children: pages,
    //   ),
    //   bottomNavigationBar: Navbar(),
    //   floatingActionButton: ScanButton(onPressed: () {Get.toNamed(Routes.scanPage);}),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    // );
  }
}
