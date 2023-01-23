import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/expenses/controller/expenses_controller.dart';
import 'package:finance_app/presentation/expenses/controller/expenses_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

class UserMock extends Mock implements User {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockTransactionsRepository transactionRepository;
  late MockAuthRepository authRepository;
  late ExpensesController expensesController;

  setUp(() {
    transactionRepository = MockTransactionsRepository();
    authRepository = MockAuthRepository();
    expensesController = ExpensesController(
      authRepository: authRepository,
      transactionRepository: transactionRepository,
    );
  });

  const String userId = 'user345';

  final transactionsModel = TransactionsModel(
      id: userId,
      category: 'Receitas',
      date: DateTime.now(),
      description: 'Venda',
      type: 'Receita',
      userId: 'xpto',
      value: 100);

  group('caso de sucesso - método getExpensesTransactionsList', () {
    test(
      'deve retornar uma lista de TransactionsModel de Despesas',
      () async {
        // arrange
        when(() => expensesController.getExpensesTransactionsList())
            .thenAnswer((_) async => [transactionsModel]);

        when(() => transactionRepository
                .getTransactionsList(authRepository.currentUser?.uid ?? ''))
            .thenAnswer((_) async => [transactionsModel]);
        // act
        await expensesController.getExpensesTransactionsList();
        // assert
        expect(expensesController.value, isA<ExpensesSuccessState>());
      },
    );
  });

  group('caso de falha - método getExpensesTransactionsList', () {
    test(
      'deve retornar um estado de erro',
      () async {
        // arrange
        when(() => expensesController.getExpensesTransactionsList())
            .thenThrow(Exception('Erro'));

        when(() => transactionRepository
                .getTransactionsList(authRepository.currentUser?.uid ?? ''))
            .thenThrow(Exception('Erro'));
        // act
        await expensesController.getExpensesTransactionsList();
        // assert
        expect(expensesController.value, isA<ExpensesErrorState>());
      },
    );
  });
}
