// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../domain/repositories/authentication/auth_repository.dart';
import '../../../domain/repositories/transactions/transactions_repository.dart';
import 'graphics_state.dart';

class GraphicsController {
  final TransactionsRepository transactionsRepository;
  final AuthRepository authRepository;

  GraphicsController({
    required this.transactionsRepository,
    required this.authRepository,
  });

  final ValueNotifier<GraphicsState> state =
      ValueNotifier<GraphicsState>(GraphicsStateInitial());

  void fetchTransactions() async {
    final userId = authRepository.currentUser?.uid;
    await transactionsRepository.getTransactionsList(userId ?? "").then((list) {
      state.value = GraphicsStateSuccess(transactions: list);
    });
  }

  void getIncomeTransactionList() async {
    final userId = authRepository.currentUser?.uid;
    var incomeTransactionsList =
        await transactionsRepository.getTransactionsList(userId ?? "");
    var incomefilteredList =
        incomeTransactionsList.where((item) => item.type == 'Receita').toList();
    state.value = GraphicsStateSuccess(transactions: incomefilteredList);
  }

  void getExpensesTransactionList() async {
    final userId = authRepository.currentUser?.uid;
    var incomeTransactionsList =
        await transactionsRepository.getTransactionsList(userId ?? "");
    var incomefilteredList =
        incomeTransactionsList.where((item) => item.type == 'Despesa').toList();
    state.value = GraphicsStateSuccess(transactions: incomefilteredList);
  }
}
