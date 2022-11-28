import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';

class BottomSheetExpensesWidget extends StatelessWidget {
  const BottomSheetExpensesWidget({super.key});

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
                    'R\$ 55.00',
                    style: TextStyle(
                      color: AppColors.redWine,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Despesas',
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
                    'R\$ 5.000,00',
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
