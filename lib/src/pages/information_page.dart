import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Informations'),
      body: const Center(
        child: Text("Informations page"),
      ),
      bottomNavigationBar: const NavBar(),
      floatingActionButton: ScanButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}