import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/constants/app_color.dart';
import 'package:flutter_movie_code_test/core/custom_text_styles.dart';
import 'package:flutter_movie_code_test/logic/blocs/popular_movies/popular_movies_bloc.dart';

class PopularMoviesWidget extends StatefulWidget {
  const PopularMoviesWidget({super.key});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  final bloc = PopularMoviesBloc();

  @override
  void initState() {
    bloc.add(GetPopularMovies());
    super.initState();
  }

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
              bloc: bloc,
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
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.file(
                                    File(movie.posterPath ?? ''),
                                    fit: BoxFit.cover,
                                    width: 120.0,
                                    height: 160.0,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                                Text(
                                  movie.title ?? "",
                                  overflow: TextOverflow.ellipsis,
                                ).bodyMedium.white,
                              ],
                            ),

                            // gradient top left background
                            Positioned(
                              right: 0.0,
                              top: 0.0,
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                padding: const EdgeInsets.all(5.0),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black, Colors.transparent],
                                  ),
                                ),
                                child: Center(
                                  child:
                                      Icon(FluentIcons.bookmark_16_regular, color: AppColor.white),
                                ),
                              ),
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
