import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';
import '../../../resources/strings.dart';
import 'card_tips.dart';

class CardEducationWidget extends StatefulWidget {
  const CardEducationWidget({super.key});

  @override
  State<CardEducationWidget> createState() => _CardEducationWidgetState();
}

class _CardEducationWidgetState extends State<CardEducationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
        child: Text(
          Strings.financialEducation,
          style: TextStyle(
            color: AppColors.blackSwan,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          height: 222,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              children: const [
                CardTips(),
                SizedBox(width: 20),
                CardTips(),
                SizedBox(width: 20),
                CardTips(),
                SizedBox(width: 20),
                CardTips(),
              ],
            )
          ])),
    ]);
  }
}
