import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/shared_widgets/add_new_transaction_widget.dart';
import 'package:finance_app/utils/list_expenses_util.dart';
import 'package:flutter/material.dart';
import '../../../resources/strings.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: AddNewTransactionWidget(
      color: AppColors.redWine,
      type: Strings.expense,
      list: listExpenses,
    ));
  }
}
