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
    return Obx(() => Center(
          child: !ListController().isLoading.value
              ? ListView.builder(
                  itemCount: listController.products.length,
                  itemBuilder: (context, index) {
                    final product = listController.products[index];
                    // print(product as Product);
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
                            // onSelected: ;
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
                                  const PopupMenuItem(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Icon(Icons.star_border),
                                      title: Text("Favorite"),
                                    ),
                                    // onTap: ,
                                  )
                                ]),
                        onTap: () => Get.to(() => InformationPage(product: product)),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
