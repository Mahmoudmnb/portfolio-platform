import 'package:flutter/material.dart';

const canvasColor = Color(0xFFF7F8F6);
const ink = Color(0xFF172A27);
const muted = Color(0xFF5D706C);
const teal = Color(0xFF126B5A);
ThemeData brandTheme() {
  final scheme =
      ColorScheme.fromSeed(
        seedColor: teal,
        brightness: Brightness.light,
      ).copyWith(
        primary: teal,
        surface: Colors.white,
        onSurface: ink,
        error: const Color(0xFFB53B35),
        outline: const Color(0xFFDCE5E0),
      );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: canvasColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 32,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: ink,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 26,
        height: 1.31,
        fontWeight: FontWeight.w700,
        color: ink,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 18,
        height: 1.44,
        fontWeight: FontWeight.w600,
        color: ink,
      ),
      bodyMedium: TextStyle(fontSize: 14, height: 1.57, color: ink),
      bodySmall: TextStyle(fontSize: 12, height: 1.5, color: muted),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: canvasColor,
      foregroundColor: ink,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide.none,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.all(16),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 52),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(minimumSize: const Size(48, 48)),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: Color(0xFFE5F2EC),
    ),
  );
}
