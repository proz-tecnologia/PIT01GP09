import 'package:finance_app/presentation/home/controller/transactions_state_loading.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:flutter/material.dart';

class TransactionsPageLoading extends StatelessWidget {
  final TransactionStateLoading state;
  const TransactionsPageLoading({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.greenVibrant,
    ));
  }
}
