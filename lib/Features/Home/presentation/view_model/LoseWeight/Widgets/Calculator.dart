import 'package:flutter/material.dart';

class CalculatorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController ageController;
  final String gender;
  final List<String> genders;
  final ValueChanged<String?> onGenderChanged;
  final VoidCallback onCalculate;
  final bool formSubmitted;
  const CalculatorForm({
    super.key,
    required this.formKey,
    required this.heightController,
    required this.weightController,
    required this.ageController,
    required this.gender,
    required this.genders,
    required this.onGenderChanged,
    required this.onCalculate,
    required this.formSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (formSubmitted) return SizedBox.shrink();
    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Color(0xFF3b82f6).withOpacity(0.3),
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forge Your Physique',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              'Unlock your muscle-building potential with precision',
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: screenWidth * 0.03,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required';
                      int? age = int.tryParse(value);
                      if (age == null || age < 15 || age > 80) {
                        return 'Age must be 15-80 years';
                      }
                      return null;
                    },
                    onSaved: (value) => ageController.text = value!,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: gender,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: screenWidth * 0.03,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                    ),
                    dropdownColor: Color(0xFF111827),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                    items: genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: onGenderChanged,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: heightController,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: screenWidth * 0.03,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required';
                      double? height = double.tryParse(value);
                      if (height == null || height < 100 || height > 260) {
                        return 'Height must be 100-260 cm';
                      }
                      return null;
                    },
                    onSaved: (value) => heightController.text = value!,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: TextFormField(
                    controller: weightController,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: screenWidth * 0.03,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white30),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required';
                      double? weight = double.tryParse(value);
                      if (weight == null || weight < 30 || weight > 300) {
                        return 'Weight must be 30-300 kg';
                      }
                      return null;
                    },
                    onSaved: (value) => weightController.text = value!,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                onPressed: onCalculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3b82f6),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
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
