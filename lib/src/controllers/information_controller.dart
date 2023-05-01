import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationController extends GetxController {
  RxString description = ''.obs;

  final controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setDescription(String newDescription, String code) async {
    try {
      description.value = newDescription;

      final documentSnapshot = await FirebaseFirestore.instance.collection(
          "product").where("code", isEqualTo: code).get();

      for (var doc in documentSnapshot.docs) {
        {
          await FirebaseFirestore.instance.collection("product").doc(doc.reference.id).update({"description": newDescription});
        }
      }
    } catch (error) {
      print(error);
    }
  }

  void submit(context) {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }
}