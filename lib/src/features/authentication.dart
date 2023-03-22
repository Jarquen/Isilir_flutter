import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();

  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
}