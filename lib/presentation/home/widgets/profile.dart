import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 30,
            blurStyle: BlurStyle.normal,
            offset: const Offset(1, 4),
          ),
        ],
      ),
      child: Image.asset(
        'assets/images/user-pic.png',
      ),
    );
  }
}
