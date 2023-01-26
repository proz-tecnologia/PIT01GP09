import 'package:flutter/material.dart';

import '../../../data/models/transactions_model.dart';
import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../controller/transactions_controller.dart';
import '../controller/transactions_state.dart';
import 'pie_chart_widget.dart';

class CardChartWidget extends StatefulWidget {
  const CardChartWidget({super.key});

  @override
  State<CardChartWidget> createState() => _CardChartWidgetState();
}

class _CardChartWidgetState extends State<CardChartWidget> {
  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());

  @override
  void initState() {
    super.initState();
    transactionsController.getTransactionsList();
  }

  List<double> getPercentages(List<TransactionsModel> transactionsList) {
    late double totalIncome = 0;
    late double totalExpense = 0;
    for (var transaction in transactionsList) {
      if (transaction.type == 'Receita') {
        totalIncome += transaction.value;
      } else if (transaction.type == 'Despesa') {
        totalExpense += transaction.value;
      }
    }
    final currentBalance = totalIncome - totalExpense;
    final incomePercentage = (currentBalance / totalIncome) * 100;
    final expensePercentage = (currentBalance / totalExpense) * 100;
    return [incomePercentage, expensePercentage];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TransactionState>(
        valueListenable: transactionsController,
        builder: (_, state, __) {
          if (state is TransactionLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.blueVibrant,
            ));
          }
          if (state is TransactionErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is TransactionSuccessState) {
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
                          loadChart(
                              'Receitas',
                              getPercentages(state.transactionListModel)[0],
                              AppColors.greenVibrant),
                          loadChart(
                              'Receitas',
                              getPercentages(state.transactionListModel)[0],
                              AppColors.greenVibrant),
                          loadChart(
                              'Receitas',
                              getPercentages(state.transactionListModel)[0],
                              AppColors.greenVibrant),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        });
  }

  Widget loadChart(String type, double percentage, Color color) {
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
            PieChartSample2(
              percentage: percentage,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(type),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${percentage.toStringAsFixed(0)} %',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
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
