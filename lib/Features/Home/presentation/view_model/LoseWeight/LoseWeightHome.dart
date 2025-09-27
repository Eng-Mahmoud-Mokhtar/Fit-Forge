import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'More.dart';
import 'NutritionPage.dart';
import '../../../../Workouts/presentation/view_model/views/WorkoutPage.dart';

class LoseWeightHomePage extends StatefulWidget {
  const LoseWeightHomePage({super.key});

  @override
  State<LoseWeightHomePage> createState() => _LoseWeightHomePageState();
}

class _LoseWeightHomePageState extends State<LoseWeightHomePage> {
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
  Map<String, dynamic> _losingNeeds = {};
  double _losingPotentialScore = 0.0;
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
    _calculateLosingRequirements();
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

  void _calculateLosingPotential() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _height = double.parse(_heightController.text);
      _weight = double.parse(_weightController.text);
      _age = int.parse(_ageController.text);

      _calculateNutritionalNeeds();
      _saveData();

      double bmi = _weight / ((_height / 100) * (_height / 100));
      double bmiScore = _calculateBMIScore(bmi) * 0.45;
      double ageScore = _calculateAgeScore() * 0.35;
      double genderScore = _gender == 'Male' ? 10.0 : 9.0;
      genderScore *= 0.20;
      double score = (bmiScore + ageScore + genderScore) * 10;
      String category = _getPotentialCategory(score);
      var healthResult = _getHealthAdvice(bmi, _height, _weight);

      setState(() {
        _losingPotentialScore = score.roundToDouble();
        _potentialCategory = category;
        _healthAdvice = healthResult['advice']!;
        _deviationMessage = healthResult['deviation']!;
        _showResults = true;
        _formSubmitted = true;
      });
    }
  }

  double _calculateBMIScore(double bmi) {
    double idealLow = 18;
    double idealHigh = 25;
    if (bmi >= idealLow && bmi <= idealHigh) {
      return 10;
    }
    double optimalBmi = (idealLow + idealHigh) / 2;
    double deviation = (bmi - optimalBmi).abs();
    double maxDeviation = 20.0;
    double score = 100 - (deviation / maxDeviation * 100);
    return (score / 10).clamp(0, 10).roundToDouble();
  }

  double _calculateAgeScore() {
    if (_age >= 18 && _age <= 25) return 10;
    if (_age >= 26 && _age <= 30) return 9;
    if (_age >= 31 && _age <= 35) return 8;
    if (_age >= 36 && _age <= 40) return 7;
    if (_age >= 16 && _age <= 17) return 8;
    if (_age >= 41 && _age <= 50) return 6;
    if (_age >= 51 && _age <= 60) return 4;
    return 2;
  }

  String _getPotentialCategory(double score) {
    if (score >= 95) return 'excellent';
    if (score >= 90) return 'near ideal';
    if (score >= 80) return 'slightly off';
    if (score >= 70) return 'needs adjustment';
    if (score >= 60) return ' health risks';
    if (score >= 50) return 'significant risks';
    return 'urgent action';
  }

  Map<String, String> _getHealthAdvice(double bmi, double height, double weight) {
    double heightInMeters = height / 100;
    double minIdealWeight = 18 * (heightInMeters * heightInMeters);
    double maxIdealWeight = 25 * (heightInMeters * heightInMeters);

    String deviation = '';
    String advice = '';

    if (bmi < 16) {
      double weightNeeded = minIdealWeight - weight;
      deviation = '${weightNeeded.round()} kg below ideal';
      advice = 'Dangerously thin (BMI ${bmi.toStringAsFixed(1)}/10)! Risk of organ damage. Gain weight safely; see a doctor!';
    } else if (bmi >= 16 && bmi < 18) {
      double weightNeeded = minIdealWeight - weight;
      deviation = '${weightNeeded.round()} kg below ideal';
      advice = 'Too thin (BMI ${bmi.toStringAsFixed(1)}/10)! Health risks. Build muscle, avoid weight loss; get guidance!';
    } else if (bmi >= 18 && bmi <= 25) {
      deviation = 'Ideal weight';
      advice = 'Perfect (BMI ${bmi.toStringAsFixed(1)}/10)! Maintain with diet and exercise. Stay motivated!';
    } else if (bmi > 25 && bmi <= 30) {
      double excessWeight = weight - maxIdealWeight;
      deviation = '${excessWeight.round()} kg above ideal';
      advice = 'Overweight (BMI ${bmi.toStringAsFixed(1)}/10)! Heart risks. Use 500-cal deficit, cardio; stay focused!';
    } else if (bmi > 30 && bmi <= 35) {
      double excessWeight = weight - maxIdealWeight;
      deviation = '${excessWeight.round()} kg above ideal';
      advice = 'Obese (BMI ${bmi.toStringAsFixed(1)}/10)! Diabetes risk. Use 500-750 cal deficit; consult doctor!';
    } else {
      double excessWeight = weight - maxIdealWeight;
      deviation = '${excessWeight.round()} kg above ideal';
      advice = 'Severely obese (BMI ${bmi.toStringAsFixed(1)}/10)! Urgent risks. 500-1000 cal deficit with doctor plan!';
    }
    return {'deviation': deviation, 'advice': advice};
  }

  Color _getScoreColor(double score) {
    if (score >= 95) return Colors.greenAccent.shade400;
    if (score >= 90) return Colors.greenAccent;
    if (score >= 80) return Colors.yellow.shade200;
    if (score >= 70) return Colors.yellow.shade600;
    if (score >= 60) return Colors.orange.shade500;
    if (score >= 50) return Colors.orange.shade700;
    return Colors.red.shade600;
  }

  String _getAssessmentTitle(double score) {
    return _getPotentialCategory(score);
  }

  void _calculateLosingRequirements() {
    double tdee = _naturalNeeds['calories']?.toDouble() ?? 0;
    double deficit = 500;
    double loseCalories = tdee - deficit;

    double protein = _weight * 2.2;
    double proteinCalories = protein * 4;
    double fatCalories = loseCalories * 0.25;
    double fat = fatCalories / 9;
    double remainingCalories = loseCalories - proteinCalories - fatCalories;
    double carbs = remainingCalories / 4;
    double water = _weight * 0.04;

    setState(() {
      _losingNeeds = {
        'calories': loseCalories.roundToDouble(),
        'protein': protein.roundToDouble(),
        'carbs': carbs.roundToDouble(),
        'fat': fat.roundToDouble(),
        'water': water.roundToDouble(),
        'deficit': deficit.roundToDouble(),
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
        onCalculate: _calculateLosingPotential,
        showResults: _showResults,
        bulkingPotentialScore: _losingPotentialScore,
        potentialCategory: _potentialCategory,
        healthAdvice: _healthAdvice,
        deviationMessage: _deviationMessage,
        naturalNeeds: _naturalNeeds,
        bulkingNeeds: _losingNeeds,
        getScoreColor: _getScoreColor,
        getAssessmentTitle: _getAssessmentTitle,
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
        bulkingNeeds: _losingNeeds,
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