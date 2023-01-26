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

  void fetchTransactions() {
    final userId = authRepository.currentUser?.uid;
    transactionsRepository.getTransactionsList(userId ?? "").then((list) {
      state.value = TransactionStateSuccess(transactions: list);
    });
  }
}
