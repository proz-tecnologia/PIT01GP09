import 'package:flutter/material.dart';
import 'package:test/locator.dart';
import 'package:test/presentation/income/controller/income_controller.dart';
import 'package:test/presentation/income/controller/income_state.dart';
import 'package:test/presentation/income/widgets/bottom_sheet_income_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_widget.dart';
import 'package:test/resources/strings.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final incomeController = IncomeController(
      transactionsRepository: getIt(), authRepository: getIt());

  @override
  void initState() {
    super.initState();
    incomeController.getIncomeTransactionList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<IncomeState>(
          valueListenable: incomeController.notifier,
          builder: (_, state, __) {
            if (state is IncomeLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.blueVibrant,
              ));
            }
            if (state is IncomeSuccessState) {
              return TransactionWidget(
                appBarTitle: Strings.income,
                appBarColor: AppColors.greenVibrant,
                date: '13 de outubro',
                transactionsList: state.incomeListModel,
              );
            }
            if (state is IncomeErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
        bottomSheet: const BottomSheetIncomeWidget(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            backgroundColor: AppColors.greenVibrant,
            onPressed: () => Navigator.of(context).pushNamed('/add_income'),
            tooltip: 'Add income',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
