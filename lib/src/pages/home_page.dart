import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isilir/src/controllers/auth_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'Barcode');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Home'),
      body: Column(children: <Widget>[
        Expanded(flex: 5, child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated,)),
        Expanded(flex: 1, child: (result != null) ? Text("Barcode Type: ${describeEnum(
            result!.format)} Data: ${result!.code}") : const Text("Scan a code"))
      ],)
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SvgPicture.asset(
      //         "assets/images/barcode.svg",
      //         color: Colors.deepOrange,
      //         width: 80,
      //         height: 80,
      //       ),
      //       const Text(
      //         "Bienvenue sur Isilir",
      //         style: TextStyle(
      //           fontSize: 32,
      //         ),
      //       ),
      //       Text(
      //         // "Veuillez scanner un produit",
      //         barcode,
      //         style: TextStyle(
      //           fontSize: 18,
      //         ),
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             AuthController.instance.logout();
      //             // test;
      //           },
      //           child: const Text("logout"))
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: const NavBar(),
      // // floatingActionButton: ScanButton(onPressed: test),
      // floatingActionButton: FloatingActionButton(onPressed: barcodeScan),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });

    if (result != null) {
      Get.put
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // Future<void> barcodeScan() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //   if (!mounted) return;  setState(() {
  //     barcode = barcodeScanRes;
  //   });
  // }

  void test() {
    return print("test");
  }
}
