import 'package:flutter/material.dart';
import 'package:mantact/app/utils/constants/app_colors.dart';

class AppTheme {
  static ThemeData appLightThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
  );

  static ThemeData appDarkThemeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
  );
}
