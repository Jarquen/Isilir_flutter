import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController instance = Get.find();
  final name = ''.obs;
  final email = ''.obs;

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  void signupUser(String email, String password) {

  }
}