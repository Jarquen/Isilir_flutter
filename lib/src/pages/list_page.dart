import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/list_controller.dart';
import 'package:isilir/src/features/router.dart';
import 'package:isilir/src/models/ProductDetails.dart';
import 'package:isilir/src/pages/information_page.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  final listController = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        TextButton(
            onPressed: () {
              listController.fetchAllProducts();
            },
            child: const Text("Refresh")),
        Obx(() => SizedBox(
          height: 650,
              child: !ListController().isLoading.value
                  ? ListView.builder(
                      itemCount: listController.products.length,
                      itemBuilder: (context, index) {
                        final product = listController.products[index];
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
                                          listController.deleteProduct(code);
                                          listController.fetchAllProducts();
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: const ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: Icon(Icons.star_border),
                                          title: Text("Favorite"),
                                        ),
                                        onTap: () {
                                          listController.addToFavorite(code);
                                        },
                                      )
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
