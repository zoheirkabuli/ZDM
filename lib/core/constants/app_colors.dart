import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF667eea);
  static const Color primaryDark = Color(0xFF5a6fd8);
  static const Color primaryLight = Color(0xFF8b9cfa);
  // Status Colors
  static const Color downloading = Color(0xFF667eea);
  static const Color completed = Color(0xFF22c55e);
  static const Color paused = Color(0xFFf59e0b);
  static const Color failed = Color(0xFFef4444);
  // Neutral Colors
  static const Color background = Color(0xFFf8f9fa);
  static const Color surface = Color(0xFFffffff);
  static const Color textPrimary = Color(0xFF2c3e50);
  static const Color textSecondary = Color(0xFF6c757d);
}

// Usage example: LinearProgressIndicator( value: 0.75, backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(AppColors.downloading), )
