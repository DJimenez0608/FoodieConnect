import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/auth_class.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> signOut() async {
    await AuthClass().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [TextButton(onPressed: signOut, child: Text('Sign out now!'))],
      ),
    );
  }
}
