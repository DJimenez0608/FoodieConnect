import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  IconData _icon = Icons.remove_red_eye_outlined;
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Lottie.network(
                    'https://lottie.host/a506e083-f5bb-4323-8b13-0777210ec260/FUsVIPSOGZ.json'),
              ),
              const Text(
                'FoodieConnect',
                style: TextStyle(
                  fontFamily: 'PlaywriteGBS',
                  fontSize: 35,
                ),
              ),
              const Text(
                'Connect with fellow foodies',
                style: TextStyle(
                  fontFamily: 'Calinastiya',
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      height: 1.5,
                      width: 85,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Your kitchen awaits, Chef!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PlaywriteGBS',
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      height: 1.5,
                      width: 85,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _userController,
                  cursorColor: Colors.orangeAccent,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    label: Text(
                      'Username',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: TextField(
                  obscureText: _obscureText,
                  controller: _passwordController,
                  cursorColor: Colors.orangeAccent,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      child: Icon(_icon),
                      onTap: () {
                        setState(() {
                          if (_icon == Icons.remove_red_eye_outlined) {
                            _icon = Icons.visibility_off_outlined;
                            _obscureText = true;
                          } else {
                            _icon = Icons.remove_red_eye_outlined;
                            _obscureText = false;
                          }
                        });
                      },
                    ),
                    helperText: 'A chef’s recipes stay in the kitchen',
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    label: const Text(
                      'Password',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
