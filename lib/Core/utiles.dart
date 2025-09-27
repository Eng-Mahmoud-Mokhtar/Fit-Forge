import 'package:flutter/material.dart';

Color getScoreColor(double bulkingPotentialScore) {
  if (bulkingPotentialScore >= 80) return const Color(0xFF10b981);
  if (bulkingPotentialScore >= 70) return const Color(0xFF3b82f6);
  if (bulkingPotentialScore >= 60) return const Color(0xFFf59e0b);
  return const Color(0xFFef4444);
}

String getAssessmentTitle(double bulkingPotentialScore) {
  if (bulkingPotentialScore >= 85) return 'Excellent Bulking Potential!';
  if (bulkingPotentialScore >= 75) return 'Great for Mass Gain';
  if (bulkingPotentialScore >= 65) return 'Good Foundation for Bulking';
  if (bulkingPotentialScore >= 55) return 'Solid Weight Gain Potential';
  return 'Focus on Strategic Bulking';
}

String getAssessmentDescription(double bulkingPotentialScore) {
  if (bulkingPotentialScore >= 85) {
    return 'Ideal conditions for weight gain and muscle building. Follow the plan for optimal results.';
  } else if (bulkingPotentialScore >= 75) {
    return 'Excellent bulking potential. You can expect significant muscle and weight gains.';
  } else if (bulkingPotentialScore >= 65) {
    return 'Good bulking potential. Consistent effort will yield great results.';
  } else if (bulkingPotentialScore >= 55) {
    return 'Solid foundation for weight gain. Focus on nutrition and consistency.';
  } else {
    return 'Needs strategic approach. Follow the plan closely for best results.';
  }
}