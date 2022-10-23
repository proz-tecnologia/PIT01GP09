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
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
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
        padding: EdgeInsets.only(
          top: screenHeight * 0.0149,
          left: screenWidth * 0.0372,
          right: screenWidth * 0.0372,
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                SizedBox(
                  width: screenWidth * 0.9302,
                  height: screenHeight * 0.0625,
                  child: const MonthPicker(),
                ),
                SizedBox(
                  width: screenWidth * 0.1512,
                  height: screenHeight * 0.0607,
                  child: const Profile(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0149, bottom: screenHeight * 0.0074),
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  SizedBox(
                    width: screenWidth * 0.9302,
                    height: screenHeight * 0.1633,
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
                          width: screenWidth * 0.5791,
                          height: screenHeight * 0.1195,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.4139,
                    height: screenHeight * 0.1195,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          Strings.balance,
                          style: AppTextStyles.example2,
                        ),
                        const CurrentBalance(),
                        EarnPoints(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
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
