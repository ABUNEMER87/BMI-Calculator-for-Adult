import 'dart:math';
import '../screens/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int height;
  final int weight;
  final bool isMale;

  const ResultScreen(
      {super.key,
      required this.height,
      required this.weight,
      required this.isMale});

  @override
  Widget build(BuildContext context) {
    double bmiCalc = weight / pow(height / 100, 2);
    String result;

    if (bmiCalc < 16) {
      result = 'Severe Thinness';
    } else if (bmiCalc < 17) {
      result = 'Moderate Thinness';
    } else if (bmiCalc < 18.5) {
      result = 'Mild Thinness';
    } else if (bmiCalc < 25) {
      result = 'Normal';
    } else if (bmiCalc < 30) {
      result = 'Overweight';
    } else if (bmiCalc < 35) {
      result = 'Obese Class I';
    } else if (bmiCalc < 40) {
      result = 'Obese Class II';
    } else {
      result = 'Obese Class III';
    }

    return Scaffold(
      backgroundColor: isMale ? kBlue : kRed,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your BMI is:',
              style: TextStyle(
                fontSize: 42,
                color: Colors.white,
              ),
            ),
            Text(
              bmiCalc.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              result,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.refresh_outlined,
                  color: Colors.white, size: 70),
            )
          ],
        ),
      ),
    );
  }
}
