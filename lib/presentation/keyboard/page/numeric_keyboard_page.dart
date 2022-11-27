import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class NumericKeyboardPage extends StatefulWidget {
  const NumericKeyboardPage({super.key});

  @override
  State<NumericKeyboardPage> createState() => _NumericKeyboardPageState();
}

class _NumericKeyboardPageState extends State<NumericKeyboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        backgroundColor: AppColors.blueVibrant,
        elevation: 0,
      ),
    );
  }
}
