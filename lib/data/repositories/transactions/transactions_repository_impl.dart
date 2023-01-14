import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/data/models/transactions_model.dart';
import 'package:test/domain/repositories/transactions/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TransactionsModel>> getTransactionsList(String userId) async {
    final result = await _firestore
        .collection("transactions")
        .where("userId", isEqualTo: userId)
        .get();

    final transactionsList = List<TransactionsModel>.from(result.docs
        .map((doc) => TransactionsModel.fromMap(doc.id, doc.data())));

    return transactionsList;
  }
}
