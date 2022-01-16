import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  static const heading1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    height: 1.2,
  );

  static const headline1 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.2,
  );

  static const heading2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 1.2,
    decoration: TextDecoration.none,
    color: DarkTheme.white,
  );

  static const heading3 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1.2,
  );

  static const heading4 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.2,
    decoration: TextDecoration.none,
    color: DarkTheme.white,
  );

  static const heading1Bold = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 30,
  );

  static const heading1SemiBold = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30,
  );

  static const heading1Medium = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 30,
    height: 1.2,
  );
  static const heading3Medium = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 20,
    height: 1.2,
    decoration: TextDecoration.none,
    color: DarkTheme.white,
  );

  static const heading3Light = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 20,
    height: 1.2,
    color: DarkTheme.white,
    decoration: TextDecoration.none,
  );

  static const heading4Light = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 16,
    height: 1.2,
    color: DarkTheme.white,
    decoration: TextDecoration.none,
  );

  static const body1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 1.2,
  );

  static const body1Bold = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 17,
    height: 1.2,
  );

  static const small1Light = TextStyle(
    fontWeight: FontWeight.w400,
    color: DarkTheme.subTextColor,
    fontSize: 13,
    height: 1.2,
  );

  static const small1Bold = TextStyle(
    fontWeight: FontWeight.w800,
    color: DarkTheme.bodyTextColor,
    fontSize: 13,
    height: 1.2,
  );
}
