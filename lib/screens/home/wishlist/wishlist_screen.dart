import 'dart:io';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
  void initState() {
    context.read<WishlistBloc>().add(GetWishListEvent());
    super.initState();
  }

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
            if (state.movies.isEmpty) return const Center(child: Text('No movies in wishlist'));

            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final movie = state.movies[index];

                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movie.title ?? '').bodyLargeBold.white,
                                  Text(movie.releaseDate ?? '').bodyMedium,
                                ],
                              ),
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
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            left: 5.0,
                            top: 0,
                            child: IconButton.filled(
                                style: IconButton.styleFrom(backgroundColor: AppColor.grey),
                                onPressed: () {
                                  context
                                      .read<WishlistBloc>()
                                      .add(RemoveWishListEvent(movie: movie));
                                },
                                icon: Icon(FluentIcons.delete_12_filled, color: AppColor.black)))
                      ],
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
