import 'package:flutter/material.dart';

class DarkTheme {
  static final lightBlue = Color(0xFF48cae7).withOpacity(0.1);
  static const blueMain = Color(0xFF3D58F8);
  static const blueIllustration = Color(0xFF2C4BA1);
  static const darkBlueIllustration = Color(0xFF1E3577);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFABADBD);
  static const greyBackground = Color(0xFF42476A);
  static const darkGrey = Color(0xFF4E586E);
  static const darkBackground = Color(0xFF242A37);
  static const darkerBackground = Color(0xFF20242F);
  static const red = Color(0xFFFD4C00);
  static const green = Color(0xFF3E9D9D);
  static const yellow = Color(0xFFFFAF34);
  static const text = Colors.white;
  static const subTextColor = Color(0xFF4E586E);
  static const bodyTextColor = Colors.white;

  static ThemeData themeData = ThemeData.dark().copyWith(
      cardColor: darkGrey,
      scaffoldBackgroundColor: darkBackground,
      dividerColor: darkerBackground,
      dividerTheme: const DividerThemeData(
        thickness: 1,
      ),
      appBarTheme: const AppBarTheme(backgroundColor: darkBackground, elevation: 1.0));
}

class GradientPalette {
  static const blue1 = Color(0xFF3E60F9);
  static const blue2 = Color(0xFF3D54F8);
  static const lightBlue1 = Color(0xFF449EFF);
  static final lightBlue2 = const Color(0xFF1DC7F7).withOpacity(0.94);
  static final black1 = const Color(0xFF111D42).withOpacity(0);
  static const black2 = Color(0xFF111D42);
  static const orange = Color(0xFFFF8960);
  static const pink = Color(0xFFFF62A5);
}

// #007AFF

class AppColors {
  static const green = Color(0xFF7ED321);
  static const blue = Color(0xFF007AFF);
  static const orange = Color(0xFFFF9500);
}
