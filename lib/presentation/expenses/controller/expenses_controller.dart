import 'package:flutter/material.dart';

import '../../../domain/repositories/transaction/transaction_repository.dart';
import 'expenses_state.dart';

class ExpensesController extends ValueNotifier<ExpensesState> {
  final TransactionRepository _transactionRepository;

  ExpensesController({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(ExpensesInitialState());

  Future<void> getExpensesTransactionsList() async {
    value = ExpensesLoadingState();

    try {
      var transactionList = await _transactionRepository.getTransactionList();
      var expensesFilteredList =
          transactionList.where((item) => item.type == 'Despesa').toList();
      value = ExpensesSuccessState(expensesFilteredList);
    } catch (e) {
      value = ExpensesErrorState(e.toString());
    }
  }
}
