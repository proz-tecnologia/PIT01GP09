import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/transactions/controller/update_state.dart';
import 'package:flutter/material.dart';

class UpdateTransactionController {
  final TransactionsRepository transactionsRepository;
  final AuthRepository authRepository;

  UpdateTransactionController({
    required this.authRepository,
    required this.transactionsRepository,
  });

  final notifier = ValueNotifier<UpdateState>(UpdateInitialState());

  UpdateState get state => notifier.value;

  Future<void> updateTransaction(TransactionsModel transaction) async {
    notifier.value = UpdateLoadingState();

    try {
      final userId = authRepository.currentUser?.uid;

      final transactionModel = TransactionsModel(
          id: transaction.id,
          description: transaction.description,
          category: transaction.category,
          type: transaction.type,
          value: transaction.value,
          date: transaction.date,
          userId: userId ?? "");

      await transactionsRepository.updateTransaction(transactionModel);

      notifier.value = UpdateSuccessState();
    } catch (e) {
      notifier.value = UpdateErrorState(e.toString());
    }
  }
}
