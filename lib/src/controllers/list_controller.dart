import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:isilir/src/models/ProductDetails.dart';

class ListController extends GetxController {
  // Rx<List<Product>> products = Rx<List<Product>>([]);
  RxList products = [].obs;
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
      final documentSnapshot = await FirebaseFirestore.instance.collection(
          "product").get();
      productsList = documentSnapshot.docs.map((doc) => doc.data()).toList();
      products.value = productsList;
      isLoading.value = false;
      update();
    } catch (error) {
      print(error);
    }
  }

  void deleteProduct(String code) async {
    try {
      final documentSnapshot = await FirebaseFirestore.instance.collection(
          "product").where("code", isEqualTo: code).get();

      for (var doc in documentSnapshot.docs) {
        {
          await FirebaseFirestore.instance.collection("product").doc(doc.reference.id).delete();
        }
      }

      print("success");
    } catch (error) {
      print(error);
    }
  }

}