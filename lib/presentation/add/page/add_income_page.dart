import 'package:flutter/material.dart';
import 'package:test/presentation/add/page/add_page.dart';
import 'package:test/resources/colors.dart';

const List<String> list = <String>[
  "",
  "Salário",
  "Renda",
  "Venda",
  "Freelance",
];

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  get color => AppColors.greenVibrant;

  get type => 'Receita';

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
