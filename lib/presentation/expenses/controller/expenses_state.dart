import 'package:finance_app/data/models/transactions_model.dart';

abstract class ExpensesState {}

class ExpensesInitialState extends ExpensesState {}

class ExpensesLoadingState extends ExpensesState {}

class ExpensesSuccessState extends ExpensesState {
  final List<TransactionsModel> expensesListModel;

  ExpensesSuccessState(this.expensesListModel);
}

class ExpensesErrorState extends ExpensesState {
  final String message;
  ExpensesErrorState(this.message);
}
