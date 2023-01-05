import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test/data/models/transaction_model.dart';
import 'package:test/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Dio _dio;

  TransactionRepositoryImpl(this._dio);

<<<<<<< HEAD
  final _baseUrl = 'https://crudcrud.com/api/51a7c8e76cee41ac8c86d88e374186bb';
=======
  final _baseUrl = 'https://crudcrud.com/api/c94ef50371f04eb489a9d98c077400a7';
>>>>>>> origin/main

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
