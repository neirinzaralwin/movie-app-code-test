import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_code_test/constants/app_color.dart';
import 'package:flutter_movie_code_test/core/custom_text_styles.dart';
import 'package:flutter_movie_code_test/logic/blocs/wishlist/wishlist_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
        ),
        body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is WishlistError) {
            return Center(
                child: Text(
              state.message,
              style: TextStyle(color: AppColor.redColor),
            ));
          }
          if (state is WishlistLoaded) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final movie = state.movies[index];

                    return ListTile(
                      title: Text(movie.title!).bodyLargeBold.white,
                      subtitle: Text(
                        movie.overview!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).bodyMedium,
                      trailing: Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        width: 120.0,
                        child: ClipRRect(
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
                      ),
                    );
                  }, childCount: state.movies.length),
                )
              ],
            );
          }
          return SizedBox();
        }));
  }
}
