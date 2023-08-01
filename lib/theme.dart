import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:points_rewards/colors.dart';

class InductionAppTheme {
  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: InductionAppColor.red, brightness: Brightness.dark),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: InductionAppColor.red,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    primaryColor: InductionAppColor.yellow,
    hintColor: Colors.deepPurpleAccent,
    primaryColorDark: InductionAppColor.deepPurple[700],
    primaryColorLight: InductionAppColor.deepPurple[200],
    canvasColor: Colors.white,
    scaffoldBackgroundColor: InductionAppColor.red,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
    brightness: Brightness.dark,
    primarySwatch: InductionAppColor.deepPurple,
    dividerTheme: const DividerThemeData(thickness: 0.8),
    chipTheme: const ChipThemeData(
      padding: EdgeInsets.zero,
      labelStyle: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
      minVerticalPadding: 9,
      minLeadingWidth: 0,
      enableFeedback: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 25),
      visualDensity: VisualDensity.compact,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      labelStyle: const TextStyle(fontSize: 14),
      filled: true,
      fillColor: const Color(0xFF3E4358),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(24)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
  );
}
