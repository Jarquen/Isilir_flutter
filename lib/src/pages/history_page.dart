import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';
import '../widgets/scan_button.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'History'),
      body: const Center(
        child: Text("History page"),
      ),
      bottomNavigationBar: const NavBar(),
      floatingActionButton: ScanButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}