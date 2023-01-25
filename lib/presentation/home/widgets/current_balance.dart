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
    transactionsController.getTransactionsList();
  }

  String getCurrentBalance(List<TransactionsModel> transactionsList) {
    late double totalIcome = 0;
    late double totalExpense = 0;
    var formatter = NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');
    for (var transaction in transactionsList) {
      if (transaction.type == 'Receita') {
        totalIcome += transaction.value;
      } else if (transaction.type == 'Despesa') {
        totalExpense += transaction.value;
      }
    }
    final currentBalance = formatter.format(totalIcome - totalExpense);
    return currentBalance;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ValueListenableBuilder<TransactionState>(
        valueListenable: transactionsController,
        builder: (_, state, __) {
          if (state is TransactionLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.blueVibrant,
            ));
          }
          if (state is TransactionSuccessState) {
            return Text(
              getCurrentBalance(state.transactionListModel),
              style: AppTextStyles.currentBalance,
            );
          }
          if (state is TransactionErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      );
    });
  }
}
