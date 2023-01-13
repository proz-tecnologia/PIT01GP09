import 'package:test/data/models/transaction_model.dart';

abstract class ExpensesState {}

class ExpensesInitialState extends ExpensesState {}

class ExpensesLoadingState extends ExpensesState {}

class ExpensesSuccessState extends ExpensesState {
  final List<TransactionModel> expensesListModel;

  ExpensesSuccessState(this.expensesListModel);
}

class ExpensesErrorState extends ExpensesState {
  final String message;
  ExpensesErrorState(this.message);
}
