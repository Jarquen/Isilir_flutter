import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/auth_controller.dart';
import 'package:isilir/src/features/router.dart';
import '../controllers/login_controller.dart';
import '../widgets/appbar.dart';
import '../widgets/navbartest.dart';
import '../widgets/scan_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Login'),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "Connectez-vous pour avoir accès à toutes les fonctinnalitées"),
            TextFormField(
              controller: emailEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordEditingController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            TextButton(onPressed: () {}, child: const Text("Mot de passe oublié ?")),
            ElevatedButton(onPressed: () {AuthController.instance.login(emailEditingController.text, passwordEditingController.text);}, child: const Text("Login")),
            TextButton(onPressed: () {
              Get.toNamed(Routes.signupPage);
                }, child: const Text("Creer un compte")),
          ],
        ),
      ),
      // bottomNavigationBar: const NavBar(),
      // floatingActionButton: ScanButton(onPressed: () {}),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
