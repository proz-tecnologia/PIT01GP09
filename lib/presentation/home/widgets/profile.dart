import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: AppColors.grayTwo.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(1, 4))
        ],
      ),
      child: CircleAvatar(
        radius: 65,
        child: Image.asset('assets/images/user-pic.png'),
      ),
    );
  }
}
