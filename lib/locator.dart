import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:finance_app/data/repositories/transactions/transactions_repository_impl.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/home/controller/transactions_controller.dart';
import 'package:finance_app/presentation/income/controller/add_transaction_controller.dart';
import 'package:finance_app/data/repositories/transactions/transactions_repository_impl.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/home/controller/transactions_controller.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/authentication/auth_repository_impl.dart';
import 'domain/repositories/authentication/auth_repository.dart';
import 'presentation/expenses/controller/expenses_controller.dart';
import 'presentation/income/controller/add_transaction_controller.dart';
import 'presentation/income/controller/income_controller.dart';
import 'presentation/login/controller/auth_controller.dart';
import 'presentation/profile/controller/profile_controller.dart';
import 'presentation/splash/controller/splash_controller.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AddTransactionController>(() =>
      AddTransactionController(
          transactionsRepository: getIt(), authRepository: getIt()));

  getIt.registerLazySingleton<ProfileController>(
      () => ProfileController(authRepository: getIt()));

  getIt.registerLazySingleton<SplashController>(
      () => SplashController(authRepository: getIt()));

  getIt.registerLazySingleton<AuthController>(
      () => AuthController(authRepository: getIt()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(FirebaseAuth.instance));

  getIt.registerLazySingleton<ExpensesController>(() => ExpensesController(
      transactionRepository: getIt(), authRepository: getIt()));

  getIt.registerLazySingleton<IncomeController>(() => IncomeController(
        transactionsRepository: getIt(),
        authRepository: getIt(),
      ));

  getIt.registerLazySingleton<TransactionsController>(() =>
      TransactionsController(
          transactionsRepository: getIt(), authRepository: getIt()));

  getIt.registerLazySingleton<TransactionsRepository>(
      () => TransactionsRepositoryImpl());
}
