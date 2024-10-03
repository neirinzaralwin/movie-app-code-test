import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/constants/app_color.dart';
import 'package:flutter_movie_code_test/core/custom_text_styles.dart';
import 'package:flutter_movie_code_test/logic/blocs/upcoming_movies/upcoming_bloc.dart';

class UpcomingMoviesWidget extends StatefulWidget {
  const UpcomingMoviesWidget({super.key});

  @override
  State<UpcomingMoviesWidget> createState() => _UpcomingMoviesWidgetState();
}

class _UpcomingMoviesWidgetState extends State<UpcomingMoviesWidget> {
  final double carouselHeight = 400.0;

  @override
  void initState() {
    context.read<UpcomingBloc>().add(GetUpcomingMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Text("Upcoming Movies").headSmallBold,
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          height: carouselHeight,
          child: BlocBuilder<UpcomingBloc, UpcomingState>(builder: (context, state) {
            if (state is UpcomingMovLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is UpcomingLoaded) {
              return CarouselSlider(
                  options: CarouselOptions(height: carouselHeight),
                  items: state.movies.map((movie) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          File(movie.posterPath ?? ''),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: carouselHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    );
                  }).toList());
            } else if (state is UpcomingError) {
              return Center(
                  child: Text(
                state.message,
                style: TextStyle(color: AppColor.redColor),
              ));
            } else {
              return const SizedBox();
            }
          }),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
