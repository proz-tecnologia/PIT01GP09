import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../../resources/strings.dart';

class CardEducationWidget extends StatefulWidget {
  const CardEducationWidget({super.key});

  @override
  State<CardEducationWidget> createState() => _CardEducationWidgetState();
}

class _CardEducationWidgetState extends State<CardEducationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width,
      color: AppColors.graySuperLight,
      child: const Text(Strings.financialEducation),
    );
  }
}
