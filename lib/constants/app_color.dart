import 'package:flutter/material.dart';

class AppColor {
  static const Color swatch = Color(0xff000000);
  static const Color primaryColorLight = Color.fromARGB(255, 226, 217, 240);
  static const Color secondaryColor = Color.fromARGB(255, 24, 24, 24);
  static const Color primaryColor = Colors.deepPurple;
  static const Color mildGreen = Color.fromARGB(255, 205, 221, 213);
  static const Color green = Colors.green;
  static const Color extremeGreen = Color.fromARGB(255, 0, 252, 8);
  static const Color mintGreen = Color.fromARGB(255, 38, 187, 172);
  static const Color iosGreen = Color.fromARGB(255, 20, 232, 87);
  static const Color blueColor = Color.fromARGB(255, 4, 165, 226);
  static const Color buttonColor = Color(0xffba7967);
  static const Color redColor = Color.fromARGB(255, 189, 44, 4);
  static const Color mildRed = Color.fromARGB(255, 230, 205, 198);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xffa8a8a8);
  static const Color defaultTextColor = Color(0xffa8a8a8);
  static const Color scaffoldBackgroundColor = Colors.white;
}

const Gradient g1 = LinearGradient(
  colors: [AppColor.secondaryColor, AppColor.primaryColor],
);
const Gradient g2 = LinearGradient(
  colors: [AppColor.black, Color.fromARGB(255, 51, 51, 51)],
);
const Gradient shimmerDarkGradient = LinearGradient(
  colors: [
    AppColor.black,
    Color.fromARGB(255, 51, 51, 51),
    AppColor.black,
    Color.fromARGB(255, 51, 51, 51)
  ],
);
const Gradient shimmerLightGradient = LinearGradient(
  colors: [
    Colors.white,
    Color.fromARGB(255, 222, 222, 222),
    Colors.white,
    Color.fromARGB(255, 222, 222, 222)
  ],
);
