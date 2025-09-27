import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../OnboardingData.dart';

class Pages extends StatelessWidget {
  final OnboardingData data;
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;

  const Pages({
    super.key,
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000011),
            Color(0xFF0D0033),
            Color(0xFF1A001A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Spacer(flex: 2),
            SizedBox(
              width: screenWidth * 0.8,
              height: screenWidth * 0.8,
              child: Lottie.asset(
                data.lottiePath,
                fit: BoxFit.contain,
                repeat: true,
                animate: true,
              ),
            ),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                    (indexDot) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                  width: currentPage == indexDot
                      ? screenWidth * 0.08
                      : screenWidth * 0.02,
                  height: screenHeight * 0.01,
                  decoration: BoxDecoration(
                    color: currentPage == indexDot
                        ? const Color(0xFF3B82F6)
                        : Colors.white30,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
            Text(
              data.title,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              data.description,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 1),
            SizedBox(
              width: double.infinity,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentPage == totalPages - 1 ? 'Get Started' : 'Next',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
