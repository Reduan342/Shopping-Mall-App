import 'package:flutter/material.dart';

class AppThemes {
  // Light theme
  static final light = ThemeData(
    primaryColor: const Color.fromARGB(255, 2, 136, 209), // teal blue
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black, 
        fontSize: 18, 
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 2, 136, 209),   // teal
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 255, 193, 7), // amber
      onSecondary: Colors.black,
      error: Color.fromARGB(255, 211, 47, 47),     // red
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color.fromARGB(255, 2, 136, 209),
      unselectedItemColor: Colors.grey,
    ),
  );

  // Dark theme
  static final dark = ThemeData(
    primaryColor: const Color.fromARGB(255, 129, 212, 250), // light teal
    scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18), // dark gray
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white, 
        fontSize: 18, 
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 129, 212, 250), // light teal
      onPrimary: Colors.black,
      secondary: Color.fromARGB(255, 255, 179, 0), // amber accent
      onSecondary: Colors.black,
      error: Color.fromARGB(255, 244, 67, 54),     // red
      onError: Colors.black,
      surface: Color.fromARGB(255, 30, 30, 30),
      onSurface: Colors.white,
    ),
    cardColor: const Color.fromARGB(255, 30, 30, 30),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      selectedItemColor: Color.fromARGB(255, 129, 212, 250),
      unselectedItemColor: Colors.grey,
    ),
  );
}
