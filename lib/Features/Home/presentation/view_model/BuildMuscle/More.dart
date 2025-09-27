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
              "Introduction to Bulking",
              [
                TextSpan(
                  text: "Bulking is a strategic phase ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "designed to maximize muscle growth through a controlled caloric surplus, paired with structured resistance training and optimal nutrition. The primary goal ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "is to build lean muscle mass ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "while minimizing fat gain. Success hinges ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "on consistency, discipline, and a balanced approach ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to diet, exercise, and recovery. Start by setting ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "realistic goals ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and tracking strength gains and body measurements to adjust based on progress.",
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
                  text: "Achieve a caloric surplus ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "of 200–500 kcal daily to fuel muscle growth without excessive fat gain. Prioritize protein intake ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 1.6–2.2 g per kg of body weight ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to support muscle repair, using sources like chicken, fish, eggs, tofu, or lentils. Incorporate complex carbohydrates ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "(oats, brown rice, sweet potatoes, quinoa) ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 4–6 g/kg body weight to power workouts. Include healthy fats ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "from avocados, nuts, olive oil, or fatty fish ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 0.8–1 g/kg to support hormone production. Spread meals ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "across 4–6 servings daily ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to optimize nutrient absorption. Stay hydrated ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "by drinking 2–3 liters of water daily ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to aid digestion and performance. Focus on nutrient-dense foods ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like leafy greens and berries ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to ensure micronutrient needs are met.",
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
                  text: "Progressive overload is essential ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to stimulate muscle growth by gradually increasing weight, reps, or intensity. Focus on compound movements ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like squats, deadlifts, bench presses, pull-ups, and rows ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for maximum muscle activation. Target 8–12 reps ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for hypertrophy ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with occasional 4–6 rep sets for strength. Train each muscle group ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "2–3 times weekly ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "using splits like push/pull/legs or full-body routines. Maintain proper form ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to prevent injuries ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and maximize effectiveness. Rest appropriately ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with 60–90 seconds for hypertrophy sets ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and 2–3 minutes for heavy lifts. Incorporate dynamic warm-ups ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to prepare muscles and joints ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for training.",
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
                  text: "Prioritize 7–9 hours of sleep ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "nightly to optimize muscle repair and growth hormone release. Engage in active recovery ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with light activities like walking or yoga ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "on rest days to reduce soreness. Manage stress levels ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "through mindfulness, meditation, or deep breathing ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to keep cortisol in check. Schedule deload periods ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "every 6–10 weeks ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with lighter training to prevent burnout. Incorporate mobility work ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like stretching or foam rolling ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to maintain flexibility and prevent injuries. Consume a post-workout meal ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with protein and carbs within 1–2 hours ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to aid recovery.",
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
                  text: "Use whey protein ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for a convenient way to meet protein needs, especially post-workout with 20–30 g per serving. Take creatine monohydrate ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 3–5 g daily ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to boost strength and muscle volume. Consider BCAAs ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for fasted training or recovery ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "though they’re not essential if protein intake is adequate. Incorporate omega-3 fish oil ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "at 1–2 g EPA/DHA daily ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to support joint health and reduce inflammation. Supplement with vitamin D ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "if sunlight exposure is limited ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to support bone health and testosterone. Use a multivitamin ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to cover micronutrient gaps ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "but prioritize whole foods first.",
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
                  text: "Track macros precisely ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "using apps to monitor calories and macronutrients for optimal results. Implement training periodization ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "by cycling between hypertrophy (8–12 reps), strength (4–6 reps), and endurance (12–15 reps) ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "every 4–8 weeks. Monitor body composition ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "with calipers, DEXA scans, or progress photos ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to track muscle vs. fat gain. Focus on lean bulking ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to avoid excessive fat gain ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "targeting 0.5–1% body weight gain monthly. Use intra-workout carbs ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for sessions longer than 90 minutes ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to sustain energy. Incorporate supersets ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "by pairing exercises (e.g., bicep curls with tricep extensions) ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to increase intensity and save time.",
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
                  text: "Avoid overeating ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to prevent excessive fat gain; stick to a controlled caloric surplus. Don’t skip recovery ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "—poor sleep or inadequate rest days ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "impair muscle growth and increase injury risk. Don’t over-rely on supplements ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as they’re secondary ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to a solid diet and training plan. Maintain proper form ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to avoid injuries ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and ensure exercise effectiveness. Track progress consistently ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "by monitoring weight, strength, and body measurements ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to adjust your plan. Stay patient ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as muscle growth is gradual ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and requires sustained effort.",
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
                  text: "Bulking requires long-term commitment ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "to consistent nutrition, training, and recovery. Start with the basics ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ": a slight caloric surplus, progressive overload, and adequate rest ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ". Progress to advanced strategies ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "like macro tracking and periodization ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as you gain experience. Track progress weekly ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "using strength gains, body measurements, or photos ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "and adjust as needed. Stay patient and disciplined ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "as results come with time ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: ". Consider consulting a coach ",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "or nutritionist ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04),
                ),
                TextSpan(
                  text: "for personalized guidance to optimize your bulking journey.",
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