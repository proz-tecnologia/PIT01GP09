import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/shared_widgets/add_new_transaction_widget.dart';
import 'package:finance_app/resources/strings.dart';
import 'package:finance_app/utils/list_expenses_util.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatelessWidget {
  final TransactionsModel? transaction;
  const AddExpensePage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AddNewTransactionWidget(
      color: AppColors.redWine,
      type: Strings.expense,
      list: listExpenses,
      transaction: transaction,
    ));
  }
}
