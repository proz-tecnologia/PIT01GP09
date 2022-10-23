import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';
import '../../../resources/colors.dart';

class EarnPoints extends StatelessWidget {
  const EarnPoints({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          width: screenWidth * 0.3442,
          height: screenHeight * 0.0280,
          alignment: AlignmentDirectional.centerEnd,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.whiteSnow,
              width: screenWidth * 0.0070,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: screenWidth * 0.2930,
            height: screenHeight * 0.0215,
            alignment: AlignmentDirectional.center,
            child: const Text(
              Strings.earnPoints,
              style: AppTextStyles.example2,
            ),
          ),
        ),
        CircleAvatar(
          radius: screenWidth * 0.0523,
          backgroundColor: AppColors.whiteSnow,
          child: const Icon(
            Icons.emoji_events,
            color: AppColors.amberPeach,
          ),
        ),
      ],
    );
  }
}
