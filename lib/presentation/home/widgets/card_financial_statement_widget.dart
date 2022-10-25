import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/strings.dart';

class CardFinancialStatementWidget extends StatefulWidget {
  const CardFinancialStatementWidget({super.key});

  @override
  State<CardFinancialStatementWidget> createState() =>
      _CardFinancialStatementWidgetState();
}

class _CardFinancialStatementWidgetState
    extends State<CardFinancialStatementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: AppColors.graySuperLight,
      // child: const Text(Strings.titleGraphics),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  color: AppColors.whiteSnow,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(Strings.income),
                  Text(
                    'RS 20.250,30',
                    style: TextStyle(
                      color: AppColors.greenVibrant,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  color: AppColors.whiteSnow,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(Strings.expenses),
                  Text(
                    '14.975,90',
                    style: TextStyle(
                      color: AppColors.redWine,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
