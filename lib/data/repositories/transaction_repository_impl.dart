import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test/data/models/transaction_model.dart';
import 'package:test/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Dio _dio;

  TransactionRepositoryImpl(this._dio);

  final _baseUrl = 'https://crudcrud.com/api/a304393de252455bb2c3dce5bcaa47e5';

  @override
  Future<List<TransactionModel>> getTransactionList() async {
     final Response response = await _dio.get(
      '$_baseUrl/transactions',
    );
    final list = List.from(response.data);
    final result = list.map((e) => TransactionModel.fromMap(e)).toList();
    log('list $result');
    return result;
  }

  @override
  Future<TransactionModel> createTransaction(
      TransactionModel transactionModel) async {
    final Response response = await _dio.post(
      '$_baseUrl/transactions',
      data: {
        'description': transactionModel.description,
        'category': transactionModel.category,
        'type': transactionModel.type,
        'value': transactionModel.value,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ),
    );
    log('create $response');
    final todos = TransactionModel.fromMap(response.data);
    return todos;
  }

  @override
  Future<void> updateTransaction(TransactionModel transactionModel) async {
    final response = await _dio.put(
      '$_baseUrl/transactions/${transactionModel.id}',
      data: {
        'description': transactionModel.description,
        'category': transactionModel.category,
        'type': transactionModel.type,
        'value': transactionModel.value,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ),
    );
    response;
    log('update ${response.statusCode}');
  }

  @override
  Future<void> deleteTransaction(String transactionId) async {
    final response = await _dio.delete(
      '$_baseUrl/transactions/$transactionId',
      options: Options(
        headers: <String, String>{'Content-Type': 'text/plain'},
      ),
    );
    log('delete $response');
  }
}
