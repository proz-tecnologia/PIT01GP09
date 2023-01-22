import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/income/controller/income_state.dart';
import 'package:flutter/material.dart';

class IncomeController extends ValueNotifier<IncomeState> {
  final TransactionsRepository _transactionsRepository;
  final AuthRepository _authRepository;

  final notifier = ValueNotifier<IncomeState>(IncomeInitialState());

  IncomeState get state => notifier.value;

  IncomeController({
    required TransactionsRepository transactionsRepository,
    required AuthRepository authRepository,
  })  : _transactionsRepository = transactionsRepository,
        _authRepository = authRepository,
        super(IncomeInitialState());

  Future<void> getIncomeTransactionList() async {
    notifier.value = IncomeLoadingState();

    try {
      final userId = _authRepository.currentUser?.uid;

      var incomeTransactionsList =
          await _transactionsRepository.getTransactionsList(userId ?? "");
      var incomefilteredList = incomeTransactionsList
          .where((item) => item.type == 'Receita')
          .toList();

      notifier.value = IncomeSuccessState(incomefilteredList);
    } catch (e) {
      notifier.value = IncomeErrorState(e.toString());
    }
  }
}
