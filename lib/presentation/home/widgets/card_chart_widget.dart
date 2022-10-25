import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardChartWidget extends StatefulWidget {
  const CardChartWidget({super.key});

  @override
  State<CardChartWidget> createState() => _CardChartWidgetState();
}

class _CardChartWidgetState extends State<CardChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.8,
          width: MediaQuery.of(context).size.width,
          color: AppColors.graySuperLight,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Gráficos'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      loadChart(context),
                      loadChart(context),
                      loadChart(context),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  loadChart(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.whiteSnow,
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
