import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/data/local_datasource/movie/movie_datasource.dart';
import 'package:flutter_movie_code_test/singeletons/repo_sgl.dart';

class MovieRepository {
  Future<PopularMovies> getPopularMovies() async {
    final local = MovieDatasource();
    try {
      final result = await RepoSingeleton.movie.getPopularMovies();
      PopularMovies model = await PopularMovies.fromJsonAsync(result);
      await local.insertOrReplace(model);
    } catch (_) {}
    return local.getPopularMovies();
  }

  Future<List<PopularMovieResult>> getUpcomingMovies() async {
    final local = MovieDatasource();
    try {
      final result = await RepoSingeleton.movie.getUpcomingMovies();
      PopularMovies model = await PopularMovies.fromJsonAsync(result);
      await local.insertOrReplaceUpcomingMovies(model);
    } catch (_) {}
    return local.getUpcomingMovies();
  }
}
