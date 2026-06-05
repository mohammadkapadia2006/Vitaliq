import 'package:flutter/material.dart';

class AppColors {
  // Private constructor — no one can create an instance of this class
  AppColors._();

  // ── Brand Colors ──
  static const primary = Color(0xFF6C63FF);        // Purple — main brand color
  static const primaryLight = Color(0xFF9B94FF);   // Lighter purple
  static const primaryDark = Color(0xFF4B44CC);    // Darker purple

  // ── Accent ──
  static const accent = Color(0xFF00D4AA);         // Teal green — for success/health
  static const accentLight = Color(0xFF5FFFD8);
  static const accentDark = Color(0xFF00A382);

  // ── Health metric colors ──
  static const steps = Color(0xFF6C63FF);          // Purple for steps
  static const heartRate = Color(0xFFFF6584);      // Red/pink for heart rate
  static const calories = Color(0xFFFF9F43);       // Orange for calories
  static const sleep = Color(0xFF4B7BEC);          // Blue for sleep
  static const water = Color(0xFF45AAF2);          // Light blue for water
  static const weight = Color(0xFF26DE81);         // Green for weight

  // ── Status Colors ──
  static const success = Color(0xFF26DE81);        // Green
  static const warning = Color(0xFFFF9F43);        // Orange
  static const error = Color(0xFFFF6584);          // Red
  static const info = Color(0xFF45AAF2);           // Blue

  // ── Light Theme ──
  static const lightBackground = Color(0xFFF8F9FE);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF1A1A2E);
  static const lightTextSecondary = Color(0xFF6B7280);
  static const lightBorder = Color(0xFFE5E7EB);

  // ── Dark Theme ──
  static const darkBackground = Color(0xFF0F0F1A);
  static const darkSurface = Color(0xFF1A1A2E);
  static const darkCard = Color(0xFF242438);
  static const darkText = Color(0xFFF8F9FE);
  static const darkTextSecondary = Color(0xFF9CA3AF);
  static const darkBorder = Color(0xFF2D2D44);

  // ── Gradient ──
  static const gradientStart = Color(0xFF6C63FF);
  static const gradientEnd = Color(0xFF00D4AA);

  static const primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF9B94FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}