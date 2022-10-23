import 'package:flutter/material.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';

class MonthPicker extends StatelessWidget {
  const MonthPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          Strings.month,
          textAlign: TextAlign.center,
          style: AppTextStyles.example2,
        ),
        Icon(
          Icons.keyboard_arrow_up,
          color: AppColors.whiteSnow,
        )
      ],
    );
  }
}
