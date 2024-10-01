import 'package:flutter_movie_code_test/data/models/popular_movies/popular_movies.dart';
import 'package:flutter_movie_code_test/singeletons/db_sgl.dart';

class MovieDatasource {
  Future<PopularMovieResult> getPopularMovies() async {
    final result = await DbSingeleton.popularMovies.getTable();
    return PopularMovieResult.fromJson(result);
  }
}
