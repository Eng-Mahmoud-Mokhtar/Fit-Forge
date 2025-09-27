import 'package:flutter/material.dart';
import 'package:gym/Features/Start/presentation/view_model/views/widgets/GoalCards.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000011),
              Color(0xFF0D0033),
              Color(0xFF1A001A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.07),
                Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3A3AFF),
                        Color(0xFF6A4DFF),
                        Color(0xFF8C66FF),                       ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(screenWidth * 0.06),
                  ),
                  child: Icon(
                    Icons.fitness_center,
                    size: screenWidth * 0.15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Choose Your Goal',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Let’s personalize your fitness journey',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                const GoalCardsSection(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
