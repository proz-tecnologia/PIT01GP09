import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:flutter/material.dart';

class TransactionsGroupWidget extends StatelessWidget {
  final String title;
  final List<TransactionsModel> transactions;
  const TransactionsGroupWidget({
    super.key,
    required this.title,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 33,
          child: Row(
            children: [
              Text(title),
            ],
          ),
        ),
        const SizedBox(height: 5),
        for (var item in transactions)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.graySuperLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.graySuperLight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: item.type == 'Despesa'
                          ? AppColors.redWine
                          : AppColors.greenVibrant,
                      child: Center(
                        child: item.type == 'Despesa'
                            ? const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 20,
                                color: AppColors.whiteSnow,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_up_outlined,
                                size: 20,
                                color: AppColors.whiteSnow,
                              ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackSwan,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grayDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        item.type == 'Despesa'
                            ? 'R\$ ${(double.parse(item.value.toString()).toStringAsFixed(2))}'
                            : 'R\$ ${(double.parse(item.value.toString()).toStringAsFixed(2))}',
                        style: TextStyle(
                          color: item.type == 'Despesa'
                              ? AppColors.redWine
                              : AppColors.greenVibrant,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
