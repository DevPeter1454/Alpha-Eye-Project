import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cores.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = _themeData(_lightColorScheme);

  /// The app was designed in a light theme mode so, there's no dark theme data
  /// for now
  // static final _darkTheme = ThemeData();

  static _themeData(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        textTheme: GoogleFonts.robotoTextTheme(
          _textTheme(colorScheme),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      );

  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.sdn700,
    secondaryContainer: AppColors.white,
    onBackground: AppColors.white,
    onSurface: AppColors.grey,
  );

  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        headline4: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: colorScheme.onBackground,
        ),
        bodyText2: TextStyle(
          color: colorScheme.onSurface,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
      );
}
