import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/configs/app_config.dart';
import 'package:flutter_movie_code_test/configs/app_theme.dart';
import 'package:flutter_movie_code_test/constants/app_const.dart';
import 'package:flutter_movie_code_test/logic/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:flutter_movie_code_test/logic/blocs/wishlist/wishlist_bloc.dart';
import 'configs/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appConfig(isProduction: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PopularMoviesBloc()),
          BlocProvider(create: (context) => WishlistBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConst.appName,
          theme: appThemeData,
          // home: const HomeScreen(),
          initialRoute: '/',
          routes: routes,
        ));
  }
}
