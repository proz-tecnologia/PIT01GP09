import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:finance_app/presentation/income/controller/add_transaction_controller.dart';
import 'package:finance_app/presentation/income/controller/add_transaction_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

class MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockTransactionsRepository transactionRepository;
  late MockAuthRepository authRepository;
  late AddTransactionController addTransactionController;
  late FakeFirebaseFirestore firebaseFirestore;

  setUp(() {
    transactionRepository = MockTransactionsRepository();
    authRepository = MockAuthRepository();
    firebaseFirestore = FakeFirebaseFirestore();
    addTransactionController = AddTransactionController(
      authRepository: authRepository,
      transactionsRepository: transactionRepository,
    );
  });

  const userId = 'userId345';

  final transactionsModel = TransactionsModel(
      category: 'Receitas',
      date: DateTime.now(),
      description: 'Venda',
      type: 'Receita',
      userId: userId,
      value: 100);

  group('caso de sucesso - método addTransaction', () {
    test(
      'deve retornar um estado de AddTransactionInitialState',
      () async {
        when(() => transactionRepository.addTransaction(transactionsModel))
            .thenAnswer((_) async => Future.value());

        await firebaseFirestore
            .collection('transactions')
            .add(transactionsModel.toMap());
        // act
        await transactionRepository.addTransaction(transactionsModel);
        // assert
        expect(
            addTransactionController.state, isA<AddTransactionInitialState>());
      },
    );
  });

  group('caso de falha - método addTransaction', () {
    test(
      'deve retornar um estado de erro',
      () async {
        // arrange
        when(() => addTransactionController.addTransaction(transactionsModel))
            .thenThrow(Exception('Erro'));

        when(() => transactionRepository.addTransaction(transactionsModel))
            .thenThrow(Exception('Erro'));
        // act
        await addTransactionController.addTransaction(transactionsModel);
        // assert
        expect(addTransactionController.state, isA<AddTransactionErrorState>());
      },
    );
  });
}
