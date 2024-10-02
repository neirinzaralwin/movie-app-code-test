import 'package:flutter/material.dart';
import 'package:flutter_movie_code_test/constants/app_routes.dart';
import 'package:flutter_movie_code_test/screens/home/home_screen.dart';
import 'package:flutter_movie_code_test/screens/home/wishlist/wishlist_screen.dart';

final Map<String, WidgetBuilder> routes = {
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.wishlist: (context) => const WishlistScreen(),
};
