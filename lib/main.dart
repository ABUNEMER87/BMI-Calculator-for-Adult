import '../screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const BmiPlus());
}

class BmiPlus extends StatelessWidget {
  const BmiPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          duration: 5000,
          splash: Icons.home,
          nextScreen: const HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}
