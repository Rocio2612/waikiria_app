import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.fondo,
    primaryColor: AppColors.marron,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.marron,
      primary: AppColors.marron,
      secondary: AppColors.marronClaro,
      background: AppColors.fondo,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.fondo,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.marronOscuro),
      titleTextStyle: TextStyle(
        color: AppColors.marronOscuro,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.marronOscuro),
      bodyMedium: TextStyle(color: AppColors.marronOscuro),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.marron,
        foregroundColor: AppColors.blanco,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}