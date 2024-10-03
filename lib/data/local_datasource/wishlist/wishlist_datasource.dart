import 'package:flutter/material.dart';
import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/singeletons/db_sgl.dart';

class WishlistDatasource {
  Future<List<PopularMovieResult>> getWishlistMovies() async {
    final operation = DbSingeleton.wishlistMovies;
    final movieList = await operation.getWishlistMovies();
    // same model with popular movies
    return movieList.map((e) => PopularMovieResult.fromJson(e)).toList();
  }

  Future<void> insertOrReplace(PopularMovieResult movie) async {
    debugPrint("insert path -> ${movie.posterPath}");
    final operation = DbSingeleton.wishlistMovies;
    await operation.insertOrReplaceMovies(movie);
  }

  Future<void> remove(int id) async {
    final operation = DbSingeleton.wishlistMovies;
    await operation.deleteMovie(id);
  }
}
