import 'package:flutter/material.dart';

class AppTheme {
  static const Color electricBlue = Color(0xFF007BFF);
  static const Color neonOrange = Color(0xFFFFA500);
  static const Color charcoalGray = Color(0xFF1C1C1C);
  static const Color successGreen = Color(0xFF28A745);
  static const Color alertRed = Color(0xFFFF3B3B);

  static ThemeData theme = ThemeData(
    primarySwatch: MaterialColor(0xFF007BFF, {
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: electricBlue,
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    }),
    scaffoldBackgroundColor: charcoalGray,
    appBarTheme: AppBarTheme(
      backgroundColor: charcoalGray,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.grey[300]),
    ),
    cardTheme: CardThemeData(
      color: Color(0xFF2C2C2C),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: neonOrange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),
  );
}
