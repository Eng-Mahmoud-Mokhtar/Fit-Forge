import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'More.dart';
import 'NutritionPage.dart';
import '../../../../Workouts/presentation/view_model/views/WorkoutPage.dart';

class BuildMuscleHomePage extends StatefulWidget {
  const BuildMuscleHomePage({super.key});

  @override
  State<BuildMuscleHomePage> createState() => _BuildMuscleHomePageState();
}

class _BuildMuscleHomePageState extends State<BuildMuscleHomePage> {
  int _selectedIndex = 0;
  bool _showResults = false;
  bool _formSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  double _height = 175;
  double _weight = 75;
  int _age = 25;
  String _gender = 'Male';
  Map<String, dynamic> _naturalNeeds = {};
  Map<String, dynamic> _bulkingNeeds = {};
  double _bulkingPotentialScore = 0.0;
  String _potentialCategory = '';
  String _healthAdvice = '';
  String _deviationMessage = '';
  final List<String> _genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _height = prefs.getDouble('height') ?? 175;
      _weight = prefs.getDouble('weight') ?? 75;
      _age = prefs.getInt('age') ?? 25;
      _gender = prefs.getString('gender') ?? 'Male';
      _heightController.text = _height.toString();
      _weightController.text = _weight.toString();
      _ageController.text = _age.toString();
      _calculateNutritionalNeeds();
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('height', _height);
    prefs.setDouble('weight', _weight);
    prefs.setInt('age', _age);
    prefs.setString('gender', _gender);
  }

  void _resetForm() {
    setState(() {
      _showResults = false;
      _formSubmitted = false;
    });
  }

  void _calculateNutritionalNeeds() {
    _calculateNaturalNeeds();
    _calculateBulkingRequirements();
  }

  void _calculateNaturalNeeds() {
    double bmr = _calculateBMR();
    double tdee = _calculateTDEE(bmr);

    double proteinMultiplier = 1.8;
    double protein = _weight * proteinMultiplier;

    double fatCalories = tdee * 0.25;
    double fat = fatCalories / 9;

    double proteinCalories = protein * 4;
    double remainingCalories = tdee - proteinCalories - fatCalories;
    double carbs = remainingCalories / 4;

    double water = _weight * 0.035;

    setState(() {
      _naturalNeeds = {
        'calories': tdee.roundToDouble(),
        'protein': protein.roundToDouble(),
        'carbs': carbs.roundToDouble(),
        'fat': fat.roundToDouble(),
        'water': water.roundToDouble(),
        'bmr': bmr.roundToDouble(),
      };
    });
  }

  double _calculateBMR() {
    if (_gender == 'Male') {
      return 10 * _weight + 6.25 * _height - 5 * _age + 5;
    } else {
      return 10 * _weight + 6.25 * _height - 5 * _age - 161;
    }
  }

  double _calculateTDEE(double bmr) {
    return bmr * 1.5;
  }

  void _calculateBulkingPotential() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _height = double.parse(_heightController.text);
      _weight = double.parse(_weightController.text);
      _age = int.parse(_ageController.text);

      _calculateNutritionalNeeds();
      _saveData();

      double score = 0.0;
      double bmi = _weight / ((_height / 100) * (_height / 100));
      double bmiScore = _calculateBMIScore(bmi) * 0.45;
      double ageScore = _calculateAgeScore() * 0.35;
      double genderScore = _gender == 'Male' ? 10.0 : 9.0;
      genderScore *= 0.20;
      score = (bmiScore + ageScore + genderScore) * 10;
      String category = _getPotentialCategory(score);
      var healthResult = _getHealthAdvice(bmi, _height, _weight);

      setState(() {
        _bulkingPotentialScore = score.clamp(0, 100).toDouble();
        _potentialCategory = category;
        _healthAdvice = healthResult['advice']!;
        _deviationMessage = healthResult['deviation']!;
        _showResults = true;
        _formSubmitted = true;
      });
    }
  }

  double _calculateBMIScore(double bmi) {
    if (bmi >= 18.5 && bmi <= 24.9) return 10.0;
    if (bmi >= 25 && bmi <= 26.5) return 9.0;
    if (bmi >= 26.6 && bmi <= 28) return 8.0;
    if (bmi >= 17 && bmi < 18.5) return 7.5;
    if (bmi >= 28.1 && bmi <= 30) return 6.5;
    if (bmi > 30 && bmi <= 35) return 5.0;
    if (bmi < 17) return 4.0;
    return 3.0;
  }

  double _calculateAgeScore() {
    if (_age >= 18 && _age <= 25) return 10.0;
    if (_age >= 26 && _age <= 30) return 9.5;
    if (_age >= 31 && _age <= 35) return 8.5;
    if (_age >= 36 && _age <= 40) return 7.5;
    if (_age >= 16 && _age <= 17) return 8.0;
    if (_age >= 41 && _age <= 50) return 6.0;
    if (_age >= 51 && _age <= 60) return 4.0;
    return 2.5;
  }

  String _getPotentialCategory(double score) {
    if (score >= 95) return 'Perfect for muscle';
    if (score >= 90) return 'Great for muscle';
    if (score >= 80) return 'Good for muscle';
    if (score >= 70) return 'Average build';
    if (score >= 60) return 'Lean, needs mass';
    if (score >= 50) return 'Heavy, adjust needed';
    return 'Needs improvement';
  }

  Map<String, String> _getHealthAdvice(double bmi, double height, double weight) {
    double heightInMeters = height / 100;
    double minIdealWeight = 18.5 * (heightInMeters * heightInMeters);
    double maxIdealWeight = 24.9 * (heightInMeters * heightInMeters);

    String deviation = '';
    String advice = '';

    if (bmi >= 30) {
      double excessWeight = weight - maxIdealWeight;
      deviation =
      'Your weight is ${excessWeight.toStringAsFixed(1)} kg above the ideal range';
      advice =
      'High BMI (${bmi.toStringAsFixed(1)}). Reduce body fat with strength training for better results.';
    } else if (bmi >= 25) {
      double excessWeight = weight - maxIdealWeight;
      deviation =
      'Your weight is ${excessWeight.toStringAsFixed(1)} kg above the ideal range';
      advice =
      'Slightly high BMI (${bmi.toStringAsFixed(1)}). Focus on clean muscle gain with a balanced diet.';
    } else if (bmi < 18.5) {
      double weightNeeded = minIdealWeight - weight;
      deviation =
      'Your weight is ${weightNeeded.toStringAsFixed(1)} kg below the ideal range';
      advice =
      'Low BMI (${bmi.toStringAsFixed(1)}). Increase calories with training for healthy muscle gain.';
    } else {
      deviation = 'Your weight is within the ideal range';
      advice =
      'Ideal BMI (${bmi.toStringAsFixed(1)}). Maintain training and nutrition for optimal muscle growth.';
    }
    return {'deviation': deviation, 'advice': advice};
  }

  Color _getScoreColor(double score) {
    if (score >= 95) return Colors.greenAccent.shade400;
    if (score >= 90) return Colors.greenAccent;
    if (score >= 85) return Colors.yellow.shade200;
    if (score >= 80) return Colors.yellow.shade600;
    if (score >= 75) return Colors.orange.shade500;
    if (score >= 60) return Colors.orange.shade700;
    return Colors.red.shade600;
  }

  String _getAssessmentTitle(double score) {
    return _getPotentialCategory(score);
  }

  String _getAssessmentDescription(double score) {
    String category = _getPotentialCategory(score);
    Map<String, String> descriptions = {
      'Your body is perfect for muscle building':
      'Your body is in prime condition for rapid muscle growth! Continue with regular training and progressive overload.',
      'Your body is great for muscle building':
      'You have great potential for muscle gain! Stick to proper nutrition and training for excellent results.',
      'Your body is good for muscle building':
      'Your body has a solid foundation! With consistent strength training and nutrition, you’ll reach your goals.',
      'Your body is average for muscle building':
      'Your body has decent potential! Improve your diet and training for noticeable progress.',
      'Your body is lean and needs mass gain':
      'Your body is lean and needs mass! Focus on increasing calories and strength training to build muscle.',
      'Your body is heavy and needs adjustment':
      'Your body needs fat reduction! Start with a balanced diet and training to improve body composition.',
      'Your body needs initial improvement':
      'Your body needs improvement! Consult a nutrition and fitness expert for a tailored plan.',
    };
    return descriptions[category] ?? 'Consult an expert for guidance.';
  }

  void _calculateBulkingRequirements() {
    double tdee = _naturalNeeds['calories']?.toDouble() ?? 0;
    double surplus = 500;
    double bulkCalories = tdee + surplus;

    double protein = _weight * 2.0;
    double proteinCalories = protein * 4;
    double fatCalories = bulkCalories * 0.25;
    double fat = fatCalories / 9;
    double remainingCalories = bulkCalories - proteinCalories - fatCalories;
    double carbs = remainingCalories / 4;
    double water = _weight * 0.04;

    setState(() {
      _bulkingNeeds = {
        'calories': bulkCalories.roundToDouble(),
        'protein': protein.roundToDouble(),
        'carbs': carbs.roundToDouble(),
        'fat': fat.roundToDouble(),
        'water': water.roundToDouble(),
        'surplus': surplus.roundToDouble(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<Widget> _pages = [
      HomePage(
        formSubmitted: _formSubmitted,
        formKey: _formKey,
        heightController: _heightController,
        weightController: _weightController,
        ageController: _ageController,
        gender: _gender,
        genders: _genders,
        onGenderChanged: (value) {
          setState(() {
            _gender = value!;
            _calculateNutritionalNeeds();
            _saveData();
          });
        },
        onCalculate: _calculateBulkingPotential,
        showResults: _showResults,
        bulkingPotentialScore: _bulkingPotentialScore,
        potentialCategory: _potentialCategory,
        healthAdvice: _healthAdvice,
        deviationMessage: _deviationMessage,
        naturalNeeds: _naturalNeeds,
        bulkingNeeds: _bulkingNeeds,
        getScoreColor: _getScoreColor,
        getAssessmentTitle: _getAssessmentTitle,
        getAssessmentDescription: _getAssessmentDescription,
        onNavigate: (index) => setState(() => _selectedIndex = index),
        onReset: _resetForm,
      ),
      WorkoutsPage(),
      NutritionPage(
        weight: _weight,
        height: _height,
        age: _age,
        gender: _gender,
        naturalNeeds: _naturalNeeds,
        bulkingNeeds: _bulkingNeeds,
      ),
      More(),
    ];

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF111827), Color(0xFF1f2937)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: _pages[_selectedIndex]),
      ),
      bottomNavigationBar: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(0xFF111827),
          border: Border(
            top: BorderSide(
              color: Color(0xFF6b7280).withOpacity(0.3),
              width: screenWidth * 0.002,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Color(0xFF3b82f6),
          unselectedItemColor: Colors.white54,
          selectedFontSize: screenWidth * 0.03,
          unselectedFontSize: screenWidth * 0.03,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: screenWidth * 0.05),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department, size: screenWidth * 0.05),
              label: 'Workouts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant, size: screenWidth * 0.05),
              label: 'Nutrition',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: screenWidth * 0.05),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
