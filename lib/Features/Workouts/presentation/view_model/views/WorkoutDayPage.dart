import 'package:flutter/material.dart';

class WorkoutDayPage extends StatefulWidget {
  final String day;
  final List<String> exercises;
  final Map<String, String> exerciseImages;

  const WorkoutDayPage({
    super.key,
    required this.day,
    required this.exercises,
    required this.exerciseImages,
  });

  @override
  State<WorkoutDayPage> createState() => _WorkoutDayPageState();
}

class _WorkoutDayPageState extends State<WorkoutDayPage> {
  List<bool> visible = [];
  bool animationDone = false;

  @override
  void initState() {
    super.initState();
    visible = List.filled(widget.exercises.length, false);
    for (int i = 0; i < widget.exercises.length; i++) {
      Future.delayed(Duration(milliseconds: 300 * i), () {
        if (mounted) {
          setState(() {
            visible[i] = true;
            if (i == widget.exercises.length - 1) {
              animationDone = true;
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f2937),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Today’s Workout',
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.02,
        ),
        itemCount: widget.exercises.length,
        itemBuilder: (context, index) {
          final exercise = widget.exercises[index];
          final image =
              widget.exerciseImages[exercise] ??
              "assets/images/placeholder.jpg";
          if (animationDone) {
            return buildExerciseCard(
              index,
              exercise,
              image,
              screenWidth,
              screenHeight,
            );
          }

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 700),
            opacity: visible[index] ? 1 : 0,
            curve: Curves.easeIn,
            child: buildExerciseCard(
              index,
              exercise,
              image,
              screenWidth,
              screenHeight,
            ),
          );
        },
      ),
    );
  }

  Widget buildExerciseCard(
    int index,
    String exercise,
    String image,
    double screenWidth,
    double screenHeight,
  ) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: screenWidth * 0.1,
                  height: screenWidth * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.blue,
                        Color(0xFF5B04B6),
                        Color(0xFF1E2A78),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Text(
                    exercise,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.018),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                child: Image.asset(
                  image,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.22,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Text(
                    'Image not found',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
