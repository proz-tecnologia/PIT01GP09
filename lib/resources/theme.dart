import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/resources/text_style.dart';

class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.interTextTheme(_lightTextTheme),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.black,
    ),
  );

  static final dark = ThemeData(
    textTheme: GoogleFonts.interTextTheme(_darkTextTheme),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      onSecondary: Colors.white,
    ),
  );

  static const _lightTextTheme = TextTheme(
    headlineMedium: AppTextStyles.applicationTitle,
    headlineSmall: AppTextStyles.name1,
    titleMedium: AppTextStyles.filterTitle,
    bodyLarge: AppTextStyles.description,
    labelLarge: AppTextStyles.example1,
    labelMedium: AppTextStyles.example2,
  );

  static final _darkTextTheme = TextTheme(
    headlineMedium: AppTextStyles.applicationTitle.copyWith(
      color: Colors.white,
    ),
    headlineSmall: AppTextStyles.name1,
    titleMedium: AppTextStyles.filterTitle,
    bodyLarge: AppTextStyles.description,
    labelLarge: AppTextStyles.example1,
    labelMedium: AppTextStyles.example2,
  );
}