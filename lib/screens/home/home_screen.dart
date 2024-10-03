import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/constants/app_color.dart';
import 'package:flutter_movie_code_test/logic/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:flutter_movie_code_test/logic/blocs/upcoming_movies/upcoming_bloc.dart';
import 'package:flutter_movie_code_test/logic/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_movie_code_test/screens/home/upcoming/upcoming_movies_widget.dart';
import 'home_appbar.dart';
import 'popular/popular_movies_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(context),
        body: RefreshIndicator(
          onRefresh: _refreshMovies,
          color: AppColor.grey,
          backgroundColor: AppColor.black,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: UpcomingMoviesWidget(),
              ),
              SliverToBoxAdapter(
                child: PopularMoviesWidget(),
              ),
            ],
          ),
        ));
  }

  Future<void> _refreshMovies() async {
    context.read<UpcomingBloc>().add(GetUpcomingMovies());
    context.read<WishlistBloc>().add(GetWishListEvent());
    context.read<PopularMoviesBloc>().add(GetPopularMovies());
    await Future.delayed(Duration(seconds: 1));
    return Future.value();
  }
}
