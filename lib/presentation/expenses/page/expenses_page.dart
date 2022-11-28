import 'package:flutter/material.dart';
import 'package:test/presentation/expenses/widgets/bottom_sheet_expenses_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_widget.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const TransactionWidget(
          appBarTitle: 'Despesas',
          appBarColor: AppColors.redWine,
          date: '13 de outubro',
        ),
        bottomSheet: const BottomSheetExpensesWidget(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 74),
          child: FloatingActionButton(
            backgroundColor: AppColors.redWine,
            onPressed: () {},
            tooltip: 'Add expense',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
