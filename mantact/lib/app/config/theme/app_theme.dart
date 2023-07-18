import 'package:flutter/material.dart';
import 'package:mantact/app/utils/constants/app_colors.dart';

class AppTheme {
  static ThemeData appLightThemeData = ThemeData(
    textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.appBlack),
        bodyLarge: TextStyle(color: AppColors.appBlack),
        titleSmall: TextStyle(color: AppColors.appBlack, fontSize: 26)),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        background: AppColors.appWhiteBackground),
    useMaterial3: true,
  );

  static ThemeData appDarkThemeData = ThemeData(
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.appPureWhite),
      bodyLarge: TextStyle(color: AppColors.appPureWhite),
      titleSmall: TextStyle(color: AppColors.appPureWhite, fontSize: 26),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor, background: AppColors.appBlack),
    useMaterial3: true,
  );
}
