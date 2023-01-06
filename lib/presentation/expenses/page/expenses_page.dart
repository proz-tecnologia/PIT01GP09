import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/expenses/controller/expenses_controller.dart';
import 'package:test/presentation/expenses/controller/expenses_state.dart';
import 'package:test/presentation/expenses/widgets/bottom_sheet_expenses_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_widget.dart';
import 'package:test/resources/strings.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  void initState() {
    super.initState();
    final expensesController =
        Provider.of<ExpensesController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      expensesController.getExpensesTransactionsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final expensesController = context.watch<ExpensesController>();
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<ExpensesState>(
          valueListenable: expensesController,
          builder: (_, state, __) {
            if (state is ExpensesLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.blueVibrant,
              ));
            }
            if (state is ExpensesSuccessState) {
              return TransactionWidget(
                appBarTitle: Strings.expenses,
                appBarColor: AppColors.redWine,
                date: '13 de outubro',
                transactionsList: state.expensesListModel,
              );
            }
            if (state is ExpensesErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
        bottomSheet: const BottomSheetExpensesWidget(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 74),
          child: FloatingActionButton(
            backgroundColor: AppColors.redWine,
            onPressed: () => Navigator.of(context).pushNamed('/add_expense'),
            tooltip: 'Add expense',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
