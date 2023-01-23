import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

void main() {
  late MockTransactionsRepository repository;
  late FakeFirebaseFirestore firestoreInstance;

  setUp(() {
    repository = MockTransactionsRepository();
    firestoreInstance = FakeFirebaseFirestore();
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

  group(
    'caso de sucesso - método getTransactionsList',
    () {
      test(
        'deve retornar lista de TransactionsModel',
        () async {
          // arrange
          when(() => repository.getTransactionsList(userId))
              .thenAnswer((_) async => [transactionsModel]);

          // act
          final result = await repository.getTransactionsList(userId);
          // assert
          expect(result, isA<List<TransactionsModel>>());
          expect(result, [transactionsModel]);
        },
      );
    },
  );

  group(
    'caso de falha - método getTransactionsList',
    () {
      test(
        'deve retornar uma exceção',
        () async {
          // arrange
          when(() => repository.getTransactionsList(userId))
              .thenThrow(Exception());

          // assert
          expect(() => repository.getTransactionsList(userId), throwsException);
        },
      );
    },
  );

  group(
    'caso de sucesso - método addTransaction',
    () {
      test(
        'deve adicionar uma nova transação ao firebase',
        () async {
          when(() => repository.addTransaction(transactionsModel))
              .thenAnswer((_) => Future.value());
          // arrange
          final doc1 = await firestoreInstance
              .collection('transactions')
              .add(transactionsModel.toMap());
          // assert

          final docSnap = await firestoreInstance
              .collection('transactions')
              .doc(doc1.id)
              .get();

          expect(doc1.id.length, greaterThanOrEqualTo(20));
          expect(docSnap.get('category'), 'Receitas');
        },
      );
    },
  );

  group(
    'caso de falha - método addTransaction',
    () {
      test(
        'deve retornar uma exceção do firebase',
        () async {
          when(() => repository.addTransaction(transactionsModel))
              .thenThrow(Exception());
          // arrange
          final doc = firestoreInstance.collection('transactions').doc(userId);
          // assert
          whenCalling(Invocation.method(#set, null))
              .on(doc)
              .thenThrow(FirebaseException(plugin: 'firestoreInstance'));

          expect(() => doc.set({'name': 'Bob'}),
              throwsA(isA<FirebaseException>()));
        },
      );
    },
  );
}
