import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:flutter/material.dart';

import '../../../domain/repositories/transactions/transactions_repository.dart';
import 'expenses_state.dart';

class ExpensesController extends ValueNotifier<ExpensesState> {
  final TransactionsRepository _transactionRepository;
  final AuthRepository _authRepository;

  ExpensesController({
    required TransactionsRepository transactionRepository,
    required AuthRepository authRepository,
  })  : _transactionRepository = transactionRepository,
        _authRepository = authRepository,
        super(ExpensesInitialState());

  Future<void> getExpensesTransactionsList() async {
    value = ExpensesLoadingState();

    try {
      final userId = _authRepository.currentUser?.uid;
      var transactionList =
          await _transactionRepository.getTransactionsList(userId ?? "");
      var expensesFilteredList =
          transactionList.where((item) => item.type == 'Despesa').toList();
      value = ExpensesSuccessState(expensesFilteredList);
    } catch (e) {
      value = ExpensesErrorState(e.toString());
    }
  }
}
