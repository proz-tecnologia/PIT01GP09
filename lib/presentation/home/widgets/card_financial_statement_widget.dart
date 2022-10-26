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
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.whiteSnow,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    Strings.income,
                    style: TextStyle(
                      color: AppColors.grayDark,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'RS 20.250,30',
                    style: TextStyle(
                      color: AppColors.greenVibrant,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.whiteSnow,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    Strings.expenses,
                    style: TextStyle(
                      color: AppColors.grayDark,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    '14.975,90',
                    style: TextStyle(
                        color: AppColors.redWine,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
