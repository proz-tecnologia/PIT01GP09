import 'package:flutter/material.dart';
import 'package:test/data/models/transactions_model.dart';
import 'package:test/domain/repositories/authentication/auth_repository.dart';
import 'package:test/domain/repositories/transactions/transactions_repository.dart';
import 'package:test/presentation/income/controller/add_transaction_state.dart';

class AddTransactionController extends ValueNotifier<AddTransactionState> {
  final TransactionsRepository _transactionsRepository;
  final AuthRepository _authRepository;

  final notifier =
      ValueNotifier<AddTransactionState>(AddTransactionInitialState());

  AddTransactionState get state => notifier.value;

  AddTransactionController({
    required TransactionsRepository transactionsRepository,
    required AuthRepository authRepository,
  })  : _transactionsRepository = transactionsRepository,
        _authRepository = authRepository,
        super(AddTransactionInitialState());

  Future<void> addTransaction(TransactionsModel transaction) async {
    notifier.value = AddTransactionLoadingState();

    try {
      final userId = _authRepository.currentUser?.uid;

      final transactionModel = TransactionsModel(
          description: transaction.description,
          category: transaction.category,
          type: transaction.type,
          value: transaction.value,
          date: transaction.date,
          userId: userId ?? "");

      await _transactionsRepository.addTransaction(transactionModel);

      notifier.value = AddTransactionSuccessState();
    } catch (e) {
      notifier.value = AddTransactionErrorState(e.toString());
    }
  }
}