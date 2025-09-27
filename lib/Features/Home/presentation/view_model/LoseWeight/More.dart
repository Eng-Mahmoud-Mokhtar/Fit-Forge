import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  final Map<int, bool> _expandedStates = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF111827), Color(0xFF1f2937)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(screenWidth * 0.03),
          children: [
            _buildSection(
              context,
              "Introduction to Weight Loss",
              [
                TextSpan(
                  text: "Healthy weight loss is a strategic process ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "aimed at reducing body fat while preserving muscle mass through a controlled caloric deficit, balanced nutrition, and regular physical activity. The goal ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "is sustainable fat loss ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "without compromising health. Success depends ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "on consistency, patience, and a holistic approach ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to diet, exercise, and lifestyle changes. Start by setting ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "realistic goals ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and tracking progress through weight, measurements, or energy levels.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.info,
              const Color(0xFF3B82F6),
              screenWidth,
              screenHeight,
              0,
            ),
            _buildSection(
              context,
              "Nutrition Fundamentals",
              [
                TextSpan(
                  text: "Maintain a caloric deficit ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "of 300–500 kcal daily to promote fat loss while minimizing muscle loss. Prioritize high protein intake ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 1.8–2.2 g per kg of body weight ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to preserve muscle, using sources like lean meats, fish, eggs, tofu, or legumes. Choose high-fiber carbohydrates ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "(whole grains, vegetables, fruits) ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 2–4 g/kg body weight to support energy and satiety. Include moderate healthy fats ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "from avocados, nuts, olive oil, or fatty fish ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 0.5–0.8 g/kg to maintain hormone health. Eat 4–5 smaller meals daily ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to control hunger ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and stabilize blood sugar. Stay hydrated ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with 2–3 liters of water daily ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to support metabolism and appetite control. Focus on nutrient-dense foods ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like leafy greens, berries, and lean proteins ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to meet micronutrient needs.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.restaurant_menu,
              const Color(0xFFF87171),
              screenWidth,
              screenHeight,
              1,
            ),
            _buildSection(
              context,
              "Training Blueprint",
              [
                TextSpan(
                  text: "Combine strength training and cardio ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to burn calories and preserve muscle mass. Focus on compound movements ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like squats, lunges, push-ups, rows, and deadlifts ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for efficient calorie burn and muscle maintenance. Aim for 8–12 reps ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to build strength ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and include 2–3 strength sessions weekly. Add cardio ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like brisk walking, cycling, or HIIT for 20–30 minutes, 2–3 times weekly ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to increase calorie expenditure. Maintain proper form ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to prevent injuries ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and optimize results. Rest appropriately ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with 60–90 seconds between strength sets ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and include dynamic warm-ups ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to prepare muscles and joints ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for exercise.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.fitness_center,
              const Color(0xFFFBBF24),
              screenWidth,
              screenHeight,
              2,
            ),
            _buildSection(
              context,
              "Recovery & Rest",
              [
                TextSpan(
                  text: "Aim for 7–9 hours of sleep ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "nightly to support metabolism and appetite regulation. Use active recovery ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with low-intensity activities like walking or yoga ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to improve circulation and reduce soreness. Manage stress ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "through mindfulness, meditation, or deep breathing ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to control cortisol, which can hinder weight loss. Schedule rest days ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "2–3 times weekly ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to allow muscle recovery and prevent burnout. Incorporate stretching ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "or foam rolling ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to improve flexibility and reduce injury risk. Consume a post-workout meal ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with protein and moderate carbs within 1–2 hours ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to support muscle recovery.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.nightlight_round,
              const Color(0xFF60A5FA),
              screenWidth,
              screenHeight,
              3,
            ),
            _buildSection(
              context,
              "Supplements Guide",
              [
                TextSpan(
                  text: "Consider whey protein ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to meet protein needs conveniently, especially post-workout with 20–30 g per serving. Avoid high-calorie supplements ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like mass gainers ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to stay within your caloric deficit. Use omega-3 fish oil ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 1–2 g EPA/DHA daily ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to reduce inflammation and support heart health. Supplement with vitamin D ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "if sunlight exposure is low ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to support metabolism and bone health. Consider a multivitamin ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to fill nutrient gaps ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "but prioritize whole foods for most nutrients.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.medical_services,
              const Color(0xFF34D399),
              screenWidth,
              screenHeight,
              4,
            ),
            _buildSection(
              context,
              "Advanced Techniques",
              [
                TextSpan(
                  text: "Track macros diligently ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "using apps to ensure adherence to your caloric deficit and nutrient goals. Incorporate meal prepping ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to control portions and avoid unplanned eating ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ". Monitor body composition ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with measurements, photos, or scales ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to track fat loss vs. muscle retention. Use circuit training ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to combine strength and cardio ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for efficient calorie burn. Practice mindful eating ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to recognize hunger and fullness cues ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and avoid emotional eating. Adjust calorie intake ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "every 2–4 weeks based on progress ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to prevent plateaus.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.trending_up,
              const Color(0xFFA855F7),
              screenWidth,
              screenHeight,
              5,
            ),
            _buildSection(
              context,
              "Common Pitfalls to Avoid",
              [
                TextSpan(
                  text: "Avoid extreme calorie cuts ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "below 1200–1500 kcal daily, as they can lead to muscle loss and nutrient deficiencies. Don’t skip meals ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as this can trigger overeating ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "or slow metabolism. Avoid over-relying on supplements ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "instead of whole foods ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for nutrition. Don’t overdo cardio ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as excessive sessions can burn muscle ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "instead of fat. Track progress consistently ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with weight, measurements, or photos ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to stay motivated. Stay patient ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as sustainable weight loss is gradual ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 0.5–1 kg per week.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.warning_amber_rounded,
              const Color(0xFFF43F5E),
              screenWidth,
              screenHeight,
              6,
            ),
            _buildSection(
              context,
              "Conclusion & Next Steps",
              [
                TextSpan(
                  text: "Healthy weight loss requires sustained effort ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "in nutrition, exercise, and lifestyle changes. Begin with a moderate caloric deficit ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ", balanced diet, and regular activity ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ". Progress to advanced strategies ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like macro tracking and circuit training ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as you build consistency. Monitor progress weekly ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "using weight, measurements, or energy levels ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and adjust your plan as needed. Stay patient and consistent ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for long-term success ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ". Consult a dietitian or coach ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for personalized advice ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to optimize your weight loss journey.",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ],
              Icons.check_circle,
              const Color(0xFF3B82F6),
              screenWidth,
              screenHeight,
              7,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context,
      String title,
      List<TextSpan> contentSpans,
      IconData icon,
      Color color,
      double screenWidth,
      double screenHeight,
      int index,
      ) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 600 + index * 100),
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600 + index * 100),
        transform: Matrix4.translationValues(0, _isVisible ? 0 : 20, 0),
        width: screenWidth,
        margin: EdgeInsets.only(bottom: screenHeight * 0.01),
        child: Card(
          color: const Color(0xFF2D3748).withOpacity(0.85),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              leading: Icon(
                icon,
                color: color,
                size: screenWidth * 0.07,
              ),
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.035,
                ),
              ),
              trailing: AnimatedRotation(
                turns: _expandedStates[index] == true ? 0.5 : 0,
                duration: const Duration(milliseconds: 400),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white.withOpacity(0.7),
                  size: screenWidth * 0.05,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _expandedStates[index] = expanded;
                });
              },
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B5563).withOpacity(0.9),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(screenWidth * 0.05),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white70,
                        height: 1.6,
                      ),
                      children: contentSpans,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}