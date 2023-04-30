import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isilir/src/models/ProductDetails.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key, required this.productCode}) : super(key: key);

  final String productCode;

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late Product product;

  @override
  void initState() {
    super.initState();
    fetchProduct(widget.productCode);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Informations'),
      body: const Center(
        child: Text("Informations page"),
      ),
      bottomNavigationBar: Navbar(),
      floatingActionButton: ScanButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void fetchProduct(String productCode) async {
    Product productRes;
    final documentSnapshot = await FirebaseFirestore.instance.collection("product").where("code", isEqualTo: productCode).get();
    productRes = documentSnapshot.docs[0].data() as Product;
    // product = documentSnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
      product = productRes;
      print(product);
    });
  }
}