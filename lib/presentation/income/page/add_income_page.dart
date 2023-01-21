import 'package:flutter/material.dart';
import 'package:finance_app/resources/shared_widgets/add_new_transaction_widget.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/utils/list_income_util.dart';

import '../../../resources/strings.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: AddNewTransactionWidget(
      color: AppColors.greenVibrant,
      type: Strings.income,
      list: listIncome,
    ));
  }
}
