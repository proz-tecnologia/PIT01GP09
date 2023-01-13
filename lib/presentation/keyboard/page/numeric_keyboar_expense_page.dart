import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';

import '../../../resources/strings.dart';
import 'numeric_keyboard_page.dart';

class NumericKeyboardExpensePage extends StatefulWidget {
  const NumericKeyboardExpensePage({super.key});

  @override
  State<NumericKeyboardExpensePage> createState() =>
      _NumericKeyboardExpensePageState();
}

class _NumericKeyboardExpensePageState
    extends State<NumericKeyboardExpensePage> {
  get color => AppColors.redWine;

  get type => Strings.expense;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: NumericKeyboardPage(
      color: color,
      type: type,
    ));
  }
}
