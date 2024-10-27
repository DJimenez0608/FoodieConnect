import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:foodie_connect/Screens/intro_screen/intro_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => IntroScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffFFF4CC),
                Color(0xFFF28B82),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'FoodieConnect',
                style: TextStyle(
                  fontFamily: 'PlaywriteGBS',
                  fontSize: 45,
                ),
              )
                  .animate(
                    delay: const Duration(
                      milliseconds: 1000,
                    ),
                  )
                  .fade(
                    begin: .0,
                    end: .9,
                  ),
              const Text(
                'Connect with fellow foodies',
                style: TextStyle(
                  fontFamily: 'Calinastiya',
                  fontSize: 35,
                ),
              )
                  .animate(
                    delay: const Duration(
                      milliseconds: 1300,
                    ),
                  )
                  .fade(
                    begin: .0,
                    end: .9,
                  ),
              Animate(
                delay: const Duration(milliseconds: 1600),
                effects: const [FadeEffect(begin: .0, end: .9)],
                child: Lottie.network(
                    'https://lottie.host/a506e083-f5bb-4323-8b13-0777210ec260/FUsVIPSOGZ.json'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
