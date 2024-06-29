import '../widgets/gender_card.dart';
import '../screens/colors.dart';
import '../screens/control_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String screenRoute = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          GenderCard(
            gender: 'Male',
            genderColor: kBlue,
            genderIcon: Icons.male,
            isMale: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ControlScreen(isMle: true),
                ),
              );
            },
          ),
          GenderCard(
            gender: 'Female',
            genderColor: kRed,
            genderIcon: Icons.female,
            isMale: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ControlScreen(isMle: false),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
