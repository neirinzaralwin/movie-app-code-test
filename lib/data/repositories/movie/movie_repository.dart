import 'dart:math';
import 'package:flutter_movie_code_test/data/models/popular_movies/popular_movies.dart';
import 'package:flutter_movie_code_test/singeletons/repo_sgl.dart';

class MovieRepository {
  Future<PopularMovies> getPopularMovies() async {
    bool isOnline = Random().nextBool();

    if (!isOnline) {
      // final result = await DbSingeleton.popularMovies.getTable();
      // return PopularMovieResult.fromJson(result);
    }

    final result = await RepoSingeleton.movie.getPopularMovies() as Map<String, dynamic>;
    return PopularMovies.fromJson(result);
  }
}
