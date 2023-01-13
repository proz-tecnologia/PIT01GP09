import 'package:flutter/material.dart';
import 'package:test/resources/text_style.dart';
import 'package:test/resources/strings.dart';

import 'current_balance.dart';
import 'earn_points.dart';
import 'month_picker.dart';
import 'profile.dart';

class CardGradientWidget extends StatelessWidget {
  const CardGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xFF645FFB),
            Color(0xFF05EDE3),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                const SizedBox(
                  height: 67,
                  child: MonthPicker(),
                ),
                InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/profile'),
                    child: const Profile()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 1),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        SizedBox(
                          width: 400,
                          height: 175,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                Strings.greeting,
                                style: AppTextStyles.greeting,
                              ),
                              Image.asset(
                                'assets/images/pig-and-coins.png',
                                width: 249,
                                height: 128,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 178,
                          height: 128,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                Strings.balance,
                                style: AppTextStyles.balance,
                              ),
                              CurrentBalance(),
                              EarnPoints(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
