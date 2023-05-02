import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/favorites_controller.dart';
import 'package:isilir/src/controllers/list_controller.dart';
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/models/ProductDetails.dart';
import 'package:isilir/src/pages/information_page.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final favoritesController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  favoritesController.fetchAllFavoritesProducts();
                },
                child: const Text("Refresh")),
            Obx(() => SizedBox(
              height: 650,
              child: !ListController().isLoading.value
                  ? ListView.builder(
                itemCount: favoritesController.products.length,
                itemBuilder: (context, index) {
                  final product = favoritesController.products[index];
                  final image = product['image_url'];
                  final name = product['product_name'];
                  final brands = product['brands'];
                  final code = product['code'];

                  return Card(
                    child: ListTile(
                      leading: Image.network(image),
                      title: Text(name),
                      subtitle: Text(brands),
                      trailing: PopupMenuButton<String>(
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              child: const ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Icon(Icons.delete),
                                title: Text("Delete"),
                              ),
                              onTap: () {
                                favoritesController.deleteProduct(code);
                                favoritesController.fetchAllFavoritesProducts();
                              },
                            ),
                          ]),
                      onTap: () =>
                          Get.to(() => InformationPage(product: product)),
                    ),
                  );
                },
              )
                  : const Center(
                child: CircularProgressIndicator(),
              ),
            )),
          ],
        ));
  }
}
