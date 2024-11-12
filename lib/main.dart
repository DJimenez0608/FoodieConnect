import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_connect/Screens/splash_screen.dart';
import 'package:foodie_connect/firebase_options.dart';
import 'package:google_api_availability/google_api_availability.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GoogleApiAvailability googleApiAvailability = GoogleApiAvailability.instance;
  await googleApiAvailability.makeGooglePlayServicesAvailable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
