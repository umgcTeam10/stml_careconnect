import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1F6AE1);

  // Light theme colors
  static const lightBackground = Color(0xFFF5F5F5);
  static const lightCard = Colors.white;
  static const lightTextPrimary = Colors.black87;
  static const lightTextSecondary = Colors.black54;

  // Dark theme colors
  static const darkBackground = Color(0xFF0E0E2C);
  static const darkCard = Color(0xFF1E1E38);
  static const darkTextPrimary = Colors.white;
  static const darkTextSecondary = Colors.white70;
}

class AppTextStyles {
  static const header = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);

  static const title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const body = TextStyle(fontSize: 16);

  static const caption = TextStyle(fontSize: 14, color: Colors.grey);
}

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(primary: AppColors.primary),
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightCard,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.header,
      headlineMedium: AppTextStyles.title,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.caption, // updated
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.dark(primary: AppColors.primary),
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkCard,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.header,
      headlineMedium: AppTextStyles.title,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.caption, // updated
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
