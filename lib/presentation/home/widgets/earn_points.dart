import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';
import '../../../resources/colors.dart';

class EarnPoints extends StatelessWidget {
  const EarnPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          width: 148,
          height: 30,
          alignment: AlignmentDirectional.centerEnd,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.whiteSnow,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 126,
            height: 23,
            alignment: AlignmentDirectional.center,
            child: const Text(
              Strings.earnPoints,
              style: AppTextStyles.example2,
            ),
          ),
        ),
        const CircleAvatar(
          radius: 22.5,
          backgroundColor: AppColors.whiteSnow,
          child: Icon(
            Icons.emoji_events,
            color: AppColors.amberPeach,
          ),
        ),
      ],
    );
  }
}
