import 'package:flutter/material.dart';
import 'WorkoutDayPage.dart';
import 'widgets/BroSplitPage.dart';
import 'widgets/ArnoldSplitPage.dart';
import 'widgets/FullBodyPage.dart';
import 'widgets/PushPullLegsPage.dart';
import 'widgets/UpperLowerPage.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout Programs',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildProgramCard(
              context,
              'Arnold Split',
              'Classic split program',
              Colors.redAccent,
              const ArnoldSplitPage(),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildProgramCard(
              context,
              'Push Pull Legs',
              'Balanced strength & hypertrophy',
              Colors.blueAccent,
              const PushPullLegsPage(),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildProgramCard(
              context,
              'Full Body',
              'Train all muscles every session',
              Colors.greenAccent,
              const FullBodyPage(),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildProgramCard(
              context,
              'Upper Lower',
              'Strength & hypertrophy mix',
              Colors.orangeAccent,
              const UpperLowerPage(),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildProgramCard(
              context,
              'Bro Split',
              'One muscle group per day',
              Colors.purpleAccent,
              const BroSplitPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramCard(
    BuildContext context,
    String title,
    String subtitle,
    Color color,
    Widget page,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
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
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Icon(
                Icons.fitness_center,
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

Widget buildWorkoutGridPage(
  BuildContext context,
  String title,
  Map<String, List<String>> workouts,
  Map<String, String> exerciseImages,
) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
  return Scaffold(
    backgroundColor: const Color(0xFF111827),
    appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: const Color(0xFF1f2937),
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    body: GridView.builder(
      padding: EdgeInsets.all(screenWidth * 0.04),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: screenWidth * 0.04,
        mainAxisSpacing: screenHeight * 0.03,
        childAspectRatio: 1.2,
      ),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final day = workouts.keys.elementAt(index);
        final exercises = workouts.values.elementAt(index);
        final isRestDay = exercises.length == 1 && exercises.first == "Rest";
        final parts = day.split('\n');
        final dayText = parts[0];
        final muscleText = parts.length > 1
            ? parts[1]
            : (isRestDay ? 'Rest' : '');

        return GestureDetector(
          onTap: () {
            if (isRestDay) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkoutDayPage(
                  day: muscleText,
                  exercises: exercises,
                  exerciseImages: exerciseImages,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: isRestDay
                  ? Colors.blueAccent.withOpacity(0.8)
                  : Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayText,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  muscleText,
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}







