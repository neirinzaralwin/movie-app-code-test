import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_code_test/constants/app_color.dart';
import 'package:flutter_movie_code_test/constants/app_const.dart';
import 'package:flutter_movie_code_test/constants/app_routes.dart';
import 'package:flutter_movie_code_test/core/custom_text_styles.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    title: Align(
      alignment: Alignment.centerLeft,
      child: Text(AppConst.appName).headLargeBold.primaryColor,
    ),
    actions: [
      IconButton(
          icon: Icon(
            FluentIcons.star_12_filled,
            color: AppColor.primaryColorLight,
          ),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.wishlist))
    ],
  );
}
