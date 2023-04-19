import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List products = [];

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final image = product['image_url'];
            final name = product['generic_name'];
            final brands = product['brands'];

            return Card(
              child: ListTile(
                  leading: Image.network(image),
                  title: Text(name),
                  subtitle: Text(brands),
                  trailing: Icon(Icons.more_vert)
              ),
            );
          },

        ),
      );
  }

  void fetchAllProducts() async {
    List productsList = [];
    final documentSnapshot = await FirebaseFirestore.instance.collection("product").get();
    productsList = documentSnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
      products = productsList;
    });
  }
}