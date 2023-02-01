import 'package:finance_app/data/models/transactions_model.dart';

abstract class TransactionsRepository {
  Future<List<TransactionsModel>> getTransactionsList(String userId);

  Future<void> addTransaction(TransactionsModel transactionsModel);

  Future<bool> deleteTransaction(String transactionId);

  Future<bool> updateTransaction(TransactionsModel transactionsModel);
}
