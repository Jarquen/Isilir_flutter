import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/auth_controller.dart';
import 'package:isilir/src/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController());

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(
        height: 50,
      ),
      Center(
        child: Image.asset(
          "assets/images/man.png",
          width: 200,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      userInfoItemProfile(Icons.person, controller.userEmail.value),
      const SizedBox(
        height: 20,
      ),
      Center(
        child: Material(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              AuthController.instance.logout();
            },
            borderRadius: BorderRadius.circular(32),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 12,
              ),
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
