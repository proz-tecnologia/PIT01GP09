import 'package:finance_app/data/models/transactions_model.dart';

abstract class TransactionsRepository {
  Future<List<TransactionsModel>> getTransactionsList(String userId);

  Future<void> addTransaction(TransactionsModel transactionsModel);

  // Future<void> updateTransaction(TransactionsModel TransactionsModel);

  // Future<void> deleteTransaction(String transactionId);
}
