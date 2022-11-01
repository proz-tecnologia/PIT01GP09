import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';

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
      margin: const EdgeInsets.only(left: 16, top: 20),
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width,
      color: AppColors.amberPeach,
      child: const Text(
        Strings.financialEducation,
        style: TextStyle(
          color: AppColors.blackSwan,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
