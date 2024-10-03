import 'package:flutter_movie_code_test/data/dto/popular_movies/popular_movies_model.dart';
import 'package:flutter_movie_code_test/singeletons/db_sgl.dart';

class MovieDatasource {
  Future<List<PopularMovieResult>> getUpcomingMovies() async {
    final operation = DbSingeleton.upcomingMovies;
    final movieList = await operation.getUpcomingMovies();

    return movieList.map((e) => PopularMovieResult.fromJson(e)).toList();
  }

  Future<PopularMovies> getPopularMovies() async {
    final operation = DbSingeleton.popularMovies;
    final movieList = await operation.getPopularMovies();
    final paginatedTable = await operation.getPaginatedPopularMovies();

    return PopularMovies(
        page: paginatedTable['page'],
        results: movieList.map((e) => PopularMovieResult.fromJson(e)).toList(),
        totalPages: paginatedTable['total_pages'],
        totalPopularMovieResults: paginatedTable['total_popular_movie_results']);
  }

  Future<void> insertOrReplace(PopularMovies model) async {
    final operation = DbSingeleton.popularMovies;
    await operation.insertOrReplaceMovies(model);
  }

  Future<void> insertOrReplaceUpcomingMovies(PopularMovies model) async {
    final operation = DbSingeleton.upcomingMovies;
    await operation.insertOrReplaceMovies(model);
  }
}
