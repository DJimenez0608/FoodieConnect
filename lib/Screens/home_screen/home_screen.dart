import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/classes/auth_class.dart';
import 'package:foodie_connect/Screens/home_screen/views/homeView.dart';
import 'package:foodie_connect/Screens/home_screen/views/profileView.dart';
import 'package:foodie_connect/Screens/home_screen/views/settignView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  Future<void> signOut() async {
    await AuthClass().signOut();
  }

  final List<Widget> _pages = [
    Homeview(),
    Profileview(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      appBar: AppBar(
        title: Text(
          'FoodieConnect',
          style: TextStyle(
            fontFamily: 'PlaywriteGBS',
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.orange,
        actions: [TextButton(onPressed: signOut, child: Text('Sign out now!'))],
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: Colors.orange,
        shadowColor: Color(0xffF5F5F5),
        items: [
          //SETTINGS
          BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Icon(Icons.settings),
              title: Text('   SETTINGS')),
          //HOME
          BottomNavyBarItem(
            activeColor: Colors.white,
            icon: Icon(Icons.home),
            title: Text('   HOME'),
          ),
          //PROFILE
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('    PROFILE'),
              activeColor: Colors.white),
        ],
        onItemSelected: (index) => setState(() => _currentIndex = index),
        selectedIndex: _currentIndex,
      ),
    );
  }
}
