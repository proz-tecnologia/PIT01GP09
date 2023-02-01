import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/shared_widgets/add_new_transaction_widget.dart';
import 'package:finance_app/utils/list_income_util.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings.dart';

class AddIncomePage extends StatelessWidget {
  final TransactionsModel? transaction;
  const AddIncomePage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AddNewTransactionWidget(
      color: AppColors.greenVibrant,
      type: Strings.income,
      list: listIncome,
      transaction: transaction,
    ));
  }
}
