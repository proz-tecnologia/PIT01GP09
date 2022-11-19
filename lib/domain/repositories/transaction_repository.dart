import 'package:test/data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<List<TransactionModel>> getTransactionList();

  Future<TransactionModel> createTransaction(TransactionModel transactionModel);

  Future<void> updateTransaction(TransactionModel transactionModel);

  Future<void> deleteTransaction(String transactionId);
}
