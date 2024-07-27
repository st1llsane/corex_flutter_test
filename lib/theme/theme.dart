import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1D1D1D),
  primaryColor: Colors.pink,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.pink.shade100,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.pink.shade100,
      backgroundColor: Colors.transparent,
      overlayColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
      minimumSize: const Size(0, 0),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.pink.shade100,
      backgroundColor: const Color(0xFF1D1D1D),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      textStyle: const TextStyle(
        fontSize: 15,
      ),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(Colors.pink.shade100),
    trackColor: WidgetStateProperty.all(Colors.pink.shade100.withOpacity(0.3)),
    thickness: WidgetStateProperty.all(6),
    radius: const Radius.circular(10),
    interactive: true,
    minThumbLength: 10,
  ),
);
