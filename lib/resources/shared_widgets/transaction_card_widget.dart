import 'package:flutter/material.dart';
import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/resources/colors.dart';

// ignore: must_be_immutable
class TransactionCardWidget extends StatefulWidget {
  final Color cardColor;
  final double leftPadding;
  final double rightPadding;
  final List<TransactionsModel> transactionsList;

  const TransactionCardWidget({
    super.key,
    required this.cardColor,
    required this.leftPadding,
    required this.rightPadding,
    required this.transactionsList,
  });

  @override
  State<TransactionCardWidget> createState() => _TransactionCardWidgetState();
}

class _TransactionCardWidgetState extends State<TransactionCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.transactionsList.length,
            itemBuilder: (BuildContext context, int index) {
              final listItem = widget.transactionsList[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: widget.leftPadding,
                  right: widget.rightPadding,
                  bottom: 16,
                ),
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: widget.cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: widget.cardColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          maxRadius: 10,
                          backgroundColor: listItem.type == 'Despesa'
                              ? AppColors.redWine
                              : AppColors.greenVibrant,
                          child: Center(
                            child: listItem.type == 'Despesa'
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
                                listItem.description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackSwan,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                listItem.category,
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
                            listItem.type == 'Despesa'
                                ? 'R\$ ${(double.parse(listItem.value.toString()).toStringAsFixed(2))}'
                                : 'R\$ ${(double.parse(listItem.value.toString()).toStringAsFixed(2))}',
                            style: TextStyle(
                              color: listItem.type == 'Despesa'
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
              );
            },
          ),
        ),
      ],
    );
  }
}
