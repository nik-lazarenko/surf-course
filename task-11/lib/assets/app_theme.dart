import 'package:flutter/material.dart';
import '/assets/colors.dart';

abstract class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.brightGreen,
        onPrimary: AppColors.white,
        secondary: AppColors.darkGrey,
        onSecondary: AppColors.black,
        error: AppColors.red,
        onError: AppColors.red,
        background: AppColors.white,
        onBackground: AppColors.lightGrey,
        surface: AppColors.brightGreen,
        onSurface: AppColors.black),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
  );
}