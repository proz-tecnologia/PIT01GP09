import 'package:finance_app/data/models/transactions_model.dart';

abstract class IncomeState {}

class IncomeInitialState extends IncomeState {}

class IncomeLoadingState extends IncomeState {}

class IncomeSuccessState extends IncomeState {
  final List<TransactionsModel> incomeListModel;

  IncomeSuccessState(this.incomeListModel);
}

class IncomeErrorState extends IncomeState {
  final String message;
  IncomeErrorState(this.message);
}
