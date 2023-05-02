import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isilir/src/controllers/navbar_controller.dart';

import '../features/router.dart';

class Navbar extends StatefulWidget {
  Navbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controller = Get.put(NavbarController());

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                    Get.find<NavbarController>().changeTabIndex(_selectedIndex);
                  }),
              IconBottomBar(
                  text: "List",
                  icon: Icons.list,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Get.find<NavbarController>().changeTabIndex(_selectedIndex);
                  }),
              IconBottomBar(
                  text: "Favorites",
                  icon: Icons.star_border,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    Get.find<NavbarController>().changeTabIndex(_selectedIndex);
                  }),
              IconBottomBar(
                  text: "Profile",
                  icon: Icons.account_circle_outlined,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    Get.find<NavbarController>().changeTabIndex(_selectedIndex);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {super.key,
      required this.text,
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
