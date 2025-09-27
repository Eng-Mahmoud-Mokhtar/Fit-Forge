import 'package:flutter/cupertino.dart';

import '../WorkoutPage.dart';

class ArnoldSplitPage extends StatelessWidget {
  const ArnoldSplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = {
      "Day 1\nChest & Back": [
        "Incline Dumbbell Press 3x10",
        "Close Lat Pulldown 3x10",
        "Bench Press 3x10",
        "Seated Row Wide Grip 3x12",
        "Flat Dumbbell 3x12",
        "Single Arm Dumbbell Rows 3x10",
      ],
      "Day 2\nShoulders & Arms": [
        "Shoulder Press Machine 3x10",
        "Seated Lateral Raises 3x12",
        "Cable Rear Delt Fly 3x10",
        "Dumbbell Preacher Curl 3x10",
        "Incline Biceps Curl 3x12",
        "Dumbbell Skull crusher 3x12",
        "rope tricep pushdown 3x8",
      ],
      "Day 3\nRest": ["Rest"],
      "Day 4\nChest & Back": [
        "chest fly machine 3x10",
        "Bent over row close grip 3x12",
        "Incline Chest Press 3x10",
        "Straight arm pulldown 3x10",
        "Flat Dumbbell Press 3x10",
        "unilateral steated row 3x10",
      ],
      "Day 5\nShoulders & Arms": [
        "Cable Lateral Raise 3x12",
        "Dumbbell spider curl 3x12",
        "cable front raises 3x12",
        "Cable Rear Delt 3x10",
        "barbell skull crusher 3x10",
        "Dumbbell BI Curl 3x10",
        "Cable Rear 3x12",
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
      "Incline Dumbbell Press 3x10":
      "assets/INCLINE_DUMBBELL_PRESS-removebg-preview.png",
      "Close Lat Pulldown 3x10":
      "assets/Close_Grip_Lat_Pulldown_workout_for_v_shaped_back-removebg-preview.png",
      "Bench Press 3x10":
      "assets/11_Barbell_Chest_Exercises_With_or_Without_Bench-removebg-preview.png",
      "Seated Row Wide Grip 3x12":
      "assets/Screenshot__81_-removebg-preview.png",
      "Flat Dumbbell 3x12":
      "assets/The_16_Best_Chest_Exercises___Workouts_To_Get_Big___Strong-removebg-preview.png",
      "Single Arm Dumbbell Rows 3x10":
      "assets/Screenshot__82_-removebg-preview.png",
      "Shoulder Press Machine 3x10":
      "assets/Screenshot__83_-removebg-preview.png",
      "Seated Lateral Raises 3x12":
      "assets/Screenshot__84_-removebg-preview.png",
      "Cable Rear Delt Fly 3x10": "assets/43562115-removebg-preview.png",
      "Dumbbell Preacher Curl 3x10":
      "assets/Screenshot__89_-removebg-preview.png",
      "Incline Biceps Curl 3x12": "assets/Screenshot__87_-removebg-preview.png",
      "Dumbbell Skull crusher 3x12":
      "assets/Screenshot__88_-removebg-preview.png",
      "rope tricep pushdown 3x8": "assets/Screenshot__90_-removebg-preview.png",
      "chest fly machine 3x10":
      "assets/450134b5-17d0-4a9b-be09-bd3dffe46760-removebg-preview.png",
      "Bent over row close grip 3x12":
      "assets/Screenshot__102_-removebg-preview.png",
      "Incline Chest Press 3x10":
      "assets/INCLINE_DUMBBELL_PRESS-removebg-preview.png",
      "Straight arm pulldown 3x10":
      "assets/Screenshot__103_-removebg-preview.png",
      "Flat Dumbbell Press 3x10":
      "assets/11_Barbell_Chest_Exercises_With_or_Without_Bench-removebg-preview.png",
      "unilateral steated row 3x10":
      "assets/Screenshot__104_-removebg-preview.png",
      "Cable Lateral Raise 3x12":
      "assets/Screenshot__105_-removebg-preview.png",
      "Dumbbell spider curl 3x12":
      "assets/Screenshot__106_-removebg-preview.png",
      "cable front raises 3x12": "assets/Screenshot__107_-removebg-preview.png",
      "Cable Rear Delt 3x10": "assets/43562115-removebg-preview.png",
      "barbell skull crusher 3x10":
      "assets/Screenshot__109_-removebg-preview.png",
      "Dumbbell BI Curl 3x10": "assets/Screenshot__110_-removebg-preview.png",
      "Cable Rear 3x12": "assets/Screenshot__111_-removebg-preview.png",
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
      "Arnold Split",
      workouts,
      exerciseImages,
    );
  }
}
