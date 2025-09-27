import 'package:flutter/material.dart';
import 'dart:math' as math;

class NutritionPage extends StatelessWidget {
  final double weight;
  final double height;
  final int age;
  final String gender;
  final Map<String, dynamic> naturalNeeds;
  final Map<String, dynamic> bulkingNeeds;

  const NutritionPage({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.naturalNeeds,
    required this.bulkingNeeds,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Map<String, dynamic> displayedNeeds = bulkingNeeds.isNotEmpty
        ? bulkingNeeds
        : naturalNeeds;

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrition Plan',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth,
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff3b76f6), Color(0xff5c10a6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: screenWidth * 0.025,
                  offset: Offset(0, screenWidth * 0.01),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      color: Colors.white,
                      size: screenWidth * 0.06,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "Your body’s weight loss needs",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildNutritionItem(
                  'Protein',
                  '${displayedNeeds['protein']?.toStringAsFixed(1) ?? '0'} g',
                  'Preserves muscle during deficit',
                  Icons.fitness_center,
                  screenWidth,
                  screenHeight,
                ),
                _buildNutritionItem(
                  'Carbohydrates',
                  '${displayedNeeds['carbs']?.toStringAsFixed(1) ?? '0'} g',
                  'Energy for workouts and recovery',
                  Icons.energy_savings_leaf,
                  screenWidth,
                  screenHeight,
                ),
                _buildNutritionItem(
                  'Fat',
                  '${displayedNeeds['fat']?.toStringAsFixed(1) ?? '0'} g',
                  'Essential for hormones and health',
                  Icons.water_drop,
                  screenWidth,
                  screenHeight,
                ),
                _buildNutritionItem(
                  'Calories',
                  '${displayedNeeds['calories']?.toStringAsFixed(0) ?? '0'} kcal',
                  'Daily energy with deficit',
                  Icons.local_fire_department,
                  screenWidth,
                  screenHeight,
                ),
                _buildNutritionItem(
                  'Water',
                  '${displayedNeeds['water']?.toStringAsFixed(1) ?? '2'} L',
                  'Hydration and metabolism',
                  Icons.water_drop,
                  screenWidth,
                  screenHeight,
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Food Sources Reference',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          _FoodSourceTable(
            title: 'High Protein Foods',
            foods: [
              {
                'name': 'Chicken Breast',
                'weight': '100g',
                'protein': '31g',
                'calories': '165',
              },
              {
                'name': 'Lean Beef',
                'weight': '100g',
                'protein': '26g',
                'calories': '180',
              },
              {
                'name': 'Salmon',
                'weight': '100g',
                'protein': '25g',
                'calories': '208',
              },
              {
                'name': 'Tuna',
                'weight': '100g',
                'protein': '30g',
                'calories': '132',
              },
              {
                'name': 'Eggs',
                'weight': '2 large',
                'protein': '12g',
                'calories': '156',
              },
              {
                'name': 'Greek Yogurt',
                'weight': '200g',
                'protein': '20g',
                'calories': '118',
              },
              {
                'name': 'Cottage Cheese',
                'weight': '100g',
                'protein': '11g',
                'calories': '98',
              },
              {
                'name': 'Lentils',
                'weight': '100g cooked',
                'protein': '9g',
                'calories': '116',
              },
              {
                'name': 'Chickpeas',
                'weight': '100g cooked',
                'protein': '9g',
                'calories': '164',
              },
              {
                'name': 'Tofu',
                'weight': '100g',
                'protein': '8g',
                'calories': '76',
              },
              {
                'name': 'Milk',
                'weight': '250ml',
                'protein': '8g',
                'calories': '122',
              },
              {
                'name': 'Almonds',
                'weight': '30g',
                'protein': '6g',
                'calories': '174',
              },
            ],
            icon: Icons.fitness_center,
            color: Color(0xfff66b63),
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          _FoodSourceTable(
            title: 'Carbohydrate Sources',
            foods: [
              {
                'name': 'Brown Rice',
                'weight': '100g cooked',
                'carbs': '23g',
                'calories': '111',
              },
              {
                'name': 'Oats',
                'weight': '100g dry',
                'carbs': '66g',
                'calories': '379',
              },
              {
                'name': 'Sweet Potato',
                'weight': '200g',
                'carbs': '40g',
                'calories': '172',
              },
              {
                'name': 'Quinoa',
                'weight': '100g cooked',
                'carbs': '21g',
                'calories': '120',
              },
              {
                'name': 'Whole Wheat Bread',
                'weight': '2 slices',
                'carbs': '24g',
                'calories': '140',
              },
              {
                'name': 'Banana',
                'weight': '1 large',
                'carbs': '31g',
                'calories': '121',
              },
              {
                'name': 'Pasta',
                'weight': '100g cooked',
                'carbs': '25g',
                'calories': '131',
              },
              {
                'name': 'Potato',
                'weight': '200g',
                'carbs': '38g',
                'calories': '164',
              },
              {
                'name': 'Apple',
                'weight': '1 medium',
                'carbs': '25g',
                'calories': '95',
              },
              {
                'name': 'Orange',
                'weight': '1 large',
                'carbs': '21g',
                'calories': '86',
              },
              {
                'name': 'Corn',
                'weight': '100g',
                'carbs': '19g',
                'calories': '86',
              },
              {
                'name': 'Beans',
                'weight': '100g cooked',
                'carbs': '22g',
                'calories': '132',
              },
            ],
            icon: Icons.energy_savings_leaf,
            color: Color(0xfff4a03f),
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          _FoodSourceTable(
            title: 'Healthy Fat Sources',
            foods: [
              {
                'name': 'Avocado',
                'weight': '100g',
                'fat': '15g',
                'calories': '160',
              },
              {
                'name': 'Almonds',
                'weight': '30g',
                'fat': '15g',
                'calories': '174',
              },
              {
                'name': 'Olive Oil',
                'weight': '1 tbsp',
                'fat': '14g',
                'calories': '119',
              },
              {
                'name': 'Peanut Butter',
                'weight': '2 tbsp',
                'fat': '16g',
                'calories': '190',
              },
              {
                'name': 'Chia Seeds',
                'weight': '28g',
                'fat': '9g',
                'calories': '138',
              },
              {
                'name': 'Walnuts',
                'weight': '30g',
                'fat': '18g',
                'calories': '185',
              },
              {
                'name': 'Flaxseeds',
                'weight': '20g',
                'fat': '9g',
                'calories': '110',
              },
              {
                'name': 'Olives',
                'weight': '50g',
                'fat': '7g',
                'calories': '70',
              },
              {
                'name': 'Dark Chocolate',
                'weight': '28g',
                'fat': '12g',
                'calories': '170',
              },
              {
                'name': 'Coconut Oil',
                'weight': '1 tbsp',
                'fat': '14g',
                'calories': '120',
              },
              {
                'name': 'Sunflower Seeds',
                'weight': '28g',
                'fat': '14g',
                'calories': '164',
              },
              {
                'name': 'Pumpkin Seeds',
                'weight': '28g',
                'fat': '13g',
                'calories': '158',
              },
            ],
            icon: Icons.water_drop,
            color: Color(0xff6a8cff),
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          _FoodSourceTable(
            title: 'Vegetables & Greens',
            foods: [
              {
                'name': 'Broccoli',
                'weight': '100g',
                'carbs': '7g',
                'calories': '34',
              },
              {
                'name': 'Spinach',
                'weight': '100g',
                'carbs': '4g',
                'calories': '23',
              },
              {
                'name': 'Kale',
                'weight': '100g',
                'carbs': '9g',
                'calories': '49',
              },
              {
                'name': 'Bell Peppers',
                'weight': '100g',
                'carbs': '6g',
                'calories': '31',
              },
              {
                'name': 'Carrots',
                'weight': '100g',
                'carbs': '10g',
                'calories': '41',
              },
              {
                'name': 'Cauliflower',
                'weight': '100g',
                'carbs': '5g',
                'calories': '25',
              },
              {
                'name': 'Cabbage',
                'weight': '100g',
                'carbs': '6g',
                'calories': '25',
              },
              {
                'name': 'Tomatoes',
                'weight': '100g',
                'carbs': '4g',
                'calories': '18',
              },
              {
                'name': 'Cucumber',
                'weight': '100g',
                'carbs': '4g',
                'calories': '15',
              },
              {
                'name': 'Zucchini',
                'weight': '100g',
                'carbs': '3g',
                'calories': '17',
              },
              {
                'name': 'Mushrooms',
                'weight': '100g',
                'carbs': '3g',
                'calories': '22',
              },
              {
                'name': 'Lettuce',
                'weight': '100g',
                'carbs': '3g',
                'calories': '15',
              },
            ],
            icon: Icons.eco,
            color: Color(0xFF10b981),
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }

  Widget _buildNutritionItem(
      String title,
      String value,
      String subtitle,
      IconData icon,
      double screenWidth,
      double screenHeight,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white.withOpacity(0.8),
            size: screenWidth * 0.06,
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: screenWidth * 0.03,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
class _FoodSourceTable extends StatefulWidget {
  final String title;
  final List<Map<String, String>> foods;
  final IconData icon;
  final Color color;
  final double screenWidth;
  final double screenHeight;

  const _FoodSourceTable({
    required this.title,
    required this.foods,
    required this.icon,
    required this.color,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  _FoodSourceTableState createState() => _FoodSourceTableState();
}

class _FoodSourceTableState extends State<_FoodSourceTable> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
      margin: EdgeInsets.only(bottom: widget.screenHeight * 0.01),
      child: Card(
        color: Color(0xFF374151),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.screenWidth * 0.04),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(
              horizontal: widget.screenWidth * 0.04,
              vertical: widget.screenHeight * 0.015,
            ),
            leading: Icon(widget.icon, color: widget.color, size: widget.screenWidth * 0.06),
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: widget.screenWidth * 0.035,
              ),
            ),
            trailing: Transform.rotate(
              angle: _isExpanded ? math.pi : 0,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white.withOpacity(0.7),
                size: widget.screenWidth * 0.05,
              ),
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            children: [
              Container(
                padding: EdgeInsets.all(widget.screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Color(0xFF4b5563),
                  borderRadius: BorderRadius.circular(widget.screenWidth * 0.02),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: widget.screenHeight * 0.015,
                          horizontal: widget.screenWidth * 0.02
                      ),
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(widget.screenWidth * 0.02),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Item',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Weight',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.title.contains('Protein')
                                  ? 'Protein'
                                  : widget.title.contains('Carb')
                                  ? 'Carbs'
                                  : widget.title.contains('Fat')
                                  ? 'Fat'
                                  : 'Carbs',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Calories',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: widget.screenHeight * 0.01),
                    ...widget.foods
                        .map(
                          (food) => Container(
                        padding: EdgeInsets.symmetric(
                          vertical: widget.screenHeight * 0.015,
                          horizontal: widget.screenWidth * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                food['name']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                food['weight']!,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: widget.screenWidth * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                food[widget.title.contains('Protein')
                                    ? 'protein'
                                    : widget.title.contains('Carb')
                                    ? 'carbs'
                                    : widget.title.contains('Fat')
                                    ? 'fat'
                                    : 'carbs']!,
                                style: TextStyle(
                                  color: widget.color,
                                  fontSize: widget.screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                food['calories']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}