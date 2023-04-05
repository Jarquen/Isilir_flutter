import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:isilir/src/controllers/auth_controller.dart';
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/pages/scan_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';
import 'package:isilir/src/pages/history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Home'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/barcode.svg",
              color: Colors.deepOrange,
              width: 80,
              height: 80,
            ),
            const Text(
              "Bienvenue sur Isilir",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              "Veuillez scanner un produit",
              // barcode,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance.logout();
                  // test;
                },
                child: const Text("logout"))
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
      // floatingActionButton: FloatingActionButton(onPressed: () {Get.toNamed(Routes.scanPage);}),
      floatingActionButton: ScanButton(onPressed: () {Get.toNamed(Routes.scanPage);}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
