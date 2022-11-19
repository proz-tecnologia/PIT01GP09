import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/locator.dart';
//import 'package:data/models/transaction_model.dart';
import 'locator.dart' as locator;

import 'my_app.dart';
import 'presentation/home/controller/transaction_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  locator.setup();
  // final Dio dio = Dio();
  // final httpClient = TransactionRepositoryImpl(dio);

  // await httpClient.createTransaction(
  //   TransactionModel(
  //     description: 'Compra chocolate',
  //     category: 'Compras',
  //     type: 'Despesa',
  //     value: 50.0,
  //   ),
  // );

  //await httpClient.getTransactionList();

  // await httpClient.updateTransaction(TransactionModel(
  //   id: '6375a9e123685e03e8b8e4a4',
  //       description: 'Compra frutos do mar',
  //       category: 'Compras',
  //       type: 'Despesa',
  //       value: 50.0,
  // ));

  //await httpClient.deleteTransaction('6375a9e123685e03e8b8e4a4');

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
