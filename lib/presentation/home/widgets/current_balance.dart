import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.currentBalance,
      style: AppTextStyles.currentBalance,
    );
  }
}
