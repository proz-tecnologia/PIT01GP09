import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/transaction_repository_impl.dart';
import 'domain/repositories/transaction_repository.dart';
import 'presentation/home/controller/transaction_controller.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<TransactionController>(
      () => TransactionController(transactionRepository: getIt()));

  getIt.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(getIt()));

  getIt.registerLazySingleton<Dio>(() => Dio());
}
