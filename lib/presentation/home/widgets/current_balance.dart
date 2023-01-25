import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';

class CurrentBalance extends StatefulWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentBalance> createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<CurrentBalance> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.currentBalance,
      style: AppTextStyles.currentBalance,
    );
  }
}
