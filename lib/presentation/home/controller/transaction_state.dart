import 'package:test/data/models/transaction_model.dart';

abstract class TransactionState {}

class TransactionInitialState extends TransactionState {}

class TransactionLoadingState extends TransactionState {}

class TransactionSuccessState extends TransactionState {
  final List<TransactionModel> transactionListModel;
  
  TransactionSuccessState(this.transactionListModel);
}

class TransactionErrorState extends TransactionState {
  final String message;
  TransactionErrorState(this.message);
}