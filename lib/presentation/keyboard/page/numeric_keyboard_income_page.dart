import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';

import '../../../resources/strings.dart';
import 'numeric_keyboard_page.dart';

class NumericKeyboardIncomePage extends StatefulWidget {
  const NumericKeyboardIncomePage({super.key});

  @override
  State<NumericKeyboardIncomePage> createState() =>
      _NumericKeyboardIncomePageState();
}

class _NumericKeyboardIncomePageState extends State<NumericKeyboardIncomePage> {
  get color => AppColors.greenVibrant;

  get type => Strings.income;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: NumericKeyboardPage(
      color: color,
      type: type,
    ));
  }
}
