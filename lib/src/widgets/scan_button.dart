import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrangeAccent,
      child: SvgPicture.asset(
        "assets/images/barcode.svg",
        color: Colors.white,
        width: 30,
        height: 30,
      ),
    );
  }
}
