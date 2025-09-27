import 'package:flutter/material.dart';
import '../../../../../Home/presentation/view_model/BuildMuscle/BuildMuscleHome.dart';
import '../../../../../Home/presentation/view_model/LoseWeight/LoseWeightHome.dart';

class GoalCardsSection extends StatefulWidget {
  const GoalCardsSection({super.key});

  @override
  State<GoalCardsSection> createState() => _GoalCardsSectionState();
}

class _GoalCardsSectionState extends State<GoalCardsSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _goToHome(String goal) {
    Widget homePage;
    switch (goal) {
      case 'Build Muscle':
        homePage = const BuildMuscleHomePage();
        break;
      case 'Lose Weight':
        homePage = const LoseWeightHomePage();
        break;
      default:
        homePage = const BuildMuscleHomePage();
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => homePage),
    );
  }

  Widget buildGoalCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required double screenWidth,
    required double screenHeight,
    required double startInterval,
  }) {
    return AnimatedBuilder(
      animation: _fadeController,
      builder: (context, child) {
        final animation = CurvedAnimation(
          parent: _fadeController,
          curve: Interval(startInterval, 1.0, curve: Curves.easeOut),
        );

        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0, 40 * (1 - animation.value)),
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => _goToHome(title),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: screenHeight * 0.03),
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF4475ec),
                Color(0xFF3A3AFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            children: [
              Icon(icon, size: screenWidth * 0.1, color: Colors.white),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        buildGoalCard(
          icon: Icons.fitness_center,
          title: "Build Muscle",
          subtitle: "Gain strength and size",
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          startInterval: 0.2,
        ),
        buildGoalCard(
          icon: Icons.local_fire_department,
          title: "Lose Weight",
          subtitle: "Burn fat and stay lean",
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          startInterval: 0.4,
        ),
      ],
    );
  }
}
