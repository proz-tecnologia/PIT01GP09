import 'package:flutter/material.dart';
import 'package:test/presentation/transactions/widgets/bottom_sheet_transactions_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_widget.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const TransactionWidget(
          appBarTitle: 'Transações',
          appBarColor: AppColors.purpleFlower,
          date: '13 de outubro',
        ),
        bottomSheet: const BottomSheetTransactionsWidget(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 74),
          child: FloatingActionButton(
            backgroundColor: AppColors.purpleFlower,
            onPressed: () {},
            tooltip: 'Press and access options',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
