import 'package:flutter/material.dart';
import 'Widgets/Calculator.dart';
import 'Widgets/ResultsCard.dart';
import 'Widgets/buildHomeContent.dart';

class HomePage extends StatelessWidget {
  final bool formSubmitted;
  final GlobalKey<FormState> formKey;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final String gender;
  final List<String> genders;
  final ValueChanged<String?> onGenderChanged;
  final VoidCallback onCalculate;
  final bool showResults;
  final double bulkingPotentialScore;
  final String potentialCategory;
  final String healthAdvice;
  final String deviationMessage;
  final Map<String, dynamic> naturalNeeds;
  final Map<String, dynamic> bulkingNeeds;
  final Color Function(double) getScoreColor;
  final String Function(double) getAssessmentTitle;
  final String Function(double) getAssessmentDescription;
  final Function(int) onNavigate;
  final VoidCallback onReset;
  const HomePage({
    super.key,
    required this.formSubmitted,
    required this.formKey,
    required this.heightController,
    required this.weightController,
    required this.ageController,
    required this.gender,
    required this.genders,
    required this.onGenderChanged,
    required this.onCalculate,
    required this.showResults,
    required this.bulkingPotentialScore,
    required this.potentialCategory,
    required this.healthAdvice,
    required this.deviationMessage,
    required this.naturalNeeds,
    required this.bulkingNeeds,
    required this.getScoreColor,
    required this.getAssessmentTitle,
    required this.getAssessmentDescription,
    required this.onNavigate,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return buildHomeContent(
      context,
      formSubmitted,
      _buildCalculatorForm(context),
      _buildResultsCard(context),
      _buildSuggestionsSection(context),
    );
  }

  Widget _buildCalculatorForm(BuildContext context) {
    return CalculatorForm(
      formKey: formKey,
      heightController: heightController,
      weightController: weightController,
      ageController: ageController,
      gender: gender,
      genders: genders,
      onGenderChanged: onGenderChanged,
      onCalculate: onCalculate,
      formSubmitted: formSubmitted,
    );
  }

  Widget _buildResultsCard(BuildContext context) {
    return ResultsCard(
      showResults: showResults,
      bulkingPotentialScore: bulkingPotentialScore,
      potentialCategory: potentialCategory,
      healthAdvice: healthAdvice,
      deviationMessage: deviationMessage,
      naturalNeeds: naturalNeeds,
      bulkingNeeds: bulkingNeeds,
      getScoreColor: getScoreColor,
      getAssessmentTitle: getAssessmentTitle,
      getAssessmentDescription: getAssessmentDescription,
      onReset: onReset,
    );
  }

  Widget _buildSuggestionsSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          'Suggestions',
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        _buildSuggestionCard(
          context,
          'Workouts',
          'Explore tailored workout plans',
          Colors.blueAccent,
          1,
        ),
        SizedBox(height: screenHeight * 0.02),
        _buildSuggestionCard(
          context,
          'Nutrition',
          'View your nutrition plan',
          Colors.greenAccent,
          2,
        ),
      ],
    );
  }

  Widget _buildSuggestionCard(
      BuildContext context, String title, String subtitle, Color color, int pageIndex) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => onNavigate(pageIndex),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Icon(
                title == 'Workouts' ? Icons.fitness_center : Icons.restaurant,
                color: color,
                size: screenWidth * 0.07,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
              size: screenWidth * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
