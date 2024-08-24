import 'package:flutter/material.dart';
import '/assets/app_colors.dart';
import '/assets/app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTypography.text18Bold.copyWith(color: AppColors.titleColorLight),
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTypography.text18Bold.copyWith(color: AppColors.titleColorDark),
      ),
    );
  }
}