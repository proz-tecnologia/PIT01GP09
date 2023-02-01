import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/transactions/controller/update_state.dart';
import 'package:flutter/material.dart';

class UpdateTransactionController {
  final TransactionsRepository transactionsRepository;

  UpdateTransactionController({
    required this.transactionsRepository,
  });

  final ValueNotifier<UpdateState> state =
      ValueNotifier<UpdateState>(UpdateInitialState());

  Future<void> updateTransaction(TransactionsModel transaction) async {
    try {
      await transactionsRepository.updateTransaction(transaction);
      state.value = UpdateSuccessState();
    } catch (e) {
      state.value = UpdateErrorState('Erro ao atualizar!');
    }
  }
}
