import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/list_controller.dart';

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
                    final image = product['image_url'];
                    final name = product['product_name'];
                    final brands = product['brands'];
                    final code = product['code'];

                    return Card(
                      child: ListTile(
                        leading: Image.network(image),
                        title: Text(name),
                        subtitle: Text(brands),
                        // trailing: Icon(Icons.more_vert),
                        trailing: PopupMenuButton<String>(
                            // onSelected: ;
                            itemBuilder: (BuildContext context) => [
                                  const PopupMenuItem(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Icon(Icons.delete),
                                      title: Text("Delete"),
                                    ),
                                    // onTap: ,
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
                        onTap: () => print(code),
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
