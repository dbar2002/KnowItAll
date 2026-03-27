import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Colors ──────────────────────────────────────────────
  static const Color primary = Color(0xFF6C5CE7);
  static const Color primaryDark = Color(0xFF4A3DB5);
  static const Color secondary = Color(0xFF00CEC9);
  static const Color accent = Color(0xFFFD79A8);
  static const Color correct = Color(0xFF00B894);
  static const Color incorrect = Color(0xFFE17055);
  static const Color surface = Color(0xFF1E1E2E);
  static const Color surfaceLight = Color(0xFF2A2A3E);
  static const Color background = Color(0xFF13132B);
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB0B0CC);
  static const Color gold = Color(0xFFFFD700);

  // ── Category colors ────────────────────────────────────
  static const Map<String, Color> categoryColors = {
    'Science': Color(0xFF74B9FF),
    'History': Color(0xFFFFC078),
    'Geography': Color(0xFF55EFC4),
    'Arts & Literature': Color(0xFFE17055),
    'Sports': Color(0xFFA29BFE),
    'Food & Culture': Color(0xFFFD79A8),
    'Technology': Color(0xFF00CEC9),
  };

  // ── Category icons ─────────────────────────────────────
  static const Map<String, IconData> categoryIcons = {
    'Science': Icons.science_rounded,
    'History': Icons.history_edu_rounded,
    'Geography': Icons.public_rounded,
    'Arts & Literature': Icons.palette_rounded,
    'Sports': Icons.sports_soccer_rounded,
    'Food & Culture': Icons.restaurant_rounded,
    'Technology': Icons.computer_rounded,
  };

  static Color getCategoryColor(String category) =>
      categoryColors[category] ?? primary;

  static IconData getCategoryIcon(String category) =>
      categoryIcons[category] ?? Icons.quiz_rounded;

  // ── Theme data ─────────────────────────────────────────
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
