import 'package:flutter/material.dart';

class ResultsCard extends StatefulWidget {
  final bool showResults;
  final double bulkingPotentialScore;
  final String potentialCategory;
  final String healthAdvice;
  final String deviationMessage;
  final Map<String, dynamic> naturalNeeds;
  final Map<String, dynamic> bulkingNeeds;
  final Color Function(double) getScoreColor;
  final String Function(double) getAssessmentTitle;
  final String Function(double) getAssessmentDescription;
  final VoidCallback onReset;
  const ResultsCard({
    super.key,
    required this.showResults,
    required this.bulkingPotentialScore,
    required this.potentialCategory,
    required this.healthAdvice,
    required this.deviationMessage,
    required this.naturalNeeds,
    required this.bulkingNeeds,
    required this.getScoreColor,
    required this.getAssessmentTitle,
    required this.getAssessmentDescription,
    required this.onReset,
  });
  @override
  _ResultsCardState createState() => _ResultsCardState();
}

class _ResultsCardState extends State<ResultsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.showResults) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ResultsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showResults && !oldWidget.showResults) {
      _controller.forward(from: 0);
    } else if (!widget.showResults && oldWidget.showResults) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showResults) return const SizedBox.shrink();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isIdeal = widget.deviationMessage.contains('within the ideal range');

    String summary = isIdeal
        ? '${widget.getAssessmentDescription(widget.bulkingPotentialScore)} ${widget.healthAdvice}'
        : '${widget.deviationMessage} ${widget.getAssessmentDescription(widget.bulkingPotentialScore)} ${widget.healthAdvice}';

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF3B82F6),
                Color(0xFF330066),
              ],
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
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    child: CircularProgressIndicator(
                      value: widget.bulkingPotentialScore / 100,
                      strokeWidth: screenWidth * 0.02,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.getScoreColor(widget.bulkingPotentialScore),
                      ),
                    ),
                  ),
                  Text(
                    '${widget.bulkingPotentialScore.toStringAsFixed(1)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            widget.potentialCategory,
                            style: TextStyle(
                              color: widget.getScoreColor(widget.bulkingPotentialScore),
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh, color: Colors.white.withOpacity(0.5)),
                          onPressed: widget.onReset,
                        ),
                      ],
                    ),
                    Text(
                      summary,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
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
