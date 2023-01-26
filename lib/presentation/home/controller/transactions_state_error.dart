import 'package:finance_app/presentation/home/controller/transactions_state.dart';

class TransactionStateError extends TransactionState {
  final String message;
  TransactionStateError(this.message);
}
