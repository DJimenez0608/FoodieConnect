import 'package:flutter/material.dart';

class LoginWay extends StatelessWidget {
  LoginWay({super.key, required this.image, this.onTap});
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.asset(image),
      ),
    );
  }
}
