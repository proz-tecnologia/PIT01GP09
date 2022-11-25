import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/data/models/transaction_model.dart';
import 'package:test/data/repositories/transaction_repository_impl.dart';
import 'package:test/locator.dart';
import 'locator.dart' as locator;

import 'my_app.dart';
import 'presentation/home/controller/transaction_controller.dart';

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
      value: 3000.0, 
      date: DateTime.now(),
    ),
  );

  //await httpClient.getTransactionList();

  // await httpClient.updateTransaction(TransactionModel(
  //   id: '6375a9e123685e03e8b8e4a4',
  //       description: 'Compra frutos do mar',
  //       category: 'Compras',
  //       type: 'Despesa',
  //       value: 50.0,
  // ));

  //await httpClient.deleteTransaction('6380dc6523685e03e8b902ee');

  runApp(
    MultiProvider(
      providers: [
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
