import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/intro_screen/post_view.dart';
import 'package:foodie_connect/Screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'What is this app good for?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PlaywriteGBS',
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 500,
              child: PageView(
                controller: _pageController,
                children: const [
                  PostView(
                    image: 'assets/images/pngwing.com.png',
                    title: 'Inspiration and Discovery',
                    description:
                        ' You can discover unique and creative recipes \n shared by other passionate cooks, getting\n inspired to try new dishes and techniques',
                  ),
                  PostView(
                    image: 'assets/images/aprender.png',
                    title: 'Learning and Continuous Improvement',
                    description:
                        'You have at your disposal a space to share\n and learn new tricks, techniques and culinary recommendations.',
                  ),
                  PostView(
                    image: 'assets/images/hablarconotros.png',
                    title: 'Connection with other chefs',
                    description:
                        'You can interact and build a network of\n people with similar interests, in an environment\n where cooking is the center of attention.',
                  ),
                  PostView(
                    image: 'assets/images/feedback.png',
                    title: 'Opinions and Feedback',
                    description:
                        'FoodieConnect allows you to share culinary\n creations and receive feedback, helping to\n improve skills and get ideas.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const WormEffect(activeDotColor: Color(0xFFF28B82)),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'I get it!',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.indigo,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
