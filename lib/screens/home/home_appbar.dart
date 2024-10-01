import 'package:flutter/material.dart';
import 'package:flutter_movie_code_test/constants/app_const.dart';
import 'package:flutter_movie_code_test/core/custom_text_styles.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Align(
      alignment: Alignment.centerLeft,
      child: Text(AppConst.appName).headLargeBold.primaryColor,
    ),
  );
}
