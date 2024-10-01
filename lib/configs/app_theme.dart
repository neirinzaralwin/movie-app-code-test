import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_color.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: primaryswatch,
  scaffoldBackgroundColor: AppColor.black,
  colorScheme: const ColorScheme.light(primary: AppColor.black),
  dialogBackgroundColor: AppColor.white,
  applyElevationOverlayColor: false,
  dataTableTheme: const DataTableThemeData(
    dividerThickness: 0.2,
    headingTextStyle: TextStyle(color: AppColor.primaryColor),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColor.black,
    iconTheme: IconThemeData(color: AppColor.grey),
    titleTextStyle: TextStyle(
      color: AppColor.white,
      fontWeight: FontWeight.w500,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      fixedSize: const Size.fromHeight(40.0),
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColor.defaultTextColor),
    displayMedium: TextStyle(color: AppColor.defaultTextColor),
    displaySmall: TextStyle(color: AppColor.defaultTextColor),
    headlineLarge: TextStyle(color: AppColor.defaultTextColor),
    headlineMedium: TextStyle(color: AppColor.defaultTextColor),
    headlineSmall: TextStyle(color: AppColor.defaultTextColor),
    titleLarge: TextStyle(color: AppColor.defaultTextColor),
    titleMedium: TextStyle(color: AppColor.defaultTextColor),
    titleSmall: TextStyle(color: AppColor.defaultTextColor),
    bodyLarge: TextStyle(color: AppColor.defaultTextColor),
    bodyMedium: TextStyle(color: AppColor.defaultTextColor),
    bodySmall: TextStyle(color: AppColor.defaultTextColor),
    labelLarge: TextStyle(color: AppColor.defaultTextColor),
    labelMedium: TextStyle(color: AppColor.defaultTextColor),
    labelSmall: TextStyle(color: AppColor.defaultTextColor),
  ),
  dropdownMenuTheme: const DropdownMenuThemeData(
    textStyle: TextStyle(color: AppColor.black, fontSize: 14.0),
  ),
  useMaterial3: true,
);

final primaryswatch = MaterialColor(AppColor.swatch.value, {
  50: tintColor(AppColor.swatch, 0.9),
  100: tintColor(AppColor.swatch, 0.8),
  200: tintColor(AppColor.swatch, 0.6),
  300: tintColor(AppColor.swatch, 0.4),
  400: tintColor(AppColor.swatch, 0.2),
  500: AppColor.swatch,
  600: shadeColor(AppColor.swatch, 0.1),
  700: shadeColor(AppColor.swatch, 0.2),
  800: shadeColor(AppColor.swatch, 0.3),
  900: shadeColor(AppColor.swatch, 0.4),
});

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor), tintValue(color.green, factor), tintValue(color.blue, factor), 1);

int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(shadeValue(color.red, factor),
    shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);
