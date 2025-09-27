import 'package:flutter/cupertino.dart';
import '../WorkoutPage.dart';

class PushPullLegsPage extends StatelessWidget {
  const PushPullLegsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = {
      "Day 1\nPush\n(Chest, Shoulders, Triceps)": [
        "Flat Bench Press 4x8",
        "Incline Dumbbell Press 4x10",
        "Overhead Press (Barbell) 3x8",
        "Dumbbell Lateral Raises 3x12",
        "Triceps Rope Pushdowns 3x12",
      ],
      "Day 2\nPull\n(Back, Biceps, Rear Delts)": [
        "Conventional Deadlift 4x5",
        "Pull-Ups (Weighted if possible) 4x8",
        "One Arm Dumbbell Row 3x10",
        "Cable Rear 3x15",
        "EZ Bar Curls 3x12",
      ],
      "Day 3\nRest": ["Rest"],
      "Day 4\nPush\n(Chest, Shoulders, Triceps)": [
        "Incline Barbell Press 4x8",
        "Dumbbell Shoulder Press 4x10",
        "Chest Fly Machine 3x12",
        "Arnold Press 3x10",
        "Skull Crushers 3x12",
      ],
      "Day 5\nPull\n(Back, Biceps, Rear Delts)": [
        "Barbell Rows 4x8",
        "Lat Pulldowns 4x10",
        "Seated Cable Rows 3x12",
        "Dumbbell Shrugs 3x15",
        "Incline Dumbbell Curls 3x12",
      ],
      "Day 6\nLegs\n(Quads, Hamstrings, Calves)": [
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
      "Flat Bench Press 4x8":
          "assets/11_Barbell_Chest_Exercises_With_or_Without_Bench-removebg-preview.png",
      "Incline Dumbbell Press 4x10":
          "assets/INCLINE_DUMBBELL_PRESS-removebg-preview.png",
      "Overhead Press (Barbell) 3x8":
          "assets/Screenshot__114_-removebg-preview.png",
      "Dumbbell Lateral Raises 3x12":
          "assets/Screenshot__84_-removebg-preview.png",
      "Triceps Rope Pushdowns 3x12":
          "assets/Screenshot__90_-removebg-preview.png",
      "Conventional Deadlift 4x5":
          "assets/Screenshot__131_-removebg-preview.png",
      "Pull-Ups (Weighted if possible) 4x8":
          "assets/Screenshot__116_-removebg-preview.png",
      "One Arm Dumbbell Row 3x10":
          "assets/Screenshot__82_-removebg-preview.png",
      "Cable Rear 3x15": "assets/Screenshot__111_-removebg-preview.png",
      "EZ Bar Curls 3x12": "assets/EZ Bar Curl Anatomy Illustration.png",
      "Incline Barbell Press 4x8":
          "assets/Screenshot__117_-removebg-preview.png",
      "Dumbbell Shoulder Press 4x10":
          "assets/Screenshot__118_-removebg-preview.png",
      "Chest Fly Machine 3x12":
          "assets/450134b5-17d0-4a9b-be09-bd3dffe46760-removebg-preview.png",
      "Arnold Press 3x10":
          "assets/ChatGPT_Image_Sep_24__2025__06_52_51_AM-removebg-preview.png",
      "Skull Crushers 3x12": "assets/Screenshot__88_-removebg-preview.png",
      "Barbell Rows 4x8": "assets/Screenshot__119_-removebg-preview.png",
      "Lat Pulldowns 4x10": "assets/Screenshot__120_-removebg-preview.png",
      "Seated Cable Rows 3x12": "assets/Screenshot__121_-removebg-preview.png",
      "Dumbbell Shrugs 3x15": "assets/Screenshot__122_-removebg-preview.png",
      "Incline Dumbbell Curls 3x12":
          "assets/Screenshot__87_-removebg-preview.png",
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
    return buildWorkoutGridPage(
      context,
      "Push Pull Legs",
      workouts,
      exerciseImages,
    );
  }
}
