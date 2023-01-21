import 'package:flutter/material.dart';
import 'package:finance_app/data/models/datetime_model.dart';
import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/home/controller/transactions_state.dart';

class TransactionsController extends ValueNotifier<TransactionState> {
  final TransactionsRepository _transactionsRepository;
  final AuthRepository _authRepository;

  TransactionsController({
    required TransactionsRepository transactionsRepository,
    required AuthRepository authRepository,
  })  : _transactionsRepository = transactionsRepository,
        _authRepository = authRepository,
        super(TransactionInitialState());

  int _monthFilter = 0;
  int _yearFilter = 0;

  List<TransactionsModel> _transactionsList = [];

  List<TransactionsModel> get transactionsList {
    if (_monthFilter == 0) {
      return _transactionsList;
    } else {
      return _transactionsList
          .where((transactions) =>
              transactions.isAtMonthYear(_monthFilter, _yearFilter))
          .toList();
    }
  }

  void setTransactionsList(List<TransactionsModel> transactionsList) {
    _transactionsList = transactionsList;
  }

  void filterTransactionList(int month, int year) {
    _monthFilter = month;
    _yearFilter = year;
  }

  void fetchTransactionListFromRepository() {
    final userId = _authRepository.currentUser?.uid;
    _transactionsRepository
        .getTransactionsList(userId ?? "")
        .then((value) => setTransactionsList(value));
  }

  List<DateTimeModel> get monthsList {
    Map<String, DateTimeModel> list = {};
    DateTimeModel model = DateTimeModel(date: null);
    list.putIfAbsent(model.name, () => model);
    for (TransactionsModel transaction in _transactionsList) {
      DateTimeModel model = DateTimeModel(date: transaction.date);
      list.putIfAbsent(model.name, () => model);
    }
    return list.values.toList()
      ..sort((a, b) {
        if (a.date == null) {
          return -1;
        }
        if (b.date == null) {
          return 1;
        }
        return a.date!.compareTo(b.date!);
      });
  }

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
