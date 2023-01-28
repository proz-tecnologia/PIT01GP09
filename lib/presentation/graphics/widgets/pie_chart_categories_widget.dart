import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample7 extends StatefulWidget {
  final double percentageOne;
  final double percentageTwo;
  final double percentageThree;
  final double percentageFour;
  final double percentageFive;
  final double percentageSix;
  final double percentageSeven;
  final double percentageEight;
  final Color colorOne;
  final Color colorTwo;
  final Color colorThree;
  final Color colorFour;
  final Color colorFive;
  final Color colorSix;
  final Color colorSeven;
  final Color colorEight;
  const PieChartSample7({
    Key? key,
    required this.percentageOne,
    required this.percentageTwo,
    required this.colorOne,
    required this.colorTwo,
    required this.percentageThree,
    required this.percentageFour,
    required this.percentageFive,
    required this.percentageSix,
    required this.percentageSeven,
    required this.percentageEight,
    required this.colorThree,
    required this.colorFour,
    required this.colorFive,
    required this.colorSix,
    required this.colorSeven,
    required this.colorEight,
  }) : super(key: key);

  @override
  State<PieChartSample7> createState() => _PieChartSample7State();
}

class _PieChartSample7State extends State<PieChartSample7> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 2,
                  centerSpaceRadius: 80,
                  sections: showingSections(
                      widget.percentageOne,
                      widget.percentageTwo,
                      widget.percentageThree,
                      widget.percentageFour,
                      widget.percentageFive,
                      widget.percentageSix,
                      widget.percentageSeven,
                      widget.percentageEight,
                      widget.colorOne,
                      widget.colorTwo,
                      widget.colorThree,
                      widget.colorFour,
                      widget.colorFive,
                      widget.colorSix,
                      widget.colorSeven,
                      widget.colorEight),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      double percentageOne,
      double percentageTwo,
      double percentageThree,
      double percentageFour,
      double percentageFive,
      double percentageSix,
      double percentageSeven,
      double percentageEight,
      Color colorOne,
      Color colorTwo,
      Color colorThree,
      Color colorFour,
      Color colorFive,
      Color colorSix,
      Color colorSeven,
      Color colorEight) {
    return List.generate(8, (int index) {
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 20.0 : 12.0;
      final radius = isTouched ? 50.0 : 25.0;
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: colorOne,
            value: percentageOne,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: colorTwo,
            value: percentageTwo,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: colorThree,
            value: percentageThree,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: colorFour,
            value: percentageFour,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 4:
          return PieChartSectionData(
            color: colorFive,
            value: percentageFive,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 5:
          return PieChartSectionData(
            color: colorSix,
            value: percentageSix,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 6:
          return PieChartSectionData(
            color: colorSeven,
            value: percentageSeven,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 7:
          return PieChartSectionData(
            color: colorEight,
            value: percentageEight,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
