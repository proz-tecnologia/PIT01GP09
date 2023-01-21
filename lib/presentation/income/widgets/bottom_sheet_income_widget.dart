import 'package:flutter/material.dart';
import 'package:finance_app/resources/colors.dart';

class BottomSheetIncomeWidget extends StatelessWidget {
  const BottomSheetIncomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              color: AppColors.grayLight,
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  Text(
                    'R\$ 5500.00',
                    style: TextStyle(
                      color: AppColors.greenVibrant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Receitas',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.graySuperLight,
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  Text(
                    'R\$ 1.000,00',
                    style: TextStyle(
                      color: AppColors.purpleFlower,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Saldo',
                    style: TextStyle(),
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
