import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/transactions/controller/delete_state.dart';
import 'package:flutter/foundation.dart';

class DeleteTransactionController {
  final TransactionsRepository transactionsRepository;

  DeleteTransactionController({
    required this.transactionsRepository,
  });

  final ValueNotifier<DeleteState> state =
      ValueNotifier<DeleteState>(DeleteInitialState());

  Future<void> deleteTransaction(String transactionId) async {
    try {
      await transactionsRepository.deleteTransaction(transactionId);
      state.value = DeleteSuccessState();
    } catch (e) {
      state.value = DeleteErrorState('Erro ao deletar!');
    }
  }
}
