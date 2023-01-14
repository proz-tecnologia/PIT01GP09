import 'package:test/data/models/transactions_model.dart';

abstract class TransactionsRepository {
  Future<List<TransactionsModel>> getTransactionsList(String userId);

  // Future<TransactionsModel> createTransaction(
  //     TransactionsModel TransactionsModel);

  // Future<void> updateTransaction(TransactionsModel TransactionsModel);

  // Future<void> deleteTransaction(String transactionId);
}
