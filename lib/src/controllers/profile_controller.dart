import 'package:get/get.dart';
import 'package:isilir/src/controllers/auth_controller.dart';

class ProfileController extends GetxController {
  final currentUser = AuthController.instance.auth.currentUser;
  RxString userEmail = "".obs;

  @override
  void onReady() async {
    super.onReady();
    connected();
  }

  void connected() {
    if (currentUser?.email != null) {
      userEmail.value = currentUser!.email.toString();;
    }
  }

}