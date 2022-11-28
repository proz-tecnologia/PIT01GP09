import 'package:flutter/material.dart';
import 'package:test/data/models/transaction_model.dart';
import 'package:test/resources/colors.dart';

class TransactionCardWidget extends StatefulWidget {
  const TransactionCardWidget({super.key});

  @override
  State<TransactionCardWidget> createState() => _TransactionCardWidgetState();
}

class _TransactionCardWidgetState extends State<TransactionCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  List<TransactionModel> fakeTransactionList = [
    TransactionModel(
      description: 'Herança de família',
      category: 'Herança',
      type: 'Receita',
      value: 3000.0,
      date: DateTime.now(),
    ),
    TransactionModel(
      description: 'Consulta médica',
      category: 'Saúde',
      type: 'Despesa',
      value: 3000.0,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 370,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: fakeTransactionList.length,
            itemBuilder: (BuildContext context, int index) {
              final listItem = fakeTransactionList[index];
              return Padding(
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
