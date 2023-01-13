import 'package:test/data/models/transactions_model.dart';

abstract class TransactionState {}

class TransactionInitialState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionSuccessState extends TransactionState {
  final List<TransactionsModel> transactionListModel;

  TransactionSuccessState(this.transactionListModel);
}

class TransactionErrorState extends TransactionState {
  final String message;
  TransactionErrorState(this.message);
}
