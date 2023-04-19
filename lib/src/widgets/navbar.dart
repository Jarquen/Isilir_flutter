import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/router.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int _selectedIndex = 0;
  String pageName = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 0,
          color: Colors.black87,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Home",
                      icon: Icons.home,
                      selected: _selectedIndex == 0,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        Get.toNamed(Routes.presentationPage);
                      }),
                  IconBottomBar(
                      text: "List",
                      icon: Icons.list,
                      selected: _selectedIndex == 1,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                          pageName = "listPage";
                        });
                        Get.toNamed(Routes.listPage);
                      }),
                  IconBottomBar(
                      text: "History",
                      icon: Icons.history,
                      selected: _selectedIndex == 2,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                        Get.toNamed(Routes.historyPage);
                      }),
                  IconBottomBar(
                      text: "Profile",
                      icon: Icons.account_circle_outlined,
                      selected: _selectedIndex == 3,
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                        Get.toNamed(Routes.profilePage);
                      })
                ],
              ),
            ),
          ),
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {super.key, required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(icon,
                size: 25,
                color: selected ? Colors.deepOrangeAccent : Colors.white)),
        Text(text,
            style: TextStyle(
                fontSize: 12,
                height: .1,
                color: selected ? Colors.deepOrangeAccent : Colors.white))
      ],
    );
  }
}
