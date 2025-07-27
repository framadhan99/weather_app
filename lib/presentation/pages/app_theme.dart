import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffE4750E)),
      fontFamily: 'Inter',
    );
  }
}
