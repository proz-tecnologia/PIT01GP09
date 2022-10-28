import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import 'pie_chart_widget.dart';

class CardChartWidget extends StatefulWidget {
  const CardChartWidget({super.key});

  @override
  State<CardChartWidget> createState() => _CardChartWidgetState();
}

class _CardChartWidgetState extends State<CardChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 20),
          child: Text(
            'Gráficos',
            style: TextStyle(
              color: AppColors.blackSwan,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12),
          height: 222,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
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
        ),
      ],
    );
  }

  Widget loadChart(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 20),
      child: Container(
        width: 314,
        height: 222,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.whiteSnow,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const PieChartSample2(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Receitas'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '70%',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
