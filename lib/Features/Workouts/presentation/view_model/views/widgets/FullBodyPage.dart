import 'package:flutter/cupertino.dart';
import '../WorkoutPage.dart';

class FullBodyPage extends StatelessWidget {
  const FullBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = {
      "Day 1\nFull Body": [
        "Squats 4x6",
        "Bench Press 4x8",
        "Pull Ups 4x8",
        "Shoulder Press Machine 3x10",
        "Barbell Rows 4x10",
      ],
      "Day 2\nRest": ["Rest"],
      "Day 3\nFull Body": [
        "Deadlifts 4x6",
        "Incline Press 4x8",
        "Chin Ups 4x8",
        "Shoulder Press Machine 3x10",
        "Lunges 4x12",
      ],
      "Day 4\nRest": ["Rest"],
      "Day 5\nFull Body": [
        "Front Squats 4x6",
        "Dips 4x10",
        "Pull Downs 4x10",
        "Push Press 4x8",
        "Calf Raises 5x15",
      ],
      "Day 6\nRest": ["Rest"],
      "Day 7\nRest": ["Rest"],
    };

    final exerciseImages = {
      "Squats 4x6": "assets/Screenshot__123_-removebg-preview.png",
      "Bench Press 4x8":
      "assets/11_Barbell_Chest_Exercises_With_or_Without_Bench-removebg-preview.png",
      "Pull Ups 4x8": "assets/Screenshot__116_-removebg-preview.png",
      "Shoulder Press Machine 3x10":
      "assets/Screenshot__83_-removebg-preview.png",
      "Barbell Rows 4x10": "assets/Screenshot__119_-removebg-preview.png",
      "Deadlifts 4x6": "assets/Screenshot__131_-removebg-preview.png",
      "Incline Press 4x8": "assets/Screenshot__117_-removebg-preview.png",
      "Chin Ups 4x8": "assets/Screenshot__125_-removebg-preview-removebg-preview.png",
      "Lunges 4x12": "assets/Screenshot__99_-removebg-preview.png",
      "Front Squats 4x6": "assets/Screenshot__127_-removebg-preview-removebg-preview.png",
      "Dips 4x10": "assets/Screenshot__126_-removebg-preview.png",
      "Pull Downs 4x10": "assets/Screenshot__120_-removebg-preview.png",
      "Push Press 4x8": "assets/Screenshot__129_-removebg-preview.png",
      "Calf Raises 5x15": "assets/Screenshot__98_-removebg-preview.png",
    };

    return buildWorkoutGridPage(context, "Full Body", workouts, exerciseImages);
  }
}
