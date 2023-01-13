import 'package:flutter/material.dart';
import 'package:test/domain/repositories/transaction/transaction_repository.dart';
import 'package:test/presentation/income/controller/income_state.dart';

class IncomeController extends ValueNotifier<IncomeState> {
  final TransactionRepository _transactionRepository;

  IncomeController({
    required TransactionRepository transactionRepository,
  })  : _transactionRepository = transactionRepository,
        super(IncomeInitialState());

  Future<void> getIncomeTransactionList() async {
    value = IncomeLoadingState();

    try {
      var incomeTransactionList = await _transactionRepository.getTransactionList();
      var incomefilteredList = incomeTransactionList.where((item) => item.type == 'Receita').toList();

      value = IncomeSuccessState(incomefilteredList);
    } catch (e) {
      value = IncomeErrorState(e.toString());
    }
  }
}
