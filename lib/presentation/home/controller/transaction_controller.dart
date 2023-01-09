import 'package:flutter/material.dart';
import 'package:test/domain/repositories/transaction/transaction_repository.dart';
import 'package:test/presentation/home/controller/transaction_state.dart';

class TransactionController extends ValueNotifier<TransactionState> {
  final TransactionRepository _transactionRepository;

  TransactionController({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(TransactionInitialState());

  Future<void> getTransactionList() async {
    value = TransactionLoadingState();

    try {
      final transactionList = await _transactionRepository.getTransactionList();
      value = TransactionSuccessState(transactionList);
    } catch (e) {
      value = TransactionErrorState(e.toString());
    }
  }
}
