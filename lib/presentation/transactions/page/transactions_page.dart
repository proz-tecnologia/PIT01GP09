import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/home/controller/transaction_controller.dart';
import 'package:test/presentation/home/controller/transaction_state.dart';
import 'package:test/presentation/transactions/widgets/bottom_sheet_transactions_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_widget.dart';
import 'package:test/resources/strings.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      transactionController.getTransactionList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionController = context.watch<TransactionController>();
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<TransactionState>(
          valueListenable: transactionController,
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
