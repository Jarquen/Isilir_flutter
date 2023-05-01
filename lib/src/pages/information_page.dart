import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/information_controller.dart';

import '../widgets/appbar.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key, required this.product}) : super(key: key);

  final product;

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final controller = Get.put(InformationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black26,
          appBar: const CustomAppBar(text: 'Informations'),
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Image.network(widget.product['image_url']),
              ),
              scroll()
            ],
          ),
        ));
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black12,
                      )
                    ],
                  ),
                ),
                Text(
                  widget.product['product_name'],
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product['brands'],
                  style: const TextStyle(fontSize: 20, color: Colors.black26),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Description",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 230,
                    ),
                    IconButton(
                      icon: const Icon(Icons.create_outlined),
                      onPressed: () async {
                        final description = await openDialog();
                        if (description == null) return;
                        controller.setDescription(description, widget.product['code']);
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                widget.product['description'] != null ? Text(widget.product['description']) : Text(controller.description.value),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Catégories",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.product['categories'], textAlign: TextAlign.center,)
              ],
            ),
          );
        });
  }

  Future<String?> openDialog() =>
      showDialog<String>(context: context, builder: (context) =>
          AlertDialog(
            title: const Text("Description"),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: "Your description"),
              controller: controller.controller,
              onSubmitted: (_) => submit(),
            ),
            actions: [
              TextButton(onPressed: submit, child: const Text("Modifier"))
            ],
          )
      );

  void submit() {
    Navigator.of(context).pop(controller.controller.text);
    controller.controller.clear();
  }
}
