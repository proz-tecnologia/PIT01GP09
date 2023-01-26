import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/home/controller/transactions_controller.dart';
import 'package:finance_app/presentation/home/controller/transactions_state.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_error.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_loading.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_success.dart';
import 'package:finance_app/presentation/transactions/page/transactions_page_error.dart';
import 'package:finance_app/presentation/transactions/page/transactions_page_loading.dart';
import 'package:finance_app/presentation/transactions/page/transactions_page_success.dart';
import 'package:finance_app/presentation/transactions/widgets/bottom_sheet_transactions_widget.dart';
import 'package:finance_app/resources/colors.dart';
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
    transactionsController.fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed('/home');
              },
              child: const Icon(
                Icons.arrow_back,
              )),
          title: const Text(Strings.transactions,
              style: TextStyle(
                fontSize: 18,
              )),
          elevation: 0,
          flexibleSpace: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: AppColors.purpleFlower,
          ),
        ),
        body: ValueListenableBuilder<TransactionState>(
          valueListenable: transactionsController.state,
          builder: (_, state, __) {
            if (state is TransactionStateLoading) {
              return TransactionsPageLoading(state: state);
            }
            if (state is TransactionStateSuccess) {
              return TransactionsPageSuccess(state: state);
            }
            if (state is TransactionStateError) {
              return TransactionsPageError(state: state);
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
