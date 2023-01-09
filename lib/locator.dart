import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/authentication/auth_repository_impl.dart';
import 'data/repositories/transaction/transaction_repository_impl.dart';
import 'domain/repositories/authentication/auth_repository.dart';
import 'domain/repositories/transaction/transaction_repository.dart';
import 'presentation/expenses/controller/expenses_controller.dart';
import 'presentation/home/controller/transaction_controller.dart';
import 'presentation/income/controller/income_controller.dart';
import 'presentation/login/controller/auth_controller.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AuthController>(
      () => AuthController(authRepository: getIt()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl());

  getIt.registerLazySingleton<ExpensesController>(
      () => ExpensesController(transactionRepository: getIt()));

  getIt.registerLazySingleton<IncomeController>(
      () => IncomeController(transactionRepository: getIt()));

  getIt.registerLazySingleton<TransactionController>(
      () => TransactionController(transactionRepository: getIt()));

  getIt.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(getIt()));

  getIt.registerLazySingleton<Dio>(() => Dio());
}
