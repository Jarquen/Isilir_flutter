import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/pages/home_page.dart';
import 'package:isilir/src/pages/login_page.dart';
import 'package:isilir/src/pages/presentation_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialPage);
  }

  _initialPage(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void signup(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      Get.snackbar("User", "User message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Account creation failed",
              style: TextStyle(color: Colors.black)),
          messageText: Text(error.toString()));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      Get.snackbar("User", "User message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text("Login failed",
              style: TextStyle(color: Colors.black)),
          messageText: Text(error.toString()));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
