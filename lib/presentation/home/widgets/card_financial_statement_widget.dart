import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/transactions_model.dart';
import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../controller/transactions_controller.dart';
import '../controller/transactions_state.dart';

class CardFinancialStatementWidget extends StatefulWidget {
  const CardFinancialStatementWidget({super.key});

  @override
  State<CardFinancialStatementWidget> createState() =>
      _CardFinancialStatementWidgetState();
}

class _CardFinancialStatementWidgetState
    extends State<CardFinancialStatementWidget> {
  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());

  @override
  void initState() {
    super.initState();
    transactionsController.getTransactionsList();
  }

  String getTotalIncome(List<TransactionsModel> transactionsList) {
    late double totalIncome = 0;
    var formatter = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
    for (var transaction in transactionsList) {
      if (transaction.type == 'Receita') {
        totalIncome += transaction.value;
      }
    }
    final totalIncomeFormatted = formatter.format(totalIncome);
    return totalIncomeFormatted;
  }

  String getTotalExpense(List<TransactionsModel> transactionsList) {
    late double totalExpense = 0;
    var formatter = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
    for (var transaction in transactionsList) {
      if (transaction.type == 'Despesa') {
        totalExpense += transaction.value;
      }
    }
    final totalExpenseFormatted = formatter.format(totalExpense);
    return totalExpenseFormatted;
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
            return Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 16, right: 16, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/income'),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.whiteSnow,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              Strings.income,
                              style: TextStyle(
                                color: AppColors.grayDark,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              getTotalIncome(state.transactionListModel),
                              style: const TextStyle(
                                color: AppColors.greenVibrant,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/expenses'),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.whiteSnow,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              Strings.expenses,
                              style: TextStyle(
                                color: AppColors.grayDark,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              getTotalExpense(state.transactionListModel),
                              style: const TextStyle(
                                  color: AppColors.redWine,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}
