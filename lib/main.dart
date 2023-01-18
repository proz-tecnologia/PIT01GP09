import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/home/controller/transactions_controller.dart';
import 'package:test/presentation/income/controller/add_transaction_controller.dart';
import 'package:test/presentation/profile/controller/profile_controller.dart';
import 'package:test/presentation/splash/controller/splash_controller.dart';

import 'firebase_options.dart';
import 'locator.dart';
import 'locator.dart' as locator;
import 'my_app.dart';
import 'presentation/expenses/controller/expenses_controller.dart';
import 'presentation/income/controller/income_controller.dart';
import 'presentation/login/controller/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  locator.setup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddTransactionController(
            transactionsRepository: getIt(),
            authRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileController(
            authRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SplashController(
            authRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthController(
            authRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ExpensesController(
            transactionRepository: getIt(),
            authRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => IncomeController(
            transactionsRepository: getIt(),
            authRepository: getIt(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => TransactionsController(
            transactionsRepository: getIt(),
            authRepository: getIt(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
