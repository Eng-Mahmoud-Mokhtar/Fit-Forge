import 'package:flutter/material.dart';
import 'NeedsTable.dart';
import 'ResultsCard.dart';
import 'StepsAndCaloriesCard.dart';

Widget buildHomeContent(
    BuildContext context,
    bool formSubmitted,
    Widget calculatorForm,
    Widget resultsCard,
    Widget suggestionsSection) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return SingleChildScrollView(
    padding: EdgeInsets.all(screenWidth * 0.04),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Build Muscle',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.fitness_center,
              color: Colors.white.withOpacity(0.8),
              size: screenWidth * 0.08,
            ),
          ],
        ),
        Text(
          'Gain strength and size',
          style: TextStyle(
            color: Colors.white70,
            fontSize: screenWidth * 0.035,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        calculatorForm,
        resultsCard,
        SizedBox(height: screenHeight * 0.02),
        const StepsAndCaloriesCard(),
        SizedBox(height: screenHeight * 0.02),
        if (resultsCard is ResultsCard && formSubmitted)
          ...[
            NeedsTable(
              title: 'Your Nutritional Needs',
              naturalNeeds: (resultsCard).naturalNeeds,
              bulkingNeeds: (resultsCard).bulkingNeeds,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        suggestionsSection,
      ],
    ),
  );
}
