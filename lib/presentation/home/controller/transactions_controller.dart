import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/home/controller/transactions_state.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_initial.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_success.dart';
import 'package:flutter/material.dart';

class TransactionsController {
  final TransactionsRepository transactionsRepository;
  final AuthRepository authRepository;

  TransactionsController({
    required this.transactionsRepository,
    required this.authRepository,
  });

  final ValueNotifier<TransactionState> state =
      ValueNotifier<TransactionState>(TransactionInitialState());

  void fetchTransactions() async {
    final userId = authRepository.currentUser?.uid;
    await transactionsRepository.getTransactionsList(userId ?? "").then((list) {
      state.value = TransactionStateSuccess(transactions: list);
    });
  }

  void getIncomeTransactionList() async {
    final userId = authRepository.currentUser?.uid;
    var incomeTransactionsList =
        await transactionsRepository.getTransactionsList(userId ?? "");
    var incomefilteredList =
        incomeTransactionsList.where((item) => item.type == 'Receita').toList();
    state.value = TransactionStateSuccess(transactions: incomefilteredList);
  }

  void getExpensesTransactionList() async {
    final userId = authRepository.currentUser?.uid;
    var incomeTransactionsList =
        await transactionsRepository.getTransactionsList(userId ?? "");
    var incomefilteredList =
        incomeTransactionsList.where((item) => item.type == 'Despesa').toList();
    state.value = TransactionStateSuccess(transactions: incomefilteredList);
  }
}
