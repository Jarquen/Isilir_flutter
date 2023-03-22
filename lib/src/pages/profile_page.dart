import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Profile'),
      body: const Center(
        child: Text("Profile page"),
      ),
      bottomNavigationBar: const NavBar(),
      floatingActionButton: ScanButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
