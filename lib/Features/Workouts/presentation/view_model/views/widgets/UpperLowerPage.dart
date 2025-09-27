import 'package:flutter/cupertino.dart';
import '../WorkoutPage.dart';

class UpperLowerPage extends StatelessWidget {
  const UpperLowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = {
      "Day 1\nUpper Body": [
        "Bench Press 4x8",
        "Pull Ups 4x8",
        "Shoulder Press Machine 4x10",
        "Barbell Rows 4x10",
      ],
      "Day 2\nLower Body": [
        "Squats 5x5",
        "Deadlift 4x8",
        "Walking Lunges 3x12",
        "Calf Raises 5x15",
      ],
      "Day 3\nRest": ["Rest"],
      "Day 4\nUpper Body": [
        "Incline Dumbbell Press 4x10",
        "Seated Cable Rows 4x10",
        "Lateral Raises 4x12",
        "Cable Rear 3x12",
      ],
      "Day 5\nLower Body": [
        "Front Squats 4x6",
        "Deadlifts 4x6",
        "Leg Press 4x12",
        "Glute Bridges 4x12",
      ],
      "Day 6\nRest": ["Rest"],
      "Day 7\nRest": ["Rest"],
    };

    final exerciseImages = {
      "Bench Press 4x8":
      "assets/11_Barbell_Chest_Exercises_With_or_Without_Bench-removebg-preview.png",
      "Pull Ups 4x8": "assets/Screenshot__116_-removebg-preview.png",
      "Shoulder Press Machine 4x10":
      "assets/Screenshot__83_-removebg-preview.png",
      "Barbell Rows 4x10": "assets/Screenshot__119_-removebg-preview.png",
      "Squats 5x5": "assets/Screenshot__123_-removebg-preview.png",
      "Deadlift 4x8": "assets/Screenshot__131_-removebg-preview.png",
      "Walking Lunges 3x12": "assets/Screenshot__99_-removebg-preview.png",
      "Calf Raises 5x15": "assets/Screenshot__98_-removebg-preview.png",
      "Incline Dumbbell Press 4x10":
      "assets/INCLINE_DUMBBELL_PRESS-removebg-preview.png",
      "Seated Cable Rows 4x10": "assets/Screenshot__104_-removebg-preview.png",
      "Lateral Raises 4x12": "assets/Screenshot__84_-removebg-preview.png",
      "Cable Rear 3x12": "assets/Screenshot__111_-removebg-preview.png",
      "Front Squats 4x6": "assets/Screenshot__127_-removebg-preview-removebg-preview.png",
      "Deadlifts 4x6": "assets/Screenshot__131_-removebg-preview.png",
      "Leg Press 4x12": "assets/Screenshot__93_-removebg-preview.png",
      "Glute Bridges 4x12": "assets/Screenshot__132_-removebg-preview.png",
    };

    return buildWorkoutGridPage(
      context,
      "Upper Lower",
      workouts,
      exerciseImages,
    );
  }
}
