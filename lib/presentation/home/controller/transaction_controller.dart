import 'package:flutter/material.dart';
import 'package:test/domain/repositories/authentication/auth_repository.dart';
import 'package:test/domain/repositories/transactions/transactions_repository.dart';
import 'package:test/presentation/home/controller/transaction_state.dart';

class TransactionsController extends ValueNotifier<TransactionState> {
  final TransactionsRepository _transactionsRepository;
  final AuthRepository _authRepository;

  TransactionsController({
    required TransactionsRepository transactionsRepository,
    required AuthRepository authRepository,
  })  : _transactionsRepository = transactionsRepository,
        _authRepository = authRepository,
        super(
          TransactionInitialState());

  Future<void> getTransactionsList() async {
    value = TransactionLoadingState();

    try {
      final userId = _authRepository.currentUser?.uid;

      final transactionsList =
          await _transactionsRepository.getTransactionsList(userId ?? "");

      value = TransactionSuccessState(transactionsList);
    } catch (e) {
      value = TransactionErrorState(e.toString());
    }
  }
}
