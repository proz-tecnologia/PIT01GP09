import 'package:finance_app/presentation/home/controller/transactions_state_error.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_loading.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_success.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/transactions_model.dart';
import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../../../resources/text_style.dart';
import '../controller/transactions_controller.dart';
import '../controller/transactions_state.dart';

class CurrentBalance extends StatefulWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentBalance> createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<CurrentBalance> {
  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());

  @override
  void initState() {
    super.initState();
    transactionsController.fetchTransactions();
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
    return ValueListenableBuilder<TransactionState>(
      valueListenable: transactionsController.state,
      builder: (_, state, __) {
        if (state is TransactionStateLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.blueVibrant,
          ));
        }
        if (state is TransactionStateSuccess) {
          return Text(
            getCurrentBalance(state.transactions.value),
            style: AppTextStyles.currentBalance,
          );
        }
        if (state is TransactionStateError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
