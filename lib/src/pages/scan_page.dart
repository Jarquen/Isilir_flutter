import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/models/ProductDetails.dart';
import 'package:isilir/src/pages/home_page.dart';
import 'package:isilir/src/pages/information_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../widgets/appbar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
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
        appBar: const CustomAppBar(text: 'Scan'),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                )),
            Expanded(
                flex: 1,
                child: (result != null)
                    ? Text(
                        "Barcode Type: ${describeEnum(result!.format)} Data: ${result!.code}")
                    : const Text("Scan a code"))
          ],
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });

      if (result != null) {
        Product product = {} as Product;
        fetchData(result!.code).then((value) => {
          createProduct(value),
          product = value as Product
        });
        controller.pauseCamera();
        Get.toNamed(Routes.informationPage);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InformationPage(product: product,)),
        );
      }
    });
  }

  Future<Product?> fetchData(code) async {
    final response = await http.get(
        Uri.parse('https://world.openfoodfacts.org/api/v0/product/$code.json'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final productDetails = ProductDetails.fromJson(result);
      return productDetails.product;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> createProduct(data) async {
    DateTime now = DateTime.now();
    final productDoc = FirebaseFirestore.instance.collection("product");
    
    final product = Product(
        code: data.code,
        product_name: data.product_name,
        brands: data.brands,
        image_url: data.image_url,
        categories: data.categories);
        createdAt: DateTime.now();
    final json = product.toJson();

    await productDoc
        .add(json)
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add product: $error"));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
