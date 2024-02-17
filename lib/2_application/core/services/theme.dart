import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _scaffoldBackgroundColor = Colors.blueGrey.shade50;
  static const Color _lightPrimaryColor = Color.fromRGBO(125, 241, 128, 0.8);
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static const Color _lightOnPrimaryColor = Color.fromRGBO(125, 241, 128, 0.8);
  static const Color _lightTextColorPrimary = Colors.white;
  static const Color _appbarColorLight = Color.fromRGBO(76, 255, 33, 0.8);

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(76, 255, 33, 1.0);

  static const TextStyle _lightHeadingText1 = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontSize: 40,
  );

  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightHeadingTextSmall = TextStyle(
      color: _darkPrimaryVariantColor,
      fontFamily: "Rubik",
      fontSize: 16,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightBodyTextLarge = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static const TextStyle _lightBodyTextMedium = TextStyle(
      color: _darkPrimaryVariantColor,
      fontFamily: "Rubik",
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 17);

  static const TextStyle _lightBodyTextSmall = TextStyle(
      color: _darkPrimaryVariantColor,
      fontFamily: "Rubik",
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16);

  static const TextTheme _lightTextTheme = TextTheme(
      displayLarge: _lightHeadingText1,
      displayMedium: _lightHeadingText,
      displaySmall: _lightHeadingTextSmall,
      bodyLarge: _lightBodyTextLarge,
      bodyMedium: _lightBodyTextMedium,
      bodySmall: _lightBodyTextSmall);

  static final TextStyle _darkThemeHeadingTextStyle1 =
      _lightHeadingText1.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeHeadingTextStyleSmall =
      _lightHeadingTextSmall.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyTextStyle =
      _lightBodyTextLarge.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyTextStyleMedium =
      _lightBodyTextMedium.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyTextStyleSmall =
      _lightBodyTextSmall.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
      displayLarge: _darkThemeHeadingTextStyle1,
      displayMedium: _darkThemeHeadingTextStyle,
      displaySmall: _darkThemeHeadingTextStyleSmall,
      bodyLarge: _darkThemeBodyTextStyle,
      bodyMedium: _darkThemeBodyTextStyleMedium,
      bodySmall: _darkThemeBodyTextStyleSmall);
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
          color: _appbarColorLight,
          iconTheme: IconThemeData(color: _iconColor)),
      colorScheme: ColorScheme.light(
        primary: _lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        secondary: _accentColor,
        primaryContainer: _lightPrimaryVariantColor,
      ),
      textTheme: _lightTextTheme,
      bottomAppBarTheme: const BottomAppBarTheme(color: _appbarColorLight));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _accentColor,
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme,
      bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark));
}
