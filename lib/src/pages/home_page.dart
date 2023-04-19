import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isilir/src/controllers/NavbarController.dart';
import 'package:isilir/src/controllers/auth_controller.dart';
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/pages/list_page.dart';
import 'package:isilir/src/pages/presentation_page.dart';
import 'package:isilir/src/pages/profile_page.dart';
import 'package:isilir/src/pages/scan_page.dart';
import 'package:isilir/src/widgets/navbartest.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';
import 'package:isilir/src/pages/history_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(NavbarController());

  final List<Widget> pages = [
    const PresentationPage(),
    const ListPage(),
    const HistoryPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Home'),
      // body: PageView(
      //   controller: Get.find<NavbarController>().pageController,
      //   children: pages,
      // ),
      body: PageView(
        controller: Get.find<NavbarController>().pageController,
        children: pages,
      ),
      bottomNavigationBar: NavBarTest(),
      floatingActionButton: ScanButton(onPressed: () {Get.toNamed(Routes.scanPage);}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
