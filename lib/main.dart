import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/configs/app_config.dart';
import 'package:flutter_movie_code_test/configs/app_theme.dart';
import 'package:flutter_movie_code_test/constants/app_const.dart';
import 'package:flutter_movie_code_test/logic/blocs/bloc/popular_movies_bloc.dart';
import 'screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appConfig(isProduction: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PopularMoviesBloc())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConst.appName,
          theme: appThemeData,
          home: const HomeScreen(),
        ));
  }
}
