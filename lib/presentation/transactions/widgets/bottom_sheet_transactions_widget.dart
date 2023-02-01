import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/home/controller/transactions_controller.dart';
import 'package:finance_app/presentation/home/controller/transactions_state.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_error.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_loading.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_success.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetTransactionsWidget extends StatefulWidget {
  const BottomSheetTransactionsWidget({super.key});

  @override
  State<BottomSheetTransactionsWidget> createState() =>
      _BottomSheetTransactionsWidgetState();
}

class _BottomSheetTransactionsWidgetState
    extends State<BottomSheetTransactionsWidget> {
  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());

  @override
  void initState() {
    super.initState();
    transactionsController.fetchTransactions();
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

  String getCurrentBalance(List<TransactionsModel> transactionsList) {
    late double totalIncome = 0;
    late double totalExpense = 0;
    var formatter = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
    for (var transaction in transactionsList) {
      if (transaction.type == 'Receita') {
        totalIncome += transaction.value;
      } else if (transaction.type == 'Despesa') {
        totalExpense += transaction.value;
      }
    }
    final currentBalance = formatter.format(totalIncome - totalExpense);
    return currentBalance;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ValueListenableBuilder<TransactionState>(
          valueListenable: transactionsController.state,
          builder: (_, state, __) {
            if (state is TransactionStateLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.blueVibrant,
              ));
            }
            if (state is TransactionStateError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is TransactionStateSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      color: AppColors.grayLight,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            getTotalIncome(state.transactions.value),
                            style: const TextStyle(
                              color: AppColors.greenVibrant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            Strings.revenue,
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
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            getCurrentBalance(state.transactions.value),
                            style: const TextStyle(
                              color: AppColors.purpleFlower,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            Strings.balance,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: AppColors.grayLight,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            getTotalExpense(state.transactions.value),
                            style: const TextStyle(
                              color: AppColors.redWine,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            Strings.expenses,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          }),
    );
  }
}