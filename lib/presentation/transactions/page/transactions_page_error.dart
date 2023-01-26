import 'package:finance_app/presentation/home/controller/transactions_state_error.dart';
import 'package:flutter/material.dart';

class TransactionsPageError extends StatelessWidget {
  final TransactionStateError state;
  const TransactionsPageError({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.message),
    );
  }
}
