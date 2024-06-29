import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.gender,
      required this.genderColor,
      required this.genderIcon,
      required this.isMale,
      required this.onTap});
  final String gender;
  final Color genderColor;
  final IconData genderIcon;
  final bool isMale;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: genderColor),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                genderIcon,
                color: Colors.white,
                size: 70,
              ),
              Text(
                gender,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
