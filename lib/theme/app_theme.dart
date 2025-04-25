import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryColor = Color(0xFF6C63FF); // Purple
  static const Color secondaryColor = Color(0xFF4B45B2); // Deep Purple
  static const Color accentColor = Color(0xFF2C387E); // Dark Blue

  // Background Colors
  static const Color backgroundColor = Color(0xFFF8F9FE); // Light Gray-Blue
  static const Color surfaceColor = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF2D3142); // Dark Gray
  static const Color textSecondary = Color(0xFF9094A6); // Medium Gray
  static const Color textLight = Colors.white;

  // Status Colors
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color error = Color(0xFFFF5252); // Red
  static const Color warning = Color(0xFFFFB74D); // Orange

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF6C63FF),
    Color(0xFF4B45B2),
    Color(0xFF2C387E),
  ];

  // Card Colors
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF2D3142);

  // Workout Category Colors
  static const Map<String, Color> workoutColors = {
    'gym': Color(0xFF7C4DFF), // Deep Purple
    'cardio': Color(0xFF2196F3), // Blue
    'yoga': Color(0xFF4CAF50), // Green
    'hiit': Color(0xFFFF5252), // Red
  };

  // Text Styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: textSecondary,
  );

  // Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardLight,
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textLight,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
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
