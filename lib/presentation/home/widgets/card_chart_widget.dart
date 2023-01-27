import 'package:flutter/material.dart';

import '../../../data/models/transactions_model.dart';
import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../../../resources/text_style.dart';
import '../../transactions/page/transactions_page_error.dart';
import '../../transactions/page/transactions_page_loading.dart';
import '../controller/transactions_controller.dart';
import '../controller/transactions_state.dart';
import '../controller/transactions_state_error.dart';
import '../controller/transactions_state_loading.dart';
import '../controller/transactions_state_success.dart';
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
    transactionsController.fetchTransactions();
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
    final expensePercentage = (totalExpense / totalIncome) * 100;
    return [incomePercentage, expensePercentage];
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TransactionState>(
        valueListenable: transactionsController.state,
        builder: (_, state, __) {
          if (state is TransactionStateLoading) {
            return TransactionsPageLoading(state: state);
          }
          if (state is TransactionStateError) {
            return TransactionsPageError(state: state);
          }
          if (state is TransactionStateSuccess) {
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
                            getPercentages(state.transactions.value)[0],
                            getPercentages(state.transactions.value)[1],
                            getPercentages(state.transactions.value)[0],
                            AppColors.greenVibrant,
                            AppColors.grayTwo,
                          ),
                          loadChart(
                            'Despesas',
                            getPercentages(state.transactions.value)[0],
                            getPercentages(state.transactions.value)[1],
                            getPercentages(state.transactions.value)[1],
                            AppColors.grayTwo,
                            AppColors.redWine,
                          ),
                          loadChart(
                            'Total',
                            getPercentages(state.transactions.value)[0],
                            getPercentages(state.transactions.value)[1],
                            100,
                            AppColors.greenVibrant,
                            AppColors.redWine,
                          ),
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

  Widget loadChart(String type, double percentageOne, double percentageTwo,
      double percentageShown, Color colorOne, Color colorTwo) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
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
              percentageOne: percentageOne,
              percentageTwo: percentageTwo,
              colorOne: colorOne,
              colorTwo: colorTwo,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    type,
                    style: AppTextStyles.date,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${percentageShown.toStringAsFixed(0)} %',
                    style: AppTextStyles.percent,
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
