import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/constants/api_const.dart';
import 'package:flutter_movie_code_test/core/custom_text_styles.dart';
import 'package:flutter_movie_code_test/logic/blocs/bloc/popular_movies_bloc.dart';

class PopularMoviesWidget extends StatefulWidget {
  const PopularMoviesWidget({super.key});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Text("Popular Movies").headSmallBold,
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          height: 200.0,
          child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              bloc: BlocProvider.of<PopularMoviesBloc>(context)..add(const GetPopularMovies()),
              builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
                if (state is PopularMoviesError) {
                  return Center(child: Text(state.message!).bodyMedium.redColor);
                }
                if (state is PopularMoviesLoaded) {
                  final movieList = state.model.results!;
                  if (movieList.isEmpty) {
                    return Center(child: Text("Empty").bodyMedium);
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {
                      final movie = movieList[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        width: 120.0,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                "${ApiConst.imagePath}${movie.posterPath}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Text(
                                movie.title!,
                                overflow: TextOverflow.ellipsis,
                              ).bodyMedium.white,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              }),
        ),
      ],
    );
  }
}
