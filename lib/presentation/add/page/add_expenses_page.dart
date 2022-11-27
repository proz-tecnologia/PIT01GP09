import 'package:flutter/material.dart';
import 'package:test/presentation/add/page/add_page.dart';
import 'package:test/resources/colors.dart';

const List<String> list = <String>[
  "",
  "Alimentação",
  "Saúde",
  "Pessoal",
  "Lazer",
  "Transporte",
];

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  get color => AppColors.redWine;

  get type => 'Despesa';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AddPage(
      color: color,
      type: type,
      list: list,
    ));
  }
}
