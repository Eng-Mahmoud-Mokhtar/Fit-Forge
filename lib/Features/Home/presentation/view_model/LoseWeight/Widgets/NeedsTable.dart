import 'dart:math' as math;
import 'package:flutter/material.dart';

class NeedsTable extends StatefulWidget {
  final String title;
  final Map<String, dynamic> naturalNeeds;
  final Map<String, dynamic> bulkingNeeds;
  final double screenWidth;
  final double screenHeight;

  const NeedsTable({
    super.key,
    required this.title,
    required this.naturalNeeds,
    required this.bulkingNeeds,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  _NeedsTableState createState() => _NeedsTableState();
}

class _NeedsTableState extends State<NeedsTable> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> needsData = [
      {
        'metric': 'Calories',
        'natural':
        '${widget.naturalNeeds['calories']?.toStringAsFixed(0) ?? '0'} kcal',
        'losing':
        '${widget.bulkingNeeds['calories']?.toStringAsFixed(0) ?? '0'} kcal',
      },
      {
        'metric': 'Protein',
        'natural':
        '${widget.naturalNeeds['protein']?.toStringAsFixed(1) ?? '0'} g',
        'losing':
        '${widget.bulkingNeeds['protein']?.toStringAsFixed(1) ?? '0'} g',
      },
      {
        'metric': 'Carbohydrates',
        'natural':
        '${widget.naturalNeeds['carbs']?.toStringAsFixed(1) ?? '0'} g',
        'losing':
        '${widget.bulkingNeeds['carbs']?.toStringAsFixed(1) ?? '0'} g',
      },
      {
        'metric': 'Fat',
        'natural': '${widget.naturalNeeds['fat']?.toStringAsFixed(1) ?? '0'} g',
        'losing':
        '${widget.bulkingNeeds['fat']?.toStringAsFixed(1) ?? '0'} g',
      },
      {
        'metric': 'Water',
        'natural':
        '${widget.naturalNeeds['water']?.toStringAsFixed(1) ?? '0'} L',
        'losing':
        '${widget.bulkingNeeds['water']?.toStringAsFixed(1) ?? '0'} L',
      },
      {
        'metric': 'BMR',
        'natural': '${widget.naturalNeeds['bmr']?.toStringAsFixed(0) ?? '0'} kcal',
        'losing': '-',
      },
      {
        'metric': 'Deficit',
        'natural': '-',
        'losing':
        '${widget.bulkingNeeds['deficit']?.toStringAsFixed(0) ?? '0'} kcal',
      },
    ];

    return Container(
      width: widget.screenWidth,
      child: Card(
        margin: EdgeInsets.zero,
        color: const Color(0xFF2D3748).withOpacity(0.85),
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
            leading: Icon(
              Icons.stacked_line_chart_sharp,
              color: Color(0xFF10b981),
              size: widget.screenWidth * 0.06,
            ),
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
                  borderRadius:
                  BorderRadius.circular(widget.screenWidth * 0.04),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: widget.screenHeight * 0.015,
                        horizontal: widget.screenWidth * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4475ec).withOpacity(0.2),
                        borderRadius:
                        BorderRadius.circular(widget.screenWidth * 0.02),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Metric',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Natural',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Loss',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: widget.screenWidth * 0.03,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: widget.screenHeight * 0.01),
                    ...needsData.map(
                          (item) => Container(
                        padding: EdgeInsets.symmetric(
                          vertical: widget.screenHeight * 0.01,
                          horizontal: widget.screenWidth * 0.01,
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
                                item['metric']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.screenWidth * 0.03,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item['natural']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.screenWidth * 0.03,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item['losing']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.screenWidth * 0.03,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
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