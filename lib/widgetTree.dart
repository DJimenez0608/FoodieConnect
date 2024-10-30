import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/auth_class.dart';
import 'package:foodie_connect/Screens/home_screen/home_screen.dart';
import 'package:foodie_connect/Screens/login_screen/login_screen.dart';

class Widgettree extends StatefulWidget {
  const Widgettree({super.key});

  @override
  State<Widgettree> createState() => _WidgettreeState();
}

class _WidgettreeState extends State<Widgettree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthClass().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
