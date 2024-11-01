import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/auth_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  Future<void> signOut() async {
    await AuthClass().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FoodieConnect',
            style: TextStyle(
              fontFamily: 'PlaywriteGBS',
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.orange,
          actions: [
            TextButton(onPressed: signOut, child: Text('Sign out now!'))
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              //PROFILE PHOTO

              //ACOUNT DETAILS
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          items: [
            //SETTINGS
            BottomNavyBarItem(
                icon: Icon(Icons.settings), title: Text('   Settings')),
            //HOME
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text('   Home')),
            //SAVED RECIPES
            BottomNavyBarItem(
                icon: Icon(Icons.favorite_outlined),
                title: Text('      Recipes')),
            //PROFILE
            BottomNavyBarItem(
                icon: Icon(Icons.person), title: Text('    Profile')),
          ],
          onItemSelected: (index) => setState(() => _currentIndex = index),
          selectedIndex: _currentIndex,
        ));
  }
}
