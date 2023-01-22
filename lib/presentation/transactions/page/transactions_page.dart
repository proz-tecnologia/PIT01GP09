import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/home/controller/transactions_controller.dart';
import 'package:finance_app/presentation/home/controller/transactions_state.dart';
import 'package:finance_app/presentation/transactions/widgets/bottom_sheet_transactions_widget.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/shared_widgets/transaction_widget.dart';
import 'package:finance_app/resources/strings.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/add_menu.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());
  @override
  void initState() {
    super.initState();
    transactionsController.getTransactionsList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<TransactionState>(
          valueListenable: transactionsController,
          builder: (_, state, __) {
            if (state is TransactionLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.greenVibrant,
              ));
            }
            if (state is TransactionSuccessState) {
              return TransactionWidget(
                appBarTitle: Strings.transactions,
                appBarColor: AppColors.purpleFlower,
                date: '13 de outubro',
                transactionsList: state.transactionListModel,
              );
            }
            if (state is TransactionErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
        bottomSheet: const BottomSheetTransactionsWidget(),
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(bottom: 60.0),
          child: AddMenu(color: AppColors.purpleFlower),
        ),
      ),
    );
  }
}
