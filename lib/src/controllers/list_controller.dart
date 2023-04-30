import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:isilir/src/models/ProductDetails.dart';

class ListController extends GetxController {
  // Rx<List<Product>> products = Rx<List<Product>>([]);
  List products = [];
  late Product product;

  var isLoading = false.obs;

  @override
  void onInit() async {
    await fetchAllProducts();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchAllProducts();
  }

  Future fetchAllProducts() async {
    isLoading.value = true;
    try {
      List productsList = [];
      final documentSnapshot = await FirebaseFirestore.instance.collection("product").get();
      productsList = documentSnapshot.docs.map((doc) => doc.data()).toList();
      products = productsList;
      isLoading.value = false;
      print(products);
      update();
    } catch (error) {
      print(error);
    }
  }

  void deleteProduct(String code) async {
    try {
      await FirebaseFirestore.instance.collection("product").doc().get();
    } catch (error) {
      print(error);
    }
  }

}