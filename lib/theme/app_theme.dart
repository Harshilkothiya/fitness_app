import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryColor = Color(0xFF1976D2); // Blue
  static const Color secondaryColor = Color(0xFFFF9800); // Orange
  static const Color accentColor = Color(0xFFFF9800); // Orange

  // Background Colors
  static const Color backgroundColor = Colors.white; // Pure White
  static const Color surfaceColor = Color(0xFFF5F7FA); // Very Light Gray

  // Text Colors
  static const Color textPrimary = Color(0xFF222B45); // Almost Black
  static const Color textSecondary = Color(0xFF6E7582); // Soft Gray
  static const Color textLight = Colors.white;

  // Status Colors
  static const Color success = Color(0xFF43A047); // Green
  static const Color error = Color(0xFFD32F2F); // Red
  static const Color warning = Color(0xFFFFA000); // Orange

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF1976D2),
    Color(0xFF42A5F5),
    Color(0xFFFF9800),
  ];

  // Card Colors
  static const Color cardLight = Color(0xFFF5F7FA);
  static const Color cardDark = Color(0xFF222B45);

  // Workout Category Colors
  static const Map<String, Color> workoutColors = {
    'gym': Color(0xFF1976D2), // Blue
    'cardio': Color(0xFFFF9800), // Orange
    'yoga': Color(0xFF43A047), // Green
    'hiit': Color(0xFFD32F2F), // Red
  };

  // Text Styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: 1.2,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: 1.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: textSecondary,
    height: 1.4,
  );

  // Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardLight,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textLight,
    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    elevation: 2,
    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  );

  // Input Decoration
  static InputDecoration textFieldDecoration(String hint, IconData? icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: bodyMedium,
      prefixIcon: icon != null ? Icon(icon, color: textSecondary) : null,
      filled: true,
      fillColor: backgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primaryColor),
      ),
    );
  }

  // Bottom Navigation Bar Theme
  static BottomNavigationBarThemeData bottomNavTheme =
      BottomNavigationBarThemeData(
    backgroundColor: surfaceColor,
    selectedItemColor: primaryColor,
    unselectedItemColor: textSecondary,
    selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    elevation: 8,
  );
}
