import 'package:flutter/material.dart';

class SplashContent extends StatefulWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const SplashContent({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent>
    with TickerProviderStateMixin {
  late AnimationController _rotateController;
  late Animation<double> _rotationAnimation;
  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut),
    );
    _rotateController.repeat(reverse: true);
    _bgController = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: _bgController,
      builder: (context, child) {
        Alignment begin = Alignment(-1 + _bgController.value * 2, -1);
        Alignment end = Alignment(1 - _bgController.value * 2, 1);

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF000011),
                Color(0xFF0D0033),
                Color(0xFF1A001A),
              ],
              begin: begin,
              end: end,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * 2 * 3.1415926535,
                    child: ScaleTransition(
                      scale: widget.scaleAnimation,
                      child: FadeTransition(
                        opacity: widget.fadeAnimation,
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF3A3AFF),
                                Color(0xFF6A4DFF),
                                Color(0xFF8C66FF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(screenWidth * 0.06),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF3B82F6).withOpacity(0.3),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.fitness_center,
                            size: screenWidth * 0.15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: screenWidth * 0.08),
              FadeTransition(
                opacity: widget.fadeAnimation,
                child: Text(
                  'FitForge',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              FadeTransition(
                opacity: widget.fadeAnimation,
                child: Text(
                  'Forge Your Fitness Journey',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
