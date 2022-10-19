import 'package:flutter/material.dart';
import 'package:test/resources/colors.dart';

class AppTextStyles {
  static const applicationTitle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const name1 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const filterTitle =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  static const description =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);

  static const example1 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: AppColors.blackSwan,
  );

  static const example2 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}