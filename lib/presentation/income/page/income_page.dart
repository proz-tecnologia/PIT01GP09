import 'package:flutter/material.dart';
import 'package:test/presentation/income/widgets/bottom_sheet_income_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_widget.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const TransactionWidget(
          appBarTitle: 'Receitas',
          appBarColor: AppColors.greenVibrant,
          date: '13 de outubro',
        ),
        bottomSheet: const BottomSheetIncomeWidget(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 74),
          child: FloatingActionButton(
            backgroundColor: AppColors.greenVibrant,
            onPressed: () {},
            tooltip: 'Add income',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
