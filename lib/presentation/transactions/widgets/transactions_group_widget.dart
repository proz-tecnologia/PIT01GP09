import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/transactions/controller/delete_transaction_controller.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:flutter/material.dart';

class TransactionsGroupWidget extends StatefulWidget {
  final int index;
  final Map<String, List<TransactionsModel>> mapListByDay;
  const TransactionsGroupWidget({
    super.key,
    required this.index,
    required this.mapListByDay,
  });

  @override
  State<TransactionsGroupWidget> createState() =>
      _TransactionsGroupWidgetState();
}

class _TransactionsGroupWidgetState extends State<TransactionsGroupWidget> {
  final deleteController =
      DeleteTransactionController(transactionsRepository: getIt());

  @override
  Widget build(BuildContext context) {
    String date = widget.mapListByDay.keys.toList()[widget.index];

    return Column(
      children: [
        Visibility(
          visible: widget.mapListByDay[date]!.isNotEmpty,
          child: SizedBox(
            height: 33,
            child: Row(
              children: [
                Text(
                  date,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        for (var item in widget.mapListByDay[date]!)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Dismissible(
              key: UniqueKey(),
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: AppColors.redWine,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.delete,
                  color: AppColors.whiteSnow,
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  deleteController.deleteTransaction(item.id.toString());
                  setState(() {
                    widget.mapListByDay[date]!.remove(item);
                  });
                }
              },
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
          ),
      ],
    );
  }
}
