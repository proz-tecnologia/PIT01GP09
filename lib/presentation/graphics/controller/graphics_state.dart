import 'package:flutter/material.dart';

import '../../../data/models/datetime_model.dart';
import '../../../data/models/transactions_model.dart';

abstract class GraphicsState {}

class GraphicsStateInitial extends GraphicsState {}

class GraphicsStateLoading extends GraphicsState {}

class GraphicsStateError extends GraphicsState {
  final String message;
  GraphicsStateError(this.message);
}

class GraphicsStateSuccess extends GraphicsState {
  final ValueNotifier<List<TransactionsModel>> transactions = ValueNotifier([]);

  late List<TransactionsModel> _cache;

  GraphicsStateSuccess({required List<TransactionsModel> transactions}) {
    _cache = transactions;
    this.transactions.value = _cache;
  }

  applyFilter(int month, int year) {
    List<TransactionsModel> list = _cache
        .where((transaction) => (month == 0 ||
            year == 0 ||
            (transaction.date.month == month && transaction.date.year == year)))
        .toList();
    list.sort((a, b) => a.date.compareTo(b.date));
    transactions.value = list;
  }

  List<DateTimeModel> get monthsList {
    Map<String, DateTimeModel> list = {};
    DateTimeModel model = DateTimeModel(date: null);
    list.putIfAbsent(model.name, () => model);
    for (TransactionsModel transaction in _cache) {
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
}
