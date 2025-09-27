import 'package:flutter/cupertino.dart';

import '../WorkoutPage.dart';

class BroSplitPage extends StatelessWidget {
  const BroSplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = {
      "Day 1\nChest": [
        "Bench Press 4x8",             // Compound, middle chest
        "Incline Dumbbell Press 4x10", // Upper chest
        "Cable Crossover 4x12",        // Lower chest, stretch
        "Dumbbell Flys 3x12",          // Chest isolation, stretch
      ],
      "Day 2\nBack": [
        "Deadlifts 4x6",               // Compound, lower back, traps
        "Pull-Ups (Weighted) 4x8",     // Lats, vertical pull
        "Barbell Rows 4x10",           // Mid-back, horizontal pull
        "Close Lat Pulldown 3x12",     // Lats, width
        "Dumbbell Shrugs 3x15",        // Traps
      ],
      "Day 3\nRest": ["Rest"],
      "Day 4\nShoulders": [
        "Shoulder Press Machine 4x8",   // مركب كامل للكتف
        "Dumbbell Front Raise 3x12",    // كتف أمامي
        "Dumbbell Lateral Raise 3x12",  // كتف جانبي
        "Cable Rear Delt Fly 3x12",      // Rear delts, traps
      ],
      "Day 5\nArms": [
        "Rope Tricep Pushdown 3x12",
        "overhead tricep cable 3x12",
        "Dumbbell Preacher Curl 3x10",
        "Incline Biceps Curl 3x12",
        "Dumbbell Hammer Curl 3x12",
        "Wrist Curl 3x15",
      ],
      "Day 6\nLegs": [
        "leg extensions 3x12",
        "leg press 3x12",
        "lunges for glutes 3x12",
        "rdl for hamstrings 3x15",
        "prone leg curl 3x15",
        "standing calf raises 3x20",
        "Decline Sit-Ups 3x12",
        "plank 3",
      ],
      "Day 7\nRest": ["Rest"],
    };
    final exerciseImages = {
      // Chest
      "Bench Press 4x8": "assets/11_Barbell_Chest_Exercises_With_or_Without_Bench-removebg-preview.png",
      "Incline Dumbbell Press 4x10": "assets/INCLINE_DUMBBELL_PRESS-removebg-preview.png",
      "Cable Crossover 4x12": "assets/Screenshot__134_-removebg-preview.png",
      "Dumbbell Flys 3x12": "assets/Screenshot__133_-removebg-preview.png",
      // Back
      "Deadlifts 4x6": "assets/Screenshot__131_-removebg-preview.png",
      "Pull-Ups (Weighted) 4x8": "assets/Screenshot__116_-removebg-preview.png",
      "Barbell Rows 4x10": "assets/Screenshot__119_-removebg-preview.png",
      "Close Lat Pulldown 3x12": "assets/Close_Grip_Lat_Pulldown_workout_for_v_shaped_back-removebg-preview.png",
      "Dumbbell Shrugs 3x15": "assets/Screenshot__122_-removebg-preview.png",
      // Shoulders
      "Shoulder Press Machine 4x8": "assets/Screenshot__83_-removebg-preview.png",
      "Dumbbell Front Raise 3x12": "assets/Screenshot__107_-removebg-preview.png",
      "Dumbbell Lateral Raise 3x12": "assets/Screenshot__84_-removebg-preview.png",
      "Cable Rear Delt Fly 3x12": "assets/43562115-removebg-preview.png",
      // Arms
      "Dumbbell Hammer Curl 3x12": "assets/Screenshot__136_-removebg-preview.png",
      "Rope Tricep Pushdown 3x12": "assets/Screenshot__90_-removebg-preview.png",
      "Dumbbell Preacher Curl 3x10":  "assets/Screenshot__89_-removebg-preview.png",
      "Incline Biceps Curl 3x12": "assets/Screenshot__87_-removebg-preview.png",
      "overhead tricep cable 3x12": "assets/Screenshot__138_-removebg-preview.png",
      "Wrist Curl 3x15": "assets/Screenshot__139_-removebg-preview.png",
      // Legs
      "leg extensions 3x12": "assets/Screenshot__92_-removebg-preview.png",
      "leg press 3x12": "assets/Screenshot__93_-removebg-preview.png",
      "lunges for glutes 3x12": "assets/Screenshot__99_-removebg-preview.png",
      "rdl for hamstrings 3x15": "assets/Screenshot__101_-removebg-preview.png",
      "prone leg curl 3x15": "assets/Screenshot__95_-removebg-preview.png",
      "standing calf raises 3x20":
      "assets/Screenshot__98_-removebg-preview.png",
      "Decline Sit-Ups 3x12": "assets/Screenshot__96_-removebg-preview.png",
      "plank 3": "assets/Screenshot__97_-removebg-preview.png",
    };
    return buildWorkoutGridPage(context, "Bro Split", workouts, exerciseImages);
  }
}
