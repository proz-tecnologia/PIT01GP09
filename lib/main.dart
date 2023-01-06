import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/locator.dart';
import 'data/models/transaction_model.dart';
import 'data/repositories/transaction_repository_impl.dart';
import 'locator.dart' as locator;

import 'my_app.dart';
import 'presentation/expenses/controller/expenses_controller.dart';
import 'presentation/home/controller/transaction_controller.dart';
import 'presentation/income/controller/income_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  locator.setup();
  final Dio dio = Dio();
  final httpClient = TransactionRepositoryImpl(dio);

  await httpClient.createTransaction(
    TransactionModel(
      description: 'Herança de família',
      category: 'Herança',
      type: 'Receita',
      value: 9000.0,
      date: DateTime.now(),
    ),
  );

  // await httpClient.getTransactionList();

  // await httpClient.updateTransaction(TransactionModel(
  //   id: '51a7c8e76cee41ac8c86d88e374186bb',
  //       description: 'Compra frutos do mar',
  //       category: 'Compras',
  //       type: 'Despesa',
  //       value: 50.0,
  // ));

  // await httpClient.deleteTransaction('51a7c8e76cee41ac8c86d88e374186bb');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ExpensesController(
            transactionRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => IncomeController(
            transactionRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => TransactionController(
            transactionRepository: getIt(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
