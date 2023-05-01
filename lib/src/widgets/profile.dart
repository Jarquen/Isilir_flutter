import 'package:flutter/material.dart';
import 'package:isilir/src/controllers/auth_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
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
          const SizedBox(width: 16,),
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
    return ListView(
        children: [
          Center(
            child: Image.asset(
              "assets/images/man.png",
              width: 240,
            ),
          ),
          const SizedBox(height: 20,),
          userInfoItemProfile(Icons.person, "User name"),
          const SizedBox(height: 20,),
          userInfoItemProfile(Icons.email, "User email"),
          const SizedBox(height: 20,),
          Center(
            child: Material(
              color: Colors.redAccent,
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
          )
        ]
    );
  }
}